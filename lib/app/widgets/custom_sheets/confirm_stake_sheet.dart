import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:safewallet/app/config/app_assets.dart';
import 'package:safewallet/app/config/app_colors.dart';
import 'package:safewallet/app/config/app_text_style.dart';
import 'package:safewallet/app/widgets/sizedbox_extension.dart';

class ConfirmStakeSheet extends StatelessWidget {
  const ConfirmStakeSheet({super.key});

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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.close_rounded, color: AppColors.secondary),
                  ),
                ],
              ),

              3.h.height,
              Container(
                height: 95.w,
                width: 95.w,
                decoration: BoxDecoration(
                  color: AppColors.green.withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.green),
                ),
                child: Center(
                  child: ImageIcon(
                    AssetImage(AppAssets.fingerprintIcon),
                    color: AppColors.green,
                    size: 50,
                  ),
                ),
              ),
              20.h.height,
              Text(
                "Confirm Stake",
                style: AppTextStyles.customText24(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                ),
              ).animate().fadeIn(duration: 600.ms, delay: 400.ms),
              6.h.height,
              Text(
                "Venty your identity to continue",
                style: AppTextStyles.customText18(
                  color: AppColors.secondary.withValues(alpha: 0.5),
                  fontWeight: FontWeight.w300,
                ),
              ).animate().fadeIn(duration: 600.ms, delay: 400.ms),

              25.h.height,
            ],
          ).paddingAll(16.sp),
        ),
      ),
    );
  }
}
