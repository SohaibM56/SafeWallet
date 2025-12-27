import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:safewallet/app/config/app_text_style.dart';
import 'package:safewallet/app/mvvm/view_model/phrase_controller/phrase_controller.dart';
import 'package:safewallet/app/widgets/sizedbox_extension.dart';

import '../../../../config/app_colors.dart';
import '../../../../widgets/custom_app_bar.dart';

class RecoveryPhaseView extends StatefulWidget {
  const RecoveryPhaseView({super.key});

  @override
  State<RecoveryPhaseView> createState() => _RecoveryPhaseViewState();
}

class _RecoveryPhaseViewState extends State<RecoveryPhaseView> {

  final PhraseController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: CustomAppBar(
        title: '',
        backgroundColor: Colors.transparent,
      ),
      body: Column(children: [
        Obx(() =>
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              _buildCircularView("01","Generate", controller.currentProgress.value == "01"),
              30.w.width,
              _buildCircularView("02", "Verify" ,controller.currentProgress.value == "02"),
              30.w.width,
              _buildCircularView("03", "Complete",controller.currentProgress.value == "03"),
            ],),
        ),

        20.h.height,

        Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Your Recovery Phrase',
            style: AppTextStyles.customText20(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        5.h.height,
        Text(
          'Write down these words in the exact order and\mstore them in a secure location.',
          style: AppTextStyles.customText(
            fontSize: 11.sp,
            color: Colors.white.withValues(alpha: 0.5),
            fontWeight: FontWeight.w400,
          ),
        ),

      ],).paddingSymmetric(horizontal: 20.w, vertical: 10.h),
    );
  }

  Widget _buildCircularView(String title, String subTitle, bool isSelected){
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16.sp),
          decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected?AppColors.secondary:AppColors.white.withValues(alpha: 0.2),
          border: Border.all(color: isSelected? AppColors.secondary :AppColors.white.withValues(alpha: 0.2))
        ),
        child: Text(title, style: AppTextStyles.customText18(color: isSelected? AppColors.white: AppColors.faintColor, fontWeight: FontWeight.w500)),
        ),
        5.h.height,
        Text(
          subTitle,
          style: AppTextStyles.customText12(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
