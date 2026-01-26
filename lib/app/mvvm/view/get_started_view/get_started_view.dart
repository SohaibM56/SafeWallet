import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:safewallet/app/config/app_routes.dart';
import 'package:safewallet/app/config/app_strings.dart';
import 'package:safewallet/app/config/app_text_style.dart';
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 100.h.height,
            AppLogoWidget()
                .animate()
                .fadeIn(duration: 1000.ms, delay: 300.ms)
                .scale(
                  begin: const Offset(0.3, 0.3),
                  end: const Offset(1, 1),
                  duration: 1200.ms,
                  curve: Curves.elasticOut,
                )
                .then()
                .shimmer(
                  delay: 1800.ms,
                  duration: 1200.ms,
                  color: AppColors.secondary.withValues(alpha: 0.4),
                )
                .then(),

            100.h.height,
            Text(
                  AppStrings.getStartedText,
                  style: AppTextStyles.customText16(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                )
                .animate()
                .fadeIn(duration: 700.ms, delay: 1400.ms)
                .slideY(
                  begin: 0.5,
                  end: 0,
                  duration: 800.ms,
                  curve: Curves.easeOutCubic,
                )
                .then(),
            140.h.height,
            SingleChildScrollView(
              child:
                  AppCustomField(
                        hintText: AppStrings.getStartedHintText.tr,
                        isSecondField: true,
                        keyboardType: TextInputType.text,
                        fieldsTextAlign: TextAlign.left,
                        contentPadding: EdgeInsets.all(20.sp),
                        maxLength: 10,
                      )
                      .animate()
                      .fadeIn(duration: 700.ms, delay: 1400.ms)
                      .slideY(
                        begin: 0.5,
                        end: 0,
                        duration: 800.ms,
                        curve: Curves.easeOutCubic,
                      )
                      .then(),
            ),
            20.h.height,
            AppCustomButton(
                  title: AppStrings.getStartedBtn,
                  suffixIcon: Icon(
                    Icons.arrow_forward,
                    size: 25.sp,
                    color: AppColors.white,
                  ),
                  onPressed: () {
                    // Get.toNamed(AppRoutes.setupWalletView);
                    Get.toNamed(AppRoutes.bottomBarView);
                  },
                  height: 56.h,
                )
                .animate()
                .fadeIn(duration: 800.ms, delay: 1800.ms)
                .slideY(
                  begin: 1.0,
                  end: 0,
                  duration: 900.ms,
                  curve: Curves.easeOutBack,
                )
                .then()
                .shimmer(
                  delay: 2600.ms,
                  duration: 1800.ms,
                  color: Colors.white.withOpacity(0.4),
                )
                .then()
                .scaleXY(
                  delay: 3200.ms,
                  duration: 800.ms,
                  begin: 1,
                  end: 1.03,
                  curve: Curves.easeInOut,
                )
                .then()
                .scaleXY(
                  duration: 800.ms,
                  begin: 1.03,
                  end: 1,
                  curve: Curves.easeInOut,
                )
                .then()
                .shake(
                  delay: 4500.ms,
                  hz: 3,
                  duration: 1000.ms,
                  curve: Curves.elasticOut,
                ),
          ],
        ),
      ),
    );
  }
}
