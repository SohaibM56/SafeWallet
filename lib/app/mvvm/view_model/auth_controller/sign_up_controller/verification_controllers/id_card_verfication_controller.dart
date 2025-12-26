import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safewallet/app/widgets/image_picker_service.dart';

class IDCardVerificationController extends GetxController {
  Rx<File?> rXFrontImage = Rx<File?>(null);
  Rx<File?> rXBackImage = Rx<File?>(null);
  ImagePickerService imagePickerService = ImagePickerService();

  Future<void> prickFrontImage(BuildContext context) async {
    imagePickerService.pickImage(target: rXFrontImage, context: context);
  }

  Future<void> prickBackImage(BuildContext context) async {
    imagePickerService.pickImage(target: rXBackImage, context: context);
  }
}
