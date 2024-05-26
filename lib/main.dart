import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zarity_task/app/screens/home_screen/controller/home_screen_binding.dart';
import 'app/routes/app_pages.dart';
import 'app/utils/scale_utility.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ScalingUtility(context: context)).setCurrentDeviceSize();
    return GetMaterialApp(
      title: 'Zarity Task',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: Routes.home,
      getPages: AppPages.routes,
      initialBinding: HomeScreenBinding(),
    );
  }
}
