import 'dart:developer';

import 'package:get/get.dart';

class PhraseController extends GetxController {
  final phase = RecoveryPhase.generate.obs;

  RxList<String> words = [
    'Adult',
    'Acid',
    'Again',
    'Anxiety',
    'Alley',
    'Ground',
    'Around',
    'Already',
    'Actress',
    'Young',
    'Base',
    'Before',
    'Apart',
    'Abstract',
    'Author',
  ].obs..shuffle();

  RxList<String> selectionWords = <String>[].obs;

  RxBool is12Words = true.obs;
  void selectWords(bool value) {
    log("message");
    is12Words.value = value;
  }

  void toggleWord(String word) {
    if (selectionWords.contains(word)) {
      selectionWords.remove(word);
    } else {
      if (selectionWords.length >= 12) {
        Get.snackbar("Limit reached", "You can select max 12 words", snackPosition: SnackPosition.BOTTOM);
        return;
      }
      selectionWords.add(word); // select
    }
  }
}

enum RecoveryPhase { generate, verify, complete }
