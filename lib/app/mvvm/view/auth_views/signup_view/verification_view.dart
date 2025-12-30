import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:safewallet/app/config/app_assets.dart';
import 'package:safewallet/app/config/app_routes.dart';
import 'package:safewallet/app/mvvm/view_model/auth_controller/login_controller/login_controller.dart';
import 'package:safewallet/app/widgets/app_custom_button.dart';
import 'package:safewallet/app/widgets/custom_back_button.dart';
import 'package:safewallet/app/widgets/sizedbox_extension.dart';

import '../../../../config/app_colors.dart';
import '../../../../config/app_strings.dart';
import '../../../../config/app_text_style.dart';

class VerificationView extends StatefulWidget {
  const VerificationView({super.key});

  @override
  State<VerificationView> createState() => _VerificationViewState();
}

class _VerificationViewState extends State<VerificationView> {
  final LoginController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: SizedBox(
          height: Get.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button
              CustomBackButton()
                  .animate()
                  .fadeIn(duration: 400.ms)
                  .slideX(begin: -0.3, curve: Curves.easeOut),

              30.h.height,

              Text(
                    AppStrings.indetityVerification,
                    style: AppTextStyles.customText24(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 100.ms)
                  .slideY(begin: -0.2, curve: Curves.easeOut),

              5.h.height,

              /// Subtitle
              Text(
                    AppStrings.indetityVerificationText,
                    style: AppTextStyles.customText14(
                      height: 1.2,
                      color: Colors.white.withValues(alpha: 0.7),
                      fontWeight: FontWeight.w400,
                    ),
                  )
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 200.ms)
                  .slideY(begin: -0.1, curve: Curves.easeOut),

              24.h.height,
              _identityVerificationMethods(
                    onTap: () {
                      Get.toNamed(AppRoutes.selfieVerificationView);
                    },
                    isSelected: true,
                    imgPath: AppAssets.selfieVerification,
                    title: AppStrings.selfieVerification,
                    subTitle: AppStrings.selfieVerificationText,
                  )
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 200.ms)
                  .slideY(begin: -0.1, curve: Curves.easeOut),

              16.h.height,
              _identityVerificationMethods(
                    onTap: () {
                      Get.toNamed(AppRoutes.idCardVerificationView);
                    },
                    isSelected: true,
                    imgPath: AppAssets.idCardVerification,
                    title: AppStrings.idCardVerification,
                    subTitle: AppStrings.idCardVerificationText,
                  )
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 250.ms)
                  .slideY(begin: -0.1, curve: Curves.easeOut),

              16.h.height,
              _identityVerificationMethods(
                    onTap: () {
                      Get.toNamed(AppRoutes.biometricVerificationView);
                    },
                    isSelected: false,
                    imgPath: AppAssets.biometricVerification,
                    title: AppStrings.bioMetric,
                    subTitle: AppStrings.bioMetricText,
                  )
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 300.ms)
                  .slideY(begin: -0.1, curve: Curves.easeOut),
              Spacer(),
              AppCustomButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.doneVerificationView);
                      // Get.toNamed(AppRoutes.biometriVerificationView);
                    },
                    title: AppStrings.next,
                  )
                  .paddingSymmetric(horizontal: 20.w)
                  .animate(delay: 1000.ms)
                  .fadeIn(duration: 600.ms)
                  .scale(
                    begin: const Offset(0.95, 0.95),
                    curve: Curves.easeOutBack,
                  ),
              30.h.height,
            ],
          ),
        ).paddingSymmetric(horizontal: 24.w),
      ),
    );
  }

  Widget _identityVerificationMethods({
    required VoidCallback? onTap,
    required String subTitle,
    required String title,
    required bool isSelected,
    required String imgPath,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(12.r),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.white),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imgPath, width: 20.w, color: AppColors.white),

            10.w.width,

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.customText16(
                      color: AppColors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  4.h.height,
                  Text(
                    subTitle,
                    style: AppTextStyles.customText12(
                      color: AppColors.white.withOpacity(0.8),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),

            Align(
              alignment: Alignment.center,
              child: Icon(
                Icons.check_circle_rounded,
                color: isSelected ? AppColors.secondary : AppColors.darkGrey,
                size: 24.w,
              ),
            ),
          ],
        ).paddingAll(13.sp),
      ),
    );
  }
}
