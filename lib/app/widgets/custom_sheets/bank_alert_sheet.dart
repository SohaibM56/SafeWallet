import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:safewallet/app/config/app_assets.dart';
import 'package:safewallet/app/config/app_routes.dart';
import 'package:safewallet/app/config/app_text_style.dart';
import 'package:safewallet/app/config/padding_extensions.dart';
import 'package:safewallet/app/widgets/app_custom_button.dart';
import 'package:safewallet/app/widgets/sizedbox_extension.dart';

import '../../config/app_colors.dart';

class BankAlertSheet extends StatelessWidget {
  const BankAlertSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: 48.w,
                height: 6.h,
                decoration: BoxDecoration(
                  color: Color(0xffE6E6E6),
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(Icons.close, color: AppColors.black, size: 22.sp),
              ),
            ).paddingRight(5.w),

            Image.asset(AppAssets.alertIcon, width: 140.w, height: 140.h),

            Text(
              textAlign: TextAlign.center,
              "Your bank account follows financial\nregulations. Your wallet keys are\npersonal and ensure your assets stay\nprotected and accessible.",
              style: AppTextStyles.customText18(fontWeight: FontWeight.w600),
            ),

            30.h.height,

            AppCustomButton(
              title: 'Okay',
              borderRadius: 80.r,
              onPressed: () {
                Get.back();
                Get.toNamed(AppRoutes.regulatoryIdentityView);
              },
              bgColor: AppColors.primary,
            ).paddingHorizontal(30.w),

            10.h.height,
          ],
        ).paddingAll(20.sp),
      ),
    );
  }
}
