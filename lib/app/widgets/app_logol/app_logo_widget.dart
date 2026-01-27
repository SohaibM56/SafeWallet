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
        /// LOGO
        Image.asset(AppAssets.appLogo, width: double.infinity, height: 130.h)
            .paddingSymmetric(horizontal: 10.w)
            .animate()
            .scale(
              duration: 1200.ms,
              begin: const Offset(0.5, 0.5),
              end: const Offset(1, 1),
              curve: Curves.elasticOut,
            )
            .then(delay: 100.ms)
            .shake(duration: 800.ms, hz: 4, curve: Curves.elasticOut)
            .then(delay: 200.ms)
            .scale(
              duration: 600.ms,
              begin: const Offset(1, 1),
              end: const Offset(0.95, 0.95),
              curve: Curves.easeInOut,
            ),

        5.h.height,

        /// APP NAME
        Text(
              "The national gateway for secure digital asset management and institutional governance.",
              textAlign: TextAlign.center,
              style: AppTextStyles.customText12(
                color: AppColors.white.withValues(alpha: 0.8),
                fontWeight: FontWeight.w500,
              ),
            )
            .animate()
            .scale(
              duration: 1200.ms,
              begin: const Offset(0.5, 0.5),
              end: const Offset(1, 1),
              curve: Curves.elasticOut,
            )
            .then(delay: 100.ms)
            .shake(duration: 800.ms, hz: 4, curve: Curves.elasticOut)
            .then(delay: 200.ms)
            .scale(
              duration: 600.ms,
              begin: const Offset(1, 1),
              end: const Offset(0.95, 0.95),
              curve: Curves.easeInOut,
            ),

        5.h.height,

        /// TAGLINE
        Text(
              "البوابة الوطنية لإدارة الأصول الرقمية والحوكمة المؤسسية",
              textAlign: TextAlign.center,
              style: AppTextStyles.customText12(
                color: AppColors.white.withValues(alpha: 0.8),
                fontWeight: FontWeight.w500,
              ),
            )
            .animate()
            .scale(
              duration: 1200.ms,
              begin: const Offset(0.5, 0.5),
              end: const Offset(1, 1),
              curve: Curves.elasticOut,
            )
            .then(delay: 100.ms)
            .shake(duration: 800.ms, hz: 4, curve: Curves.elasticOut)
            .then(delay: 200.ms)
            .scale(
              duration: 600.ms,
              begin: const Offset(1, 1),
              end: const Offset(0.95, 0.95),
              curve: Curves.easeInOut,
            ),
      ],
    );
  }
}
