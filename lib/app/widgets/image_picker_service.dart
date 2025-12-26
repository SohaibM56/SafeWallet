import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:safewallet/app/config/utils.dart';
import 'package:safewallet/app/services/logger_service.dart';

class ImagePickerService extends GetxService {
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage({
    required Rx<File?> target,
    required BuildContext context,
    CameraDevice preferredCameraDevice = CameraDevice.rear,
    int imageQuality = 85,
  }) async {
    final ImageSource? source = await _showSourceDialog(context);

    if (source == null) return;

    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        imageQuality: imageQuality,
        preferredCameraDevice: preferredCameraDevice,
      );

      if (pickedFile != null) {
        target.value = File(pickedFile.path);
      }
    } catch (e) {
      LoggerService.e('Image picker error: $e');
    }
  }

  /// ✅ FIXED: dialog now RETURNS ImageSource
  Future<ImageSource?> _showSourceDialog(BuildContext context) {
    final Completer<ImageSource?> completer = Completer<ImageSource?>();

    Utils.showPickImageOptionsDialog(
      context,
      onCameraTap: () {
        Navigator.of(context).pop();
        completer.complete(ImageSource.camera);
      },
      onGalleryTap: () {
        Navigator.of(context).pop();
        completer.complete(ImageSource.gallery);
      },
    );

    return completer.future;
  }
}
