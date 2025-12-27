import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:safewallet/app/config/app_text_style.dart';
import 'package:safewallet/app/config/padding_extensions.dart';
import 'package:safewallet/app/config/utils.dart';
import 'package:safewallet/app/widgets/app_custom_button.dart';
import 'package:safewallet/app/widgets/custom_sheets/transaction_sent_sheet.dart';
import 'package:safewallet/app/widgets/sizedbox_extension.dart';

import '../../config/app_assets.dart';
import '../../config/app_colors.dart';

class TransactionSuccessSheet extends StatelessWidget {
  const TransactionSuccessSheet({super.key});

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
                  child: Column(
                    children: [
                      Text(
                        "Transaction successful",
                        style: AppTextStyles.customText18(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        "Ref#FT25347089BRM5P7",
                        style: AppTextStyles.customText12(
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey,
                        ),
                      ),
                    ],
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
              children: [],
            ),


            10.h.height,
          ],
        ).paddingAll(20.sp),
      ),
    );
  }
}
