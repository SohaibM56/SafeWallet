import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:safewallet/app/config/app_routes.dart';
import 'package:safewallet/app/config/app_strings.dart';
import 'package:safewallet/app/config/app_text_style.dart';
import 'package:safewallet/app/config/padding_extensions.dart';
import 'package:safewallet/app/widgets/app_custom_button.dart';
import 'package:safewallet/app/widgets/app_custom_field.dart';
import 'package:safewallet/app/widgets/app_logol/app_logo_widget.dart';
import 'package:safewallet/app/widgets/sizedbox_extension.dart';

import '../../../config/app_colors.dart';

class GetStartedView extends StatefulWidget {
  const GetStartedView({super.key});

  @override
  State<GetStartedView> createState() => _GetStartedViewState();
}

class _GetStartedViewState extends State<GetStartedView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              150.h.height,

              // Logo Animation
              AppLogoWidget()
                  .animate()
                  .fadeIn(duration: 400.ms)
                  .scaleXY(begin: 0.9, end: 1.0, curve: Curves.easeOutBack)
                  .moveY(begin: -20, end: 0, curve: Curves.easeOutCubic),

              140.h.height,

              // Title Text
              Text(
                    AppStrings.getStartedText,
                    style: AppTextStyles.customText16(color: Colors.white, fontWeight: FontWeight.w600),
                  )
                  .animate()
                  .fadeIn(duration: 400.ms, delay: 150.ms)
                  .slideY(begin: 0.25, end: 0, duration: 500.ms, curve: Curves.easeOutCubic)
                  .scaleXY(begin: 0.98, end: 1.0, curve: Curves.easeOutBack),

              10.h.height,

              // Input Field
              AppCustomField(
                    hintText: AppStrings.getStartedHintText.tr,
                    isSecondField: true,
                    keyboardType: TextInputType.text,
                    fieldsTextAlign: TextAlign.left,
                    textInputAction: TextInputAction.done,
                    contentPadding: EdgeInsets.all(20.sp),
                    maxLength: 10,
                  )
                  .animate()
                  .fadeIn(duration: 400.ms, delay: 250.ms)
                  .slideY(begin: 0.25, end: 0, duration: 500.ms, curve: Curves.easeOutCubic)
                  .scaleXY(begin: 0.98, end: 1.0, curve: Curves.easeOutBack),

              20.h.height,

              // Get Started Button
              AppCustomButton(
                    title: AppStrings.getStartedBtn,
                    showShadow: true,
                    suffixIcon: Icon(Icons.arrow_forward, size: 25.sp, color: AppColors.white),
                    onPressed: () {
                      Get.toNamed(AppRoutes.verificationStepsView);
                    },
                    height: 56.h,
                  )
                  .paddingHorizontal(20.w)
                  .animate()
                  .fadeIn(duration: 400.ms, delay: 350.ms)
                  .slideY(begin: 0.5, end: 0, duration: 600.ms, curve: Curves.easeOutBack)
                  .scaleXY(begin: 0.97, end: 1.0, curve: Curves.easeInOut),
            ],
          ).paddingHorizontal(15.w),
        ),
      ),
    );
  }
}
