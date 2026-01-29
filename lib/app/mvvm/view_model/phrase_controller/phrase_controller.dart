import 'package:get/get.dart';
import 'package:safewallet/app/widgets/custom_snackbar/custom_snackbar.dart';

class PhraseController extends GetxController {
  Rx<RecoveryPhase> phase = RecoveryPhase.generate.obs;
  RxList<String> selectedWords = <String>[].obs;
  RxBool is12Words = true.obs;
  RxBool isWordHide = false.obs;

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

  void selectWords(bool value) {
    is12Words.value = value;
  }

  void hideWords() {
    isWordHide.value = !isWordHide.value;
  }

  void toggleWord(String word) {
    if (selectedWords.contains(word)) {
      selectedWords.remove(word);
    } else {
      if (selectedWords.length >= 12) {
        PremiumSnackbar.warning([
          "Limit reached - You can select max 12 words",
        ]);

        return;
      }
      selectedWords.add(word);
    }
  }
}

enum RecoveryPhase { generate, verify, complete }
