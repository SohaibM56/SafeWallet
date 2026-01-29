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
        /// APP LOGO — Trust Anchor
        Image.asset(AppAssets.appLogo, width: double.infinity, height: 130.h)
            .paddingSymmetric(horizontal: 12.w)
            .animate()
            .fadeIn(duration: 700.ms)
            .scale(
              begin: const Offset(0.97, 0.97),
              end: const Offset(1, 1),
              curve: Curves.easeOutCubic,
            ),

        10.h.height,

        /// ENGLISH TAGLINE
        Text(
              "The national gateway for secure digital asset management and institutional governance.",
              textAlign: TextAlign.center,
              style: AppTextStyles.customText12(
                color: AppColors.white.withValues(alpha: 0.85),
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
            )
            .animate(delay: 250.ms)
            .fadeIn(duration: 550.ms)
            .slideY(begin: 0.06, end: 0, curve: Curves.easeOut),

        6.h.height,

        /// ARABIC TAGLINE
        Text(
          "البوابة الوطنية لإدارة الأصول الرقمية والحوكمة المؤسسية",
          textAlign: TextAlign.center,
          style: AppTextStyles.customText12(
            color: AppColors.white.withValues(alpha: 0.82),
            fontWeight: FontWeight.w500,
            height: 1.4,
          ),
        ).animate(delay: 400.ms).fadeIn(duration: 550.ms),
      ],
    );
  }
}
