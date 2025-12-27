import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:safewallet/app/config/app_text_style.dart';
import 'package:safewallet/app/config/padding_extensions.dart';
import 'package:safewallet/app/widgets/app_custom_button.dart';
import 'package:safewallet/app/widgets/custom_sheets/security_check_sheet.dart';
import 'package:safewallet/app/widgets/sizedbox_extension.dart';

import '../../config/app_assets.dart';
import '../../config/app_colors.dart';
import '../../config/utils.dart';

class ReviewTransactionSheet extends StatelessWidget {
  const ReviewTransactionSheet({super.key});

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
                    "Confirm Transaction",
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
            30.h.height,

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  textAlign: TextAlign.justify,
                  "Amount",
                  style: AppTextStyles.customText(
                    fontSize: 12.sp,
                    color: AppColors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                Text(
                  textAlign: TextAlign.justify,
                  "879 ETH",
                  style: AppTextStyles.customText(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            10.h.height,

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  textAlign: TextAlign.justify,
                  "To",
                  style: AppTextStyles.customText(
                    fontSize: 12.sp,
                    color: AppColors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                Text(
                  textAlign: TextAlign.justify,
                  "ØxA3F9b72C4e18DØE5d92b...",
                  style: AppTextStyles.customText(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),

            35.h.height,

            Container(
              width: 95.w,
              height: 95.w,
              padding: EdgeInsets.all(18.sp),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFe4f7ee),
                border: Border.all(color: Color(0xFFbcecd5), width: 1.w),
              ),
              child: Image.asset(
                AppAssets.fingerprintIcon,
                color: AppColors.green,
              ),
            ),

            14.h.height,

            Text(
              textAlign: TextAlign.justify,
              "Use fingerprint to confirm",
              style: AppTextStyles.customText(
                fontSize: 16.sp,
                color: AppColors.black,
                fontWeight: FontWeight.w600,
              ),
            ),

            24.h.height,

            AppCustomButton(
              title: "User Fingerprint",
              onPressed: () {
                Get.back();
                Utils.showBottomSheet(context: context, child: SecurityCheckSheet());
              },
            ).paddingHorizontal(30.w),

            10.h.height,
          ],
        ).paddingAll(20.sp),
      ),
    );
  }
}
