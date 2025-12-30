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
    'Around',
    'Around',
    'Already',
    'Actress',
    'Adult',
    'Acid',
    'Again',
    'Apart',
    'Abstract',
    'Author',
  ].obs;

  RxList<String> selectionWords = [
    "Album",
    "Add",
    "Account",
    "Apology",
    "Athlete",
    "Another",
    "Annual",
    "Action",
    "Addict",
    "Artist",
    "Affair",
    "Artwork",
  ].obs;

  RxBool is12Words = true.obs;
  void selectWords(bool value) {
    log("message");
    is12Words.value = value;
  }
}

enum RecoveryPhase { generate, verify, complete }
