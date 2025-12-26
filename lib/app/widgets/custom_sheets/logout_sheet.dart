import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:safewallet/app/config/app_colors.dart';
import 'package:safewallet/app/config/app_text_style.dart';
import 'package:safewallet/app/widgets/app_custom_button.dart';
import 'package:safewallet/app/widgets/sizedbox_extension.dart';

class LogoutSheet extends StatelessWidget {
  const LogoutSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Drag handle
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
              child: Container(
                padding: EdgeInsets.all(8.sp),
                decoration: BoxDecoration(
                  color: Color(0xffE6E6E6),
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: Icon(Icons.close, color: Color(0xff848484), size: 16.sp),
              ),
            ),
          ),

          30.h.height,

          // Title
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Are you sure you want to log out?',
                style: AppTextStyles.customText(
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              4.h.height,

              // Subtitle
              Text(
                'You can sign back in at any time',
                style: AppTextStyles.customText(
                  color: Colors.black,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),

          20.h.height,

          AppCustomButton(
                title: 'Log Out',
                borderRadius: 12.r,
                onPressed: () async {
                  // try {
                  //   GetLoader.showAppLoader();
                  //   final response = await AuthRepository().logoutApi();
                  //   GetLoader.hideAppLoader();
                  //   if (response.success == true) {
                  //     final prefs = AppSharedPreferencesService();
                  //     await prefs.clearAllPreferences();
                  //     Get.back();
                  //     Get.offAllNamed(AppRoutes.loginView);
                  //     GlobalVariables.errorMessages.showSuccess();
                  //   } else {
                  //     GlobalVariables.errorMessages.showError();
                  //   }
                  // } catch (e) {
                  //   GlobalVariables.errorMessages.showError();
                  // }
                },
                bgColor: AppColors.primary,
              )
              .paddingSymmetric(horizontal: 30.w)
              .animate()
              .fadeIn(duration: 600.ms, delay: 600.ms)
              .slideY(begin: 0.2, end: 0, delay: 600.ms)
              .scale(
                begin: const Offset(0.95, 0.95),
                end: const Offset(1, 1),
                curve: Curves.easeOutBack,
                delay: 600.ms,
              ),

          20.h.height,
        ],
      ).paddingAll(20.sp),
    );
  }
}
