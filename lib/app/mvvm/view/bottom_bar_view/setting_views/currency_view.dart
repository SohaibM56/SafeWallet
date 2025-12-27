import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:safewallet/app/widgets/custom_cards/currency_toggle_tile.dart';

import '../../../../config/app_colors.dart';
import '../../../../config/app_text_style.dart';
import '../../../../widgets/custom_app_bar.dart';
import '../../../../widgets/sizedbox_extension.dart';
import '../../../view_model/profile_controllers/profile_controller.dart';

class CurrencyView extends StatelessWidget {
  const CurrencyView({super.key});

  @override
  Widget build(BuildContext context) {

    final ProfileController controller = Get.find();

    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: CustomAppBar(
        title: 'Currency',
        titleColor: Colors.white,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.h.height,
          Text(
            'Select currency display',
            style: AppTextStyles.customText16(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          10.h.height,
          Obx(() => CurrencyToggleTile(
            currencyName: "Dollar",
            isSelected: controller.isSelected('Dollar'),
            onTap: () => controller.selectCurrency('Dollar'),
          )),

          Obx(() => CurrencyToggleTile(
            currencyName: "Riyal",
            isSelected: controller.isSelected('Riyal'),
            onTap: () => controller.selectCurrency('Riyal'),
          )),

          Obx(() => CurrencyToggleTile(
            currencyName: "Naira",
            isSelected: controller.isSelected('Naira'),
            onTap: () => controller.selectCurrency('Naira'),
          )),
        ],
      ).paddingSymmetric(horizontal: 20.w, vertical: 10.h).animate()
          .fadeIn(duration: 600.ms, delay: 300.ms)
          .scale(
        begin: const Offset(0.7, 0.7),
        curve: Curves.easeOutBack,
      ),
    );
  }
}
