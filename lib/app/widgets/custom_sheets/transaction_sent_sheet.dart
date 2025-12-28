import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:safewallet/app/config/app_text_style.dart';
import 'package:safewallet/app/config/padding_extensions.dart';
import 'package:safewallet/app/widgets/custom_sheets/transaction_success_sheet.dart';
import 'package:safewallet/app/widgets/sizedbox_extension.dart';

import '../../config/app_colors.dart';
import '../../config/utils.dart';

class TransactionSentSheet extends StatelessWidget {
  const TransactionSentSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
                  Utils.showBottomSheet(context: context, child: TransactionSuccessSheet());
                },
                child: Icon(Icons.close, color: AppColors.black, size: 22.sp),
              ),
            ).paddingRight(5.w),

            Align(
              alignment: Alignment.topLeft,
              child: Text(
                textAlign: TextAlign.center,
                'Transaction Sent!',
                style: AppTextStyles.customText(
                  color: Colors.black,
                  fontSize: 21.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            Align(
              alignment: Alignment.topLeft,
              child: Text(
                textAlign: TextAlign.center,
                '879 ETH sent successfully',
                style: AppTextStyles.customText(
                  color: Colors.black.withValues(alpha: 0.8),
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),

            10.h.height,
          ],
        ).paddingAll(20.sp),
      ),
    );
  }
}
