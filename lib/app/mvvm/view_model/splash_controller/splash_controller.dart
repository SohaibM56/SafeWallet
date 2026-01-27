import 'package:get/get.dart';
import 'package:safewallet/app/config/app_routes.dart';

class SplashController extends GetxController {
  void decideaAndNavigation() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offAllNamed(AppRoutes.onboardingView);
  }
}
