import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetLoader {
  static void showAppLoader() {
    if (Get.isDialogOpen == true) return;

    Get.dialog(
      const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );
  }

  static void hideAppLoader() {
    if (Get.isDialogOpen == true) {
      Get.back();
    }
  }
}
