import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:safewallet/app/mvvm/view_model/tools_controller/snipper_tool_controller.dart';
import 'package:safewallet/app/widgets/app_custom_button.dart';
import 'package:safewallet/app/widgets/custom_back_button.dart';
import 'package:safewallet/app/widgets/sizedbox_extension.dart';

import '../../../../../config/app_colors.dart';
import '../../../../../config/app_text_style.dart';

class SnipperToolView extends StatefulWidget {
  const SnipperToolView({super.key});

  @override
  State<SnipperToolView> createState() => _SnipperToolViewState();
}

class _SnipperToolViewState extends State<SnipperToolView> {
  final SnipperToolController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SizedBox(
            height: Get.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.h.height,
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
                            "Sniper Tool",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.customText18(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ).animate().fadeIn(duration: 600.ms, delay: 400.ms),

                          2.h.height,

                          Text(
                            "Auto-buy tokens on launch or price trigger",
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
                      "Target Token / Contract",
                      style: AppTextStyles.customText16(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                    .animate()
                    .fadeIn(duration: 600.ms, delay: 100.ms)
                    .slideY(begin: -0.2, curve: Curves.easeOut),

                // AppCustomField(
                //       labelTitle: "",
                //       hintText: 'Token address or name',
                //       isOutlineBorder: true,
                //     )
                //     .animate(delay: 400.ms)
                //     .fadeIn(duration: 500.ms)
                //     .slideY(begin: 0.2, curve: Curves.easeOut),
                25.h.height,
                Text(
                      "Trigger Condition",
                      style: AppTextStyles.customText16(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                    .animate()
                    .fadeIn(duration: 600.ms, delay: 100.ms)
                    .slideY(begin: -0.2, curve: Curves.easeOut),
                15.h.height,
                Obx(
                  () =>
                      Container(
                            padding: EdgeInsets.all(14.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(
                                color: Colors.white.withValues(alpha: 0.08),
                              ),
                            ),
                            child: Column(
                              children: [
                                _triggerOption(
                                  title: "On launch",
                                  isActive: controller.isOnLaunch.value,
                                  onTap: () => controller.setTrigger(true),
                                ),
                                14.h.height,
                                _triggerOption(
                                  title: "Price Trigger",
                                  isActive: !controller.isOnLaunch.value,
                                  onTap: () => controller.setTrigger(false),
                                ),
                              ],
                            ),
                          )
                          .animate(delay: 300.ms)
                          .fadeIn(duration: 500.ms)
                          .slideY(begin: 0.2, curve: Curves.easeOut),
                ),
                25.h.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Status",
                      style: AppTextStyles.customText12(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "Mock Mode",
                      style: AppTextStyles.customText16(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                100.h.height,

                AppCustomButton(onPressed: () {}, title: "Set Sniper")
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

  // Widget _triggerOption({required String title, required bool isActive}) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       Text(
  //         title,
  //         style: AppTextStyles.customText14(
  //           color: Colors.white,
  //           fontWeight: FontWeight.w500,
  //         ),
  //       ),
  //       Container(
  //         height: 18.w,
  //         width: 18.w,
  //         decoration: BoxDecoration(
  //           shape: BoxShape.circle,
  //           border: Border.all(
  //             color: isActive
  //                 ? AppColors.secondary
  //                 : Colors.white.withValues(alpha: 0.3),
  //             width: 2,
  //           ),
  //         ),
  //         child: isActive
  //             ? Center(
  //                 child: Container(
  //                   height: 8.w,
  //                   width: 8.w,
  //                   decoration: BoxDecoration(
  //                     color: AppColors.secondary,
  //                     shape: BoxShape.circle,
  //                   ),
  //                 ),
  //               )
  //             : null,
  //       ),
  //     ],
  //   );
  // }
  Widget _triggerOption({
    required String title,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyles.customText14(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            height: 18.w,
            width: 18.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isActive
                    ? AppColors.primary
                    : Colors.white.withValues(alpha: 0.3),
                width: 2,
              ),
            ),
            child: isActive
                ? Center(
                    child: Container(
                      height: 8.w,
                      width: 8.w,
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                    ),
                  )
                : null,
          ),
        ],
      ),
    );
  }
}
