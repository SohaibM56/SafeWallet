import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:safewallet/app/config/app_routes.dart';
import 'package:safewallet/app/config/app_strings.dart';
import 'package:safewallet/app/config/app_text_style.dart';
import 'package:safewallet/app/widgets/app_custom_button.dart';
import 'package:safewallet/app/widgets/sizedbox_extension.dart';

import '../../../config/app_assets.dart';
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(AppAssets.getStartedLogo)
                .animate()
                .fadeIn(duration: 1000.ms, delay: 300.ms)
                .scale(begin: const Offset(0.3, 0.3), end: const Offset(1, 1), duration: 1200.ms, curve: Curves.elasticOut)
                .then()
                .shimmer(delay: 1800.ms, duration: 1200.ms, color: AppColors.primary.withOpacity(0.4))
                .then(),
            24.h.height,
            Image.asset(
              AppAssets.getStartedMain,
              width: double.infinity,
              height: 330.h,
            ).animate().fadeIn(duration: 800.ms, delay: 1000.ms).slideX(begin: -0.5, end: 0, duration: 900.ms, curve: Curves.easeOutBack).then(),
            10.h.height,
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppStrings.getStartedText,
                style: AppTextStyles.customText(color: Colors.white, fontSize: 32.sp, fontWeight: FontWeight.w600, height: 1.3, letterSpacing: 0.2),
                textAlign: TextAlign.left,
              ).animate().fadeIn(duration: 700.ms, delay: 1400.ms).slideY(begin: 0.5, end: 0, duration: 800.ms, curve: Curves.easeOutCubic).then(),
            ),
            5.h.height,
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppStrings.getStartedDesc,
                style: AppTextStyles.customText(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w500, height: 1.5, letterSpacing: 0.4),
                textAlign: TextAlign.left,
              ).animate().fadeIn(duration: 700.ms, delay: 1400.ms).slideY(begin: 0.5, end: 0, duration: 800.ms, curve: Curves.easeOutCubic).then(),
            ),
            50.h.height,
            AppCustomButton(
                  title: AppStrings.getStarted,
                  onPressed: () {
                    Get.toNamed(AppRoutes.setupWalletView);
                  },
                  height: 56.h,
                )
                .paddingAll(24.sp)
                .animate()
                .fadeIn(duration: 800.ms, delay: 1800.ms)
                .slideY(begin: 1.0, end: 0, duration: 900.ms, curve: Curves.easeOutBack)
                .then()
                .shimmer(delay: 2600.ms, duration: 1800.ms, color: Colors.white.withOpacity(0.4))
                .then()
                .scaleXY(delay: 3200.ms, duration: 800.ms, begin: 1, end: 1.03, curve: Curves.easeInOut)
                .then()
                .scaleXY(duration: 800.ms, begin: 1.03, end: 1, curve: Curves.easeInOut)
                .then()
                .shake(delay: 4500.ms, hz: 3, duration: 1000.ms, curve: Curves.elasticOut),
          ],
        ).paddingAll(22.sp),
      ),
    );
  }
}
