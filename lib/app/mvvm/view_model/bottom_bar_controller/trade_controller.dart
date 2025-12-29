import 'package:get/get.dart';
import 'package:safewallet/app/mvvm/model/body_model/balance_body_model.dart';

class TradeController extends GetxController {
  Rx<BalanceBody?> selectedBalance = Rx<BalanceBody?>(null);
}
