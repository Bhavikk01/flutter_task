
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../models/article_model.dart';

class HomeScreenController extends GetxController {

  Rx<RxStatus> loadingData = RxStatus.loading().obs;
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  RxList<ArticleModel> articles = <ArticleModel>[].obs;
  RxList<ArticleModel> temp = <ArticleModel>[].obs;


  @override
  void onInit(){
    getArticleData();
    super.onInit();
  }

  getArticleData() async {
    loadingData.value = RxStatus.loading();
    QuerySnapshot<Map<String, dynamic>> data = await fireStore
        .collection('article')
        .get();
    for(var task in data.docs){
      articles.add(ArticleModel.fromJson(task.data()));
    }
    temp.addAll(articles);
    loadingData.value = RxStatus.success();
  }

  setFilter(String text){
    temp.clear();
    if(text == 'Immediate'){
      temp.addAll(articles.where((task) => task.date!.isAtSameMomentAs(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day))));
    }else if(text == 'This Month'){
      temp.addAll(articles.where((task) => task.date!.month == DateTime.now().month));
    }else if(text == 'This Week'){
      temp.addAll(articles.where((task) => task.date!.difference(DateTime.now()) <= const Duration(days: 7) && task.date!.difference(DateTime.now()) >= const Duration(days: -7)));
    }else if(text == 'Select Your Task'){
      temp.addAll(articles);
    }
  }

}