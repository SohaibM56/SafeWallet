import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:safewallet/app/config/app_assets.dart';
import 'package:safewallet/app/widgets/app_custom_button.dart';
import 'package:safewallet/app/widgets/custom_back_button.dart';
import 'package:safewallet/app/widgets/sizedbox_extension.dart';

import '../../../../../config/app_colors.dart';
import '../../../../../config/app_strings.dart';
import '../../../../../config/app_text_style.dart';

class BioMetricVerificationView extends StatefulWidget {
  const BioMetricVerificationView({super.key});

  @override
  State<BioMetricVerificationView> createState() =>
      _BioMetricVerificationViewState();
}

class _BioMetricVerificationViewState extends State<BioMetricVerificationView> {
  // final LoginController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SizedBox(
            height: Get.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back Button
                CustomBackButton()
                    .animate()
                    .fadeIn(duration: 400.ms)
                    .slideX(begin: -0.3, curve: Curves.easeOut),

                Expanded(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        30.h.height,
                        Container(
                          height: 95.w,
                          width: 95.w,
                          decoration: BoxDecoration(
                            color: AppColors.white.withValues(alpha: 0.2),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: ImageIcon(
                              AssetImage(AppAssets.fingerprintIcon),
                              color: AppColors.white,
                              size: 50,
                            ),
                          ),
                        ),

                        26.h.height,

                        Text(
                              AppStrings.bioMetric,
                              style: AppTextStyles.customText24(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            )
                            .animate()
                            .fadeIn(duration: 600.ms, delay: 100.ms)
                            .slideY(begin: -0.2, curve: Curves.easeOut),

                        12.h.height,

                        /// Subtitle
                        Text(
                              AppStrings.bioMetricText,
                              textAlign: TextAlign.center,
                              style: AppTextStyles.customText14(
                                height: 1.5,
                                color: Colors.white.withValues(alpha: 0.5),
                                fontWeight: FontWeight.w400,
                              ),
                            )
                            .animate()
                            .fadeIn(duration: 600.ms, delay: 200.ms)
                            .slideY(begin: -0.1, curve: Curves.easeOut),

                        80.h.height,

                        AppCustomButton(
                          onPressed: () {},
                          title: AppStrings.continueText,
                        ),
                        26.h.height,
                        Text(
                              AppStrings.skipNow,
                              textAlign: TextAlign.center,
                              style: AppTextStyles.customText14(
                                color: Colors.white.withValues(alpha: 0.5),
                                fontWeight: FontWeight.w400,
                              ),
                            )
                            .animate()
                            .fadeIn(duration: 600.ms, delay: 200.ms)
                            .slideY(begin: -0.1, curve: Curves.easeOut),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
