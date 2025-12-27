import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:safewallet/app/config/app_text_style.dart';
import 'package:safewallet/app/config/padding_extensions.dart';
import 'package:safewallet/app/widgets/app_custom_button.dart';
import 'package:safewallet/app/widgets/sizedbox_extension.dart';

import '../../config/app_assets.dart';
import '../../config/app_colors.dart';
import '../../config/app_routes.dart';

class CryptoWalletSheet extends StatelessWidget {
  const CryptoWalletSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    "Crypto Wallet UI",
                    style: AppTextStyles.customText18(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(Icons.close, color: AppColors.black, size: 22.sp),
                ),
              ],
            ).paddingRight(5.w),
            10.h.height,
            Text(
              textAlign: TextAlign.justify,
              "A production-ready crypto wallet interface with secure seed\nphrase generation, verification, and biometric transaction signing.",
              style: AppTextStyles.customText(
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            15.h.height,

            _builtOptionTile(AppAssets.keyIcon, "Seed Phrase Generation", "Generate a secure 12 or 24-word BIP-39\nrecovery phrase."),
            10.h.height,
            _builtOptionTile(AppAssets.privacyIcon, "Verification Flow", "Verify your backup with an intuitive\nword selection process."),
            10.h.height,
            _builtOptionTile(AppAssets.biometricIcon, "Biometric Security", "Confirm transactions with Face ID or\nfingerprint."),

            20.h.height,
            AppCustomButton(
              title: "Start Seed Phrase Flow",
              onPressed: () {
                Get.toNamed(AppRoutes.recoveryPhaseView);
              },
            ).paddingHorizontal(30.w),

            10.h.height,

            AppCustomButton(
              bgColor: AppColors.faintBgColor,
              title: "Try Send Transaction",
              textStyle: AppTextStyles.customText16(
                color: AppColors.black,
                fontWeight: FontWeight.w600,
              ),
              onPressed: () {
                // Get.toNamed(AppRoutes.getStartedView);
              },
            ).paddingHorizontal(30.w),
            14.h.height,
            Text(
              "Built with security-first principles • BIP-39 compatible",
              style: AppTextStyles.customText10(
                color: AppColors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ).paddingAll(20.sp),
      ),
    );
  }

  Widget _builtOptionTile(String icon, String title, String description) {
    return Container(
      padding: EdgeInsets.all(5.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.r),
        color: AppColors.faintBgColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(icon, width: 56.w, height: 56.h),
          10.w.width,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: AppTextStyles.customText18(
                    color: AppColors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  description,
                  style: AppTextStyles.customText(
                    fontSize: 9.sp,
                    color: AppColors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
