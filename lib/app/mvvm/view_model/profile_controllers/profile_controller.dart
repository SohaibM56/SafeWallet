import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../services/logger_service.dart';

class ProfileController extends GetxController {
  Rx<File?> rXFile = Rx<File?>(null); // Profile image

  final ImagePicker picker = ImagePicker();

  final RxBool isToggleEnabled = true.obs;
  final selectedCurrency = 'Dollar'.obs;

  final List<String> currencies = ['Dollar', 'Riyal', 'Naira'];

  void selectCurrency(String currency) {
    selectedCurrency.value = currency;
  }

  bool isSelected(String currency) {
    return selectedCurrency.value == currency;
  }

  Future<void> pickImage({
    required Rx<File?> target,
    required ImageSource source,
  }) async {
    try {
      final XFile? pickedFile = await picker.pickImage(source: source);
      if (pickedFile != null) {
        target.value = File(pickedFile.path);
      }
    } catch (e) {
      LoggerService.e('Error picking image: $e');
    }
  }

  /// Pick profile image from gallery
  Future<void> pickProfileFromGallery() async =>
      pickImage(target: rXFile, source: ImageSource.gallery);

  /// Pick profile image from camera
  Future<void> pickProfileFromCamera() async =>
      pickImage(target: rXFile, source: ImageSource.camera);
}
