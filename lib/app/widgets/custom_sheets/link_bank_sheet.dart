import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:safewallet/app/config/app_routes.dart';
import 'package:safewallet/app/config/app_text_style.dart';
import 'package:safewallet/app/config/padding_extensions.dart';
import 'package:safewallet/app/widgets/app_custom_button.dart';
import 'package:safewallet/app/widgets/sizedbox_extension.dart';

import '../../config/app_assets.dart';
import '../../config/app_colors.dart';

class LinkBankSheet extends StatelessWidget {
  const LinkBankSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: AnimatedPadding(
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeOut,
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SafeArea(
          maintainBottomViewPadding: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        "Link KSA Bank Account",
                        style: AppTextStyles.customText18(
                          fontWeight: FontWeight.w800,
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

                16.h.height,

                Text(
                  "IBAN Number",
                  style: AppTextStyles.customText(
                    fontSize: 13.sp,
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                10.h.height,

                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.faintBgColor,
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  child: TextFormField(
                    style: AppTextStyles.customText(
                      fontSize: 13.sp,
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: InputDecoration(
                      hintText: "S A X X  X X X X  X X X X...",
                      filled: false,
                      fillColor: AppColors.black.withValues(alpha: 0.05),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 16.h,
                      ),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ),

                5.h.height,

                Text(
                  "Enter your Saudi Arabian IBAN (24 characters)",
                  style: AppTextStyles.customText(
                    fontSize: 12.sp,
                    color: AppColors.primary.withValues(alpha: 0.3),
                    fontWeight: FontWeight.w600,
                  ),
                ),

                20.h.height,

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Account Holder Name",
                      style: AppTextStyles.customText(
                        fontSize: 13.sp,
                        color: AppColors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                   Image.asset(AppAssets.nafathBadge, width: 110.w, height: 27.h),
                  ],
                ).paddingRight(5.w),

                10.h.height,

                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.faintBgColor,
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  child:
                  TextFormField(
                    style: AppTextStyles.customText(
                      fontSize: 13.sp,
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: InputDecoration(
                      hintText: "Ahmed Mohammed Al-Saud",
                      filled: false,
                      fillColor: AppColors.black.withValues(alpha: 0.05),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 16.h,
                      ),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),

                  // Text(
                  //   "Ahmed Mohammed Al-Saud",
                  //   style: AppTextStyles.customText(
                  //     fontSize: 13.sp,
                  //     color: AppColors.primary.withValues(alpha: 0.5),
                  //     fontWeight: FontWeight.w600,
                  //   ),
                  // ),
                ),

                24.h.height,

                Align(
                  alignment: Alignment.center,
                  child: Text(
                    textAlign: TextAlign.center,
                    "This link enables direct SAR deposits and\nwithdrawals",
                    style: AppTextStyles.customText(
                      fontSize: 11.sp,
                      color: AppColors.black.withValues(alpha: 0.3),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                10.h.height,

                AppCustomButton(
                  title: "Confirm & Link Account",
                  onPressed: () {
                    Get.back();
                    Get.toNamed(AppRoutes.buyAssetView);
                  },
                ).paddingHorizontal(30.w),

                16.h.height,

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Image.asset(AppAssets.shieldPrivate, width: 20.w, height: 20.h),
                    5.w.width,
                    Text(
                    "Transaction secured under SAMA and MOF compliance\nframeworks.",
                    style: AppTextStyles.customText(
                      fontSize: 10.sp,
                      color: AppColors.secondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],),

                5.h.height,
              ],
            ).paddingAll(20.sp),
          ),
        ),
      ),
    );
  }
}
