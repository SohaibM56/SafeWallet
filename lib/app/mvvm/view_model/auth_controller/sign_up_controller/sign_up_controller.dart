import 'dart:io';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:safewallet/app/services/logger_service.dart';

class SignUpController extends GetxController {
  // --------------------- UI State ---------------------
  RxBool obscureText = true.obs;
  RxBool confirmObscureText = true.obs;
  // Rx<Country?> selectedCountry = Rx<Country?>(null);
  // AuthRepository authRepository = AuthRepository();

  // --------------------- Images ---------------------
  Rx<File?> rXfile = Rx<File?>(null); // Profile image

  // --------------------- User Input ---------------------
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  Rx<Country?> selectedCountry = Rx<Country?>(null);
  final TextEditingController phoneController = TextEditingController();

  // --------------------- Image Picker ---------------------
  final ImagePicker picker = ImagePicker();

  /// Generic reusable image picker
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
      pickImage(target: rXfile, source: ImageSource.gallery);

  /// Pick profile image from camera
  Future<void> pickProfileFromCamera() async =>
      pickImage(target: rXfile, source: ImageSource.camera);

  // --------------------- Country Picker ---------------------
  // void setSelectedCountry(Country country) {
  //   selectedCountry.value = country;
  //   debugPrint("Selected country: ${country.name} (+${country.phoneCode})");
  // }
  @override
  void onInit() {
    selectedCountry = Rx<Country?>(
      Country(
        phoneCode: '39',
        countryCode: 'IT',
        e164Sc: 0,
        geographic: true,
        level: 1,
        name: 'Italy',
        example: '3123456789',
        displayName: 'Italy (IT)',
        displayNameNoCountryCode: 'Italy',
        e164Key: '39',
      ),
    );
    super.onInit();
  }
}
