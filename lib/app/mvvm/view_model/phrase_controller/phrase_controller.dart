import 'package:get/get.dart';

class PhraseController extends GetxController {

  final phase = RecoveryPhase.generate.obs;

}

enum RecoveryPhase { generate, verify, complete }
