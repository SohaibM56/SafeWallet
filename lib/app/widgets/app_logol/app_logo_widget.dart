import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:safewallet/app/config/app_assets.dart';
import 'package:safewallet/app/config/app_colors.dart';
import 'package:safewallet/app/config/app_text_style.dart';
import 'package:safewallet/app/widgets/sizedbox_extension.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AppAssets.appLogo, width: double.infinity, height: 130.h)
            .paddingSymmetric(horizontal: 12.w)
            .animate()
            .fadeIn(duration: 900.ms, curve: Curves.easeOutQuart)
            .scale(begin: const Offset(0.94, 0.94), end: const Offset(1, 1), duration: 900.ms, curve: Curves.easeOutQuart),

        14.h.height,

        Text(
          "The national gateway for secure digital asset management and institutional governance.",
          textAlign: TextAlign.center,
          style: AppTextStyles.customText12(color: AppColors.white.withValues(alpha: 0.85), fontWeight: FontWeight.w500, height: 1.45),
        ).animate(delay: 300.ms).fadeIn(duration: 700.ms, curve: Curves.easeOutCubic).slideY(begin: 0.08, end: 0, duration: 700.ms, curve: Curves.easeOutCubic),

        8.h.height,

        Text(
          "البوابة الوطنية لإدارة الأصول الرقمية والحوكمة المؤسسية",
          textAlign: TextAlign.center,
          style: AppTextStyles.customText12(color: AppColors.white.withValues(alpha: 0.82), fontWeight: FontWeight.w500, height: 1.45),
        ).animate(delay: 480.ms).fadeIn(duration: 700.ms, curve: Curves.easeOutCubic).slideY(begin: 0.06, end: 0, duration: 700.ms, curve: Curves.easeOutCubic),
      ],
    );
  }
}
