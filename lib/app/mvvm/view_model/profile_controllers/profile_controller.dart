import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:safewallet/app/mvvm/model/body_model/language_body_model.dart';

import '../../../services/logger_service.dart';

class ProfileController extends GetxController {
  final RxString selectedLanguage = 'English'.obs;

  Rx<File?> rXFile = Rx<File?>(null); // Profile image

  final ImagePicker picker = ImagePicker();

  final RxBool isToggleEnabled = true.obs;
  final selectedCurrency = 'Dollar'.obs;

  final List<String> currencies = ['Dollar', 'Riyal', 'Naira'];

  RxList<LanguageBodyModel> languages = [
    LanguageBodyModel(
      language: 'English',
      imageUrl:
          "https://www.flaginstitute.org/wp/wp-content/uploads/flags/UNKG0001.png",
    ),
    LanguageBodyModel(
      language: 'Arabic',
      imageUrl: "https://cms.saudiflag.sa/uploads/flag_cb4beab1dd.jpg",
    ),
  ].obs;

  void selectLanguage(String lang) {
    selectedLanguage.value = lang;
  }

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
