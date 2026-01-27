import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:safewallet/app/config/app_colors.dart';
import 'package:safewallet/app/config/app_text_style.dart';
import 'package:safewallet/app/widgets/sizedbox_extension.dart';

class ReceiveSheet extends StatelessWidget {
  const ReceiveSheet({super.key});

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
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.close_rounded, color: AppColors.secondary),
              ),
            ),

            Align(
              alignment: Alignment.topLeft,
              child: Text(
                textAlign: TextAlign.center,
                'Recipient Address',
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
                'ØxA3F9b72C4e18DØE5d92bCIC7f4A8',
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
