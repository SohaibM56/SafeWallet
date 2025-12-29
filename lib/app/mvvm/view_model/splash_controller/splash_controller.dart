import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safewallet/app/config/utils.dart';
import 'package:safewallet/app/widgets/custom_sheets/language_select_sheet.dart';

class SplashController extends GetxController {
  Future<void> showLanguageSheet(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    Utils.showBottomSheet(context: context, child: LangugaeSelectSheet());
  }
}
