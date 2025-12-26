import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:safewallet/app/config/app_assets.dart';
import 'package:safewallet/app/config/app_colors.dart';
import 'package:safewallet/app/config/app_strings.dart';
import 'package:safewallet/app/config/app_text_style.dart';
import 'package:safewallet/app/mvvm/view_model/auth_controller/sign_up_controller/verification_controllers/done_verification_controller.dart';
import 'package:safewallet/app/widgets/app_custom_button.dart';
import 'package:safewallet/app/widgets/custom_back_button.dart';
import 'package:safewallet/app/widgets/sizedbox_extension.dart';

class DoneVerificationView extends StatefulWidget {
  const DoneVerificationView({super.key});

  @override
  State<DoneVerificationView> createState() => _DoneVerificationViewState();
}

class _DoneVerificationViewState extends State<DoneVerificationView> {
  final DoneVerificationController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
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

              30.h.height,

              Text(
                    AppStrings.indetityVerification,
                    style: AppTextStyles.customText24(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 100.ms)
                  .slideY(begin: -0.2, curve: Curves.easeOut),

              8.h.height,

              /// Subtitle
              Text(
                    AppStrings.sompleteKYCTxt,
                    style: AppTextStyles.customText14(
                      color: Colors.white.withValues(alpha: 0.7),
                      fontWeight: FontWeight.w400,
                    ),
                  )
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 200.ms)
                  .slideY(begin: -0.1, curve: Curves.easeOut),

              30.h.height,
              GestureDetector(
                    onTap: () {
                      // controller.prickFrontImage(context);
                    },
                    child: Container(
                      height: 172.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.transparent,
                        border: Border.all(
                          color: AppColors.darkGrey,
                          width: 2.w,
                        ),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 40.w,
                              width: 40.w,
                              decoration: BoxDecoration(
                                color: AppColors.white.withValues(alpha: 0.2),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: ImageIcon(
                                  AssetImage(AppAssets.addIcon),
                                  color: AppColors.white,
                                  size: 24.w,
                                ),
                              ),
                            ),
                            16.h.height,
                            Text(
                              AppStrings.walletLinking,
                              style: AppTextStyles.customText16(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            5.h.height,

                            Text(
                              AppStrings.walletLinkingTxt,
                              textAlign: TextAlign.center,
                              style: AppTextStyles.customText12(
                                color: Colors.white.withValues(alpha: 0.6),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 300.ms)
                  .scale(
                    begin: const Offset(0.7, 0.7),
                    curve: Curves.easeOutBack,
                  ),
              15.h.height,
              GestureDetector(
                    onTap: () {
                      // controller.prickFrontImage(context);
                    },
                    child: Container(
                      height: 172.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.white.withValues(alpha: 0.05),
                        border: Border.all(
                          color: AppColors.darkGrey,
                          width: 2.w,
                        ),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppStrings.walletAddress,
                              style: AppTextStyles.customText(
                                color: Colors.white.withValues(alpha: 0.25),
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            5.h.height,

                            Text(
                              truncateWallet(
                                "tb1q6z4xk7y9v3p2s8n0r5q1d6f7g8h9j0k2l3m4n5p6q7r8s9t0u1v2w3x4y5z",
                              ),
                              textAlign: TextAlign.center,
                              style: AppTextStyles.customText22(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ).paddingSymmetric(horizontal: 52.sp),
                      ),
                    ),
                  )
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 400.ms)
                  .scale(
                    begin: const Offset(0.7, 0.7),
                    curve: Curves.easeOutBack,
                  ),
              10.h.height,
              Row(
                    children: [
                      Icon(Icons.check, color: Colors.white, size: 24),
                      5.w.width,
                      Text(
                        AppStrings.walletGenerated,
                        style: AppTextStyles.customText(
                          color: Colors.white.withValues(alpha: 0.25),
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  )
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 400.ms)
                  .scale(
                    begin: const Offset(0.7, 0.7),
                    curve: Curves.easeOutBack,
                  ),
              10.h.height,
              Row(
                    children: [
                      Icon(Icons.check, color: Colors.white, size: 24),
                      5.w.width,
                      Text(
                        AppStrings.nonKeys,
                        style: AppTextStyles.customText(
                          color: Colors.white.withValues(alpha: 0.25),
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  )
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 500.ms)
                  .scale(
                    begin: const Offset(0.7, 0.7),
                    curve: Curves.easeOutBack,
                  ),
              Spacer(),
              AppCustomButton(
                    onPressed: () {},
                    title: AppStrings.confirLinkWallet,
                  )
                  .paddingSymmetric(horizontal: 20.w)
                  .animate(delay: 1000.ms)
                  .fadeIn(duration: 600.ms)
                  .scale(
                    begin: const Offset(0.95, 0.95),
                    curve: Curves.easeOutBack,
                  ),
              30.h.height,
            ],
          ),
        ).paddingSymmetric(horizontal: 24.w),
      ),
    );
  }

  String truncateWallet(String wallet, {int head = 15, int tail = 5}) {
    if (wallet.length <= head + tail) return wallet;
    return '${wallet.substring(0, head)}...${wallet.substring(wallet.length - tail)}';
  }
}
