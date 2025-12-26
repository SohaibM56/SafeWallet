import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetDialog {
  void showSuccessDialog(String message) {
    Get.defaultDialog(
      title: "Success",
      middleText: message,
      confirm: TextButton(onPressed: () => Get.back(), child: const Text("OK")),
    );
  }

  void showErrorDialog(String message) {
    Get.defaultDialog(
      title: "Error",
      middleText: message,
      confirm: TextButton(onPressed: () => Get.back(), child: const Text("OK")),
    );
  }
}
