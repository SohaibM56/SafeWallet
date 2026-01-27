import 'package:get/get.dart';
import 'package:safewallet/app/mvvm/model/body_model/auto_lock_time_model.dart';

class AutoLockController extends GetxController {
  final RxString selectedLockTime = '2 Min'.obs;
  
  RxList<AutoLockBodyModel> lockTimes = [
    AutoLockBodyModel(
      timeLabel: '2 Min',
      imageUrl: "",
    ),
    AutoLockBodyModel(
      timeLabel: '5 Min',
      imageUrl: "",
    ),
    AutoLockBodyModel(
      timeLabel: '10 Min',
      imageUrl: "",
    ),
    AutoLockBodyModel(
      timeLabel: '30 Min',
      imageUrl: "",
    ),
    AutoLockBodyModel(
      timeLabel: 'Never',
      imageUrl: "",
    ),
  ].obs;

  void selectLockTime(String time) {
    selectedLockTime.value = time;
  }
}