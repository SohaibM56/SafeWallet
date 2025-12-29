import 'package:get/get.dart';

class SnipperToolController extends GetxController {
  RxBool isOnLaunch = true.obs;

  void setTrigger(bool value) {
    isOnLaunch.value = value;
  }
}
