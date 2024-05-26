import 'package:get/get.dart';
import 'package:zarity_task/app/screens/home_screen/controller/home_screen_controller.dart';

class HomeScreenBinding implements Bindings{

  @override
  void dependencies() {
    Get.put(HomeScreenController());
  }

}