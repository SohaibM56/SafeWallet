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
              AppLogoWidget(),

              // .animate()
              // .fadeIn(duration: 500.ms) // faster
              // .scaleXY(begin: 0.85, end: 1.0, curve: Curves.easeOutBack),
              140.h.height,

              // Title Text
              Text(
                    AppStrings.getStartedText,
                    style: AppTextStyles.customText16(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                  .animate()
                  .fadeIn(duration: 500.ms, delay: 200.ms)
                  .slideY(
                    begin: 0.3,
                    end: 0,
                    duration: 600.ms,
                    curve: Curves.easeOutCubic,
                  ),

              10.h.height,

              // Input Field
              AppCustomField(
                    hintText: AppStrings.getStartedHintText.tr,
                    isSecondField: true,
                    keyboardType: TextInputType.text,
                    fieldsTextAlign: TextAlign.left,
                    contentPadding: EdgeInsets.all(20.sp),
                    maxLength: 10,
                  )
                  .animate()
                  .fadeIn(duration: 500.ms, delay: 350.ms)
                  .slideY(
                    begin: 0.3,
                    end: 0,
                    duration: 600.ms,
                    curve: Curves.easeOutCubic,
                  ),

              20.h.height,

              // Get Started Button
              AppCustomButton(
                    title: AppStrings.getStartedBtn,
                    suffixIcon: Icon(
                      Icons.arrow_forward,
                      size: 25.sp,
                      color: AppColors.white,
                    ),
                    onPressed: () {
                      Get.toNamed(AppRoutes.verificationStepsView);
                    },
                    height: 56.h,
                  )
                  .animate()
                  .fadeIn(duration: 500.ms, delay: 500.ms)
                  .slideY(
                    begin: 0.8,
                    end: 0,
                    duration: 700.ms,
                    curve: Curves.easeOutBack,
                  )
                  .then()
                  .scaleXY(
                    duration: 400.ms,
                    begin: 0.98,
                    end: 1.0,
                    curve: Curves.easeInOut,
                  ),
            ],
          ).paddingHorizontal(30.w),
        ),
      ),
    );
  }
}
