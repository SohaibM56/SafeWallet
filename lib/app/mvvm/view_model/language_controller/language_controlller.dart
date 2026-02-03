import 'package:get/get.dart';
import 'package:safewallet/app/mvvm/model/body_model/language_body_model.dart';

class LanguageControlller extends GetxController {
  final RxString selectedLanguage = 'English'.obs;
  RxList<LanguageBodyModel> languages = [
    LanguageBodyModel(language: 'English', imageUrl: "https://www.flaginstitute.org/wp/wp-content/uploads/flags/UNKG0001.png"),
    LanguageBodyModel(language: 'Arabic عربي', imageUrl: "https://cms.saudiflag.sa/uploads/flag_cb4beab1dd.jpg"),
  ].obs;

  void selectLanguage(String lang) {
    selectedLanguage.value = lang;
  }
}
