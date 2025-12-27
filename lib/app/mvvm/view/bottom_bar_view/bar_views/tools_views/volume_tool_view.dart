import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:safewallet/app/widgets/app_custom_button.dart';
import 'package:safewallet/app/widgets/app_custom_field.dart';
import 'package:safewallet/app/widgets/custom_back_button.dart';
import 'package:safewallet/app/widgets/sizedbox_extension.dart';

import '../../../../../config/app_colors.dart';
import '../../../../../config/app_text_style.dart';

class VolumeToolView extends StatefulWidget {
  const VolumeToolView({super.key});

  @override
  State<VolumeToolView> createState() => _VolumeToolViewState();
}

class _VolumeToolViewState extends State<VolumeToolView> {
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
                // Back Button / Title
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomBackButton()
                        .animate()
                        .fadeIn(duration: 400.ms)
                        .slideX(begin: -0.3, curve: Curves.easeOut),
                    15.w.width,

                    /// ✅ Text Area (Expanded FIX)
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Volume Booster",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.customText18(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ).animate().fadeIn(duration: 600.ms, delay: 400.ms),

                          2.h.height,

                          Text(
                            "Simulate trading volume for tokens",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.customText10(
                              color: Colors.white.withValues(alpha: 0.6),
                            ),
                          ).animate().fadeIn(duration: 600.ms, delay: 500.ms),
                        ],
                      ),
                    ),
                  ],
                ),
                40.h.height,

                Text(
                      "Token Selection",
                      style: AppTextStyles.customText16(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                    .animate()
                    .fadeIn(duration: 600.ms, delay: 100.ms)
                    .slideY(begin: -0.2, curve: Curves.easeOut),

                AppCustomField(
                      labelTitle: "",
                      hintText: 'Enter token address',
                      isOutlineBorder: true,
                    )
                    .animate(delay: 400.ms)
                    .fadeIn(duration: 500.ms)
                    .slideY(begin: 0.2, curve: Curves.easeOut),
                25.h.height,
                Text(
                      "Volume Budget (SOL)",
                      style: AppTextStyles.customText16(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                    .animate()
                    .fadeIn(duration: 600.ms, delay: 100.ms)
                    .slideY(begin: -0.2, curve: Curves.easeOut),

                AppCustomField(
                      labelTitle: "",
                      hintText: 'Enter budget amount',
                      isOutlineBorder: true,
                      // controller:,
                    )
                    .animate(delay: 400.ms)
                    .fadeIn(duration: 500.ms)
                    .slideY(begin: 0.2, curve: Curves.easeOut),
                25.h.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Estimated Trades",
                      style: AppTextStyles.customText12(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "0",
                      style: AppTextStyles.customText16(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                20.h.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Duration",
                      style: AppTextStyles.customText12(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "~24 hours",
                      style: AppTextStyles.customText16(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                100.h.height,

                AppCustomButton(onPressed: () {}, title: "Simulate Volume Plan")
                    .animate()
                    .fadeIn(duration: 600.ms, delay: 100.ms)
                    .slideY(begin: 0.2, curve: Curves.easeOut),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
