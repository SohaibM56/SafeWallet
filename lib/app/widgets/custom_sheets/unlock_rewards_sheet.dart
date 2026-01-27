import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:safewallet/app/config/app_colors.dart';
import 'package:safewallet/app/config/app_text_style.dart';
import 'package:safewallet/app/config/padding_extensions.dart';
import 'package:safewallet/app/widgets/app_custom_button.dart';
import 'package:safewallet/app/widgets/sizedbox_extension.dart';

class UnlockRewardsSheet extends StatelessWidget {
  const UnlockRewardsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    //   final ProfileController controller = Get.put(ProfileController());

    return AnimatedPadding(
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
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Unlock Rewards",
                        style: AppTextStyles.customText18(
                          color: AppColors.secondary,
                          fontWeight: FontWeight.w800,
                        ),
                      ).animate().fadeIn(duration: 600.ms, delay: 400.ms),
                      5.h.height,
                      Text(
                        "Available: 567.89 SEC",
                        style: AppTextStyles.customText10(
                          color: AppColors.secondary,
                          fontWeight: FontWeight.w400,
                        ),
                      ).animate().fadeIn(duration: 600.ms, delay: 400.ms),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.close_rounded, color: AppColors.secondary),
                  ),
                ],
              ),

              10.h.height,
              Container(
                decoration: BoxDecoration(
                  color: AppColors.black.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: TextFormField(
                  initialValue: '4,302.45 SEC',
                  style: AppTextStyles.customText24(
                    color: AppColors.green,
                    fontWeight: FontWeight.w800,
                  ),

                  decoration: InputDecoration(
                    labelText: 'Amount to unlock',
                    hintText: "Enter amount",
                    labelStyle: AppTextStyles.customText16(
                      color: AppColors.secondary,
                      fontWeight: FontWeight.w400,
                    ),
                    filled: false,
                    fillColor: AppColors.black.withValues(alpha: 0.05),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 18.h,
                    ),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
              ),
              13.h.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Unlock fee",
                    style: AppTextStyles.customText16(
                      color: AppColors.secondary.withValues(alpha: 0.4),
                      fontWeight: FontWeight.w500,
                    ),
                  ).animate().fadeIn(duration: 600.ms, delay: 400.ms),

                  Text(
                    "0.1 SEC",
                    style: AppTextStyles.customText14(
                      color: AppColors.secondary,
                      fontWeight: FontWeight.w800,
                    ),
                  ).animate().fadeIn(duration: 600.ms, delay: 400.ms),
                ],
              ),
              20.h.height,
              AppCustomButton(
                title: "Confirm",
                onPressed: () {},
              ).paddingHorizontal(20.w),
              12.h.height,
            ],
          ).paddingAll(16.sp),
        ),
      ),
    );
  }
}
