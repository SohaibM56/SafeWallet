import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePinController extends GetxController {
  TextEditingController pinController = TextEditingController();
  TextEditingController newPinController = TextEditingController();
  TextEditingController confirmPinController = TextEditingController();

  void completeSetup() {
    final pin = pinController.text.trim();
    final newPin = newPinController.text.trim();
    final confirm = confirmPinController.text.trim();
  }

  @override
  void onClose() {
    pinController.dispose();
    newPinController.dispose();
    confirmPinController.dispose();
    super.onClose();
  }
}