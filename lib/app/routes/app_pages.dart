import 'package:get/get.dart';

import '../screens/home_screen/controller/home_screen_binding.dart';
import '../screens/home_screen/home_screen.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static final routes = [

    /// Home Page
    GetPage(
      name: Routes.home,
      page: () => HomeScreen(),
      binding: HomeScreenBinding(),
    ),

  ];
}
