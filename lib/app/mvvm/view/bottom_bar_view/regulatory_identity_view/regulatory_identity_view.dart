import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:safewallet/app/config/app_assets.dart';
import 'package:safewallet/app/config/utils.dart';

import '../../../../config/app_colors.dart';
import '../../../../config/app_text_style.dart';
import '../../../../config/padding_extensions.dart';
import '../../../../widgets/app_custom_button.dart';
import '../../../../widgets/custom_app_bar.dart';
import '../../../../widgets/custom_sheets/link_bank_sheet.dart';
import '../../../../widgets/sizedbox_extension.dart';

class RegulatoryIdentityView extends StatelessWidget {
  const RegulatoryIdentityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: CustomAppBar(title: '', backgroundColor: Colors.transparent),
      body: Column(
        children: [
          Text(
            "Regulatory Identity & Vetting",
            style: AppTextStyles.customText(
              fontSize: 22.sp,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          )
              .animate()
              .fadeIn(duration: 400.ms)
              .slideY(begin: -0.1, end: 0),

          4.h.height,

          Text(
            "Complete verification to access financial services",
            style: AppTextStyles.customText(
              fontSize: 14.sp,
              color: Colors.white.withValues(alpha: 0.4),
              fontWeight: FontWeight.w400,
            ),
          ).animate().fadeIn(duration: 400.ms, delay: 100.ms),

          10.h.height,

          Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  AppAssets.completeGradient,
                  fit: BoxFit.fill,
                ),
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  5.h.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppAssets.privacyShieldIcon,
                        width: 45.w,
                        height: 45.h,
                      ),
                      10.w.width,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Step 1',
                              style: AppTextStyles.customText(
                                fontSize: 11.sp,
                                color: Colors.white.withValues(alpha: 0.5),
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            Text(
                              'Identity Verification',
                              style: AppTextStyles.customText(
                                fontSize: 18.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  10.h.height,

                  Text(
                    'Securely verify your identity through\nNAFATH, the national digital identity\nplatform.',
                    style: AppTextStyles.customText(
                      fontSize: 14.sp,
                      color: Colors.white.withValues(alpha: 0.5),
                      fontWeight: FontWeight.w500,
                    ),
                  ).paddingLeft(5.w),

                  14.h.height,

                  AppCustomButton(
                    title: "Verified via NAFATH",
                    onPressed: () {},
                  ).paddingHorizontal(30.w),

                  5.h.height,
                ],
              ).paddingAll(10.sp),
            ],
          )
              .animate()
              .fadeIn(duration: 500.ms, delay: 200.ms)
              .slideY(begin: 0.1, end: 0),

          16.h.height,

          Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  AppAssets.transparentFill,
                  fit: BoxFit.fill,
                ),
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  5.h.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppAssets.boardIcon,
                        width: 45.w,
                        height: 45.h,
                      ),
                      10.w.width,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Step 2',
                              style: AppTextStyles.customText(
                                fontSize: 11.sp,
                                color: Colors.white.withValues(alpha: 0.5),
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            Text(
                              'Regulatory Vetting',
                              style: AppTextStyles.customText(
                                fontSize: 18.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  10.h.height,

                  Text(
                    "Full regulatory vetting is required for\naccessing financial services in accordance\nwith Saudi Arabian Monetary Authority and\nMinistry of Finance guidelines.",
                    style: AppTextStyles.customText(
                      fontSize: 14.sp,
                      color: Colors.white.withValues(alpha: 0.5),
                      fontWeight: FontWeight.w500,
                    ),
                  ).paddingLeft(5.w),

                  14.h.height,

                  AppCustomButton(
                    bgColor: AppColors.primary,
                    borderColor: AppColors.white.withValues(alpha: 0.3),
                    title: "Initiate Full Vetting",
                    onPressed: () {
                      Utils.showBottomSheet(context: context, child: LinkBankSheet());
                    },
                  ).paddingHorizontal(30.w),

                  10.h.height,

                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "SAMA & MOF Alignment Required",
                      style: AppTextStyles.customText(
                        fontSize: 12.sp,
                        color: Colors.white.withValues(alpha: 0.5),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),

                  5.h.height,
                ],
              ).paddingAll(10.sp),
            ],
          )
              .animate()
              .fadeIn(duration: 500.ms, delay: 400.ms)
              .slideY(begin: 0.1, end: 0),

          Spacer(),

          Text(
            textAlign: TextAlign.center,
            "This platform operates under the regulatory framework of the\nSaudi Arabian Monetary Authority (SAMA) and the Ministry of\nFinance (MOF). All user data is processed in compliance with\nlocal data protection laws.",
            style: AppTextStyles.customText(
              fontSize: 10.sp,
              color: Colors.white.withValues(alpha: 0.5),
              fontWeight: FontWeight.w400,
            ),
          ).animate().fadeIn(duration: 400.ms, delay: 600.ms),

          10.h.height,
        ],
      ).paddingSymmetric(horizontal: 20.w, vertical: 10.h),
    );
  }
}