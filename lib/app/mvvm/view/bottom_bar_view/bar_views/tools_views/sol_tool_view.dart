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

class SolToolView extends StatefulWidget {
  const SolToolView({super.key});

  @override
  State<SolToolView> createState() => _SolToolViewState();
}

class _SolToolViewState extends State<SolToolView> {
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
                            "SOL Multisender",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.customText18(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ).animate().fadeIn(duration: 600.ms, delay: 400.ms),

                          2.h.height,

                          Text(
                            "Send SOL to multiple wallets at once",
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
                      "Total SOL Amount",
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
                      hintText: 'Enter Total SOL',
                      isOutlineBorder: true,
                    )
                    .animate(delay: 400.ms)
                    .fadeIn(duration: 500.ms)
                    .slideY(begin: 0.2, curve: Curves.easeOut),
                25.h.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                          "Recipient Addresses",
                          style: AppTextStyles.customText16(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                        .animate()
                        .fadeIn(duration: 600.ms, delay: 100.ms)
                        .slideY(begin: -0.2, curve: Curves.easeOut),
                    Container(
                      height: 30.w,
                      width: 60.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(55.r)),
                        color: AppColors.secondary,
                      ),
                      child: Center(
                        child: Text(
                          "Add",
                          style: AppTextStyles.customText12(
                            color: AppColors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                AppCustomField(
                      labelTitle: "",
                      hintText: 'Wallet 1',
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
                      "Recipients",
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
                      "Total Amount",
                      style: AppTextStyles.customText12(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "0 SOL",
                      style: AppTextStyles.customText16(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                100.h.height,

                AppCustomButton(onPressed: () {}, title: "Prepare Multisend")
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
