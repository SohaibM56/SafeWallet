import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:safewallet/app/config/app_assets.dart';
import 'package:safewallet/app/config/app_routes.dart';
import 'package:safewallet/app/config/app_text_style.dart';
import 'package:safewallet/app/config/padding_extensions.dart';
import 'package:safewallet/app/config/utils.dart';
import 'package:safewallet/app/mvvm/view_model/phrase_controller/phrase_controller.dart';
import 'package:safewallet/app/widgets/app_animation/app_animation.dart';
import 'package:safewallet/app/widgets/app_custom_button.dart';
import 'package:safewallet/app/widgets/sizedbox_extension.dart';

import '../../../../config/app_colors.dart';
import '../../../../widgets/custom_app_bar.dart';
import '../../../../widgets/word_tile.dart';

class RecoveryPhaseView extends StatefulWidget {
  const RecoveryPhaseView({super.key});

  @override
  State<RecoveryPhaseView> createState() => _RecoveryPhaseViewState();
}

class _RecoveryPhaseViewState extends State<RecoveryPhaseView> {
  final PhraseController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: CustomAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Obx(
              () =>
                  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildCircularView(
                            step: 1,
                            title: "Generate",
                            currentStep: controller.phase.value.index + 1,
                          ),
                          30.w.width,
                          _buildCircularView(
                            step: 2,
                            title: "Verify",
                            currentStep: controller.phase.value.index + 1,
                          ),
                          30.w.width,
                          _buildCircularView(
                            step: 3,
                            title: "Complete",
                            currentStep: controller.phase.value.index + 1,
                          ),
                        ],
                      )
                      .animate()
                      .fadeIn(duration: AppAnimations.slow)
                      .slideY(begin: -0.2, end: 0),
            ),

            20.h.height,

            Obx(() {
              switch (controller.phase.value) {
                case RecoveryPhase.generate:
                  return _buildRecoveryPhase();
                case RecoveryPhase.verify:
                  return _buildVerificationPhase();
                case RecoveryPhase.complete:
                  return _buildCompletePhase();
              }
            }),
          ],
        ).paddingSymmetric(horizontal: 20.w, vertical: 10.h),
      ),
    );
  }

  Widget _buildCircularView({
    required int step,
    required String title,
    required int currentStep,
  }) {
    final bool isCompleted = step < currentStep;
    final bool isActive = step == currentStep;

    return Column(
      children: [
        Container(
              width: 50.w,
              height: 50.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isCompleted || isActive
                    ? AppColors.primary
                    : Colors.transparent,
                border: Border.all(
                  width: 2,
                  color: isCompleted || isActive
                      ? AppColors.primary
                      : Colors.white.withValues(alpha: 0.25),
                ),
              ),
              child: Center(
                child: isCompleted
                    ? Icon(Icons.check, color: Colors.white, size: 30.sp)
                    : Text(
                        step.toString().padLeft(2, '0'),
                        style: AppTextStyles.customText20(
                          color: isActive
                              ? Colors.white
                              : Colors.white.withValues(alpha: 0.4),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
              ),
            )
            .animate(target: isActive ? 1 : 0)
            .scale(end: const Offset(1.05, 1.05), duration: AppAnimations.slow)
            .then()
            .scale(end: const Offset(1.0, 1.0), duration: AppAnimations.slow),
        8.h.height,
        Text(
          title,
          style: AppTextStyles.customText14(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildRecoveryPhase() {
    return Expanded(
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Your Recovery Phrase',
                    style: AppTextStyles.customText20(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
                .animate()
                .fadeIn(duration: AppAnimations.slow)
                .slideX(begin: -0.1, end: 0),
            5.h.height,
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Write down these words in the exact order and store them in a secure location.',
                style: AppTextStyles.customText(
                  fontSize: 11.sp,
                  color: Colors.white.withValues(alpha: 0.5),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ).animate().fadeIn(duration: AppAnimations.normal, delay: 100.ms),

            20.h.height,

            Obx(
              () =>
                  Row(
                        children: [
                          Expanded(
                            child: _buildWordsWidget(
                              title: "12 Words",
                              subTitle: "Visible",
                              isSelected: controller.is12Words.value,
                              onTap: () => controller.selectWords(true),
                            ),
                          ),
                          14.w.width,
                          Expanded(
                            child: _buildWordsWidget(
                              onTap: () => controller.selectWords(false),
                              title: "24 Words",
                              subTitle: "Offline",
                              isSelected: !controller.is12Words.value,
                            ),
                          ),
                        ],
                      )
                      .paddingHorizontal(24.w)
                      .animate()
                      .fadeIn(duration: AppAnimations.normal, delay: 200.ms),
            ),

            20.h.height,

            Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.grey, width: 2.w),
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
              ),
              child: Column(
                children: [
                  Obx(
                    () => GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10.w,
                        mainAxisSpacing: 10.h,
                        mainAxisExtent: 40.h,
                      ),
                      itemCount: controller.words.length,
                      itemBuilder: (context, index) {
                        return Obx(() {
                          final word = controller.words[index];
                          final isSelected = controller.selectedWords.contains(
                            word,
                          );

                          return WordTile(
                                word: controller.isWordHide.value == true
                                    ? "*****"
                                    : word,
                                textColor: isSelected
                                    ? Colors.white
                                    : AppColors.white.withValues(alpha: 0.5),
                                borderColor: isSelected
                                    ? AppColors.primary
                                    : AppColors.primary.withValues(alpha: 0.3),
                                color: isSelected
                                    ? AppColors.primary
                                    : AppColors.primarySoft,

                                onTap: () => controller.toggleWord(word),
                              )
                              .animate()
                              .fadeIn(
                                duration: AppAnimations.fast,
                                delay: (50 * index).ms,
                              )
                              .slideY(begin: 0.3, end: 0);
                        });
                      },
                    ),
                  ),

                  10.h.height,

                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Clipboard.setData(
                              ClipboardData(
                                text: "${controller.selectedWords}",
                              ),
                            );
                            Utils.showToast("All Words copied");
                            log("${controller.selectedWords}");
                          },
                          child: SizedBox(
                            height: 40.h,
                            child: WordTile(
                              color: AppColors.black,
                              borderColor: AppColors.white.withValues(
                                alpha: 0.4,
                              ),
                              word: 'Copy',
                              icon: Icons.copy,
                            ),
                          ),
                        ),
                      ),
                      12.w.width,
                      Expanded(
                        child: GestureDetector(
                          onTap: () => controller.hideWords(),
                          child: SizedBox(
                            height: 40.h,
                            child: WordTile(
                              color: AppColors.black,
                              borderColor: AppColors.white.withValues(
                                alpha: 0.4,
                              ),
                              word: 'Hide',
                              icon: Icons.visibility_off,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ).animate().fadeIn(
                    duration: AppAnimations.normal,
                    delay: 800.ms,
                  ),
                ],
              ).paddingAll(10.sp),
            ).animate().fadeIn(duration: AppAnimations.slow, delay: 300.ms),

            10.h.height,

            Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.sp),
                  decoration: BoxDecoration(
                    color: Color(0xFF25201d),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Never share your recovery phrase",
                        style: AppTextStyles.customText(
                          fontSize: 14.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      2.h.height,
                      Text(
                        "Anyone with access to this phrase can steal your funds.Store it offline and never enter it on any website.",
                        style: AppTextStyles.customText(
                          fontSize: 10.sp,
                          color: Colors.white.withValues(alpha: 0.5),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                )
                .animate()
                .fadeIn(duration: AppAnimations.normal, delay: 1000.ms)
                .slideY(begin: 0.2, end: 0),

            14.h.height,

            AppCustomButton(
                  title: "I'v Written It Down",
                  onPressed: () {
                    controller.phase.value = RecoveryPhase.verify;
                  },
                )
                .paddingHorizontal(30.w)
                .animate()
                .fadeIn(duration: AppAnimations.normal, delay: 1100.ms),

            10.h.height,

            AppCustomButton(
                  bgColor: AppColors.white,
                  textStyle: AppTextStyles.customText16(
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  title: "Generate New Phrase",
                  onPressed: () {},
                )
                .paddingHorizontal(30.w)
                .animate()
                .fadeIn(duration: AppAnimations.normal, delay: 1200.ms),
          ],
        ),
      ),
    );
  }

  Widget _buildVerificationPhase() {
    return Column(
      children: [
        Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Verify Your Phrase',
                style: AppTextStyles.customText20(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
            .animate()
            .fadeIn(duration: AppAnimations.slow)
            .slideX(begin: -0.1, end: 0),
        5.h.height,
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Select the words in the correct order to verify you've saved your recovery phrase.",
            style: AppTextStyles.customText(
              fontSize: 11.sp,
              color: Colors.white.withValues(alpha: 0.5),
              fontWeight: FontWeight.w400,
            ),
          ),
        ).animate().fadeIn(duration: AppAnimations.normal, delay: 100.ms),

        30.h.height,

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Progress",
              style: AppTextStyles.customText14(
                color: Colors.white.withValues(alpha: 0.6),
              ),
            ),
            Text(
              "10/12",
              style: AppTextStyles.customText14(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ).animate().fadeIn(duration: AppAnimations.normal, delay: 200.ms),

        8.h.height,

        _buildProgressHeader(
          current: 10,
          total: 12,
        ).animate().fadeIn(duration: AppAnimations.normal, delay: 300.ms),

        30.h.height,

        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.grey, width: 2.w),
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.h.height,

                  Text(
                    "Your selection:",
                    style: AppTextStyles.customText(
                      fontSize: 15.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  10.h.height,

                  Obx(
                    () => GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10.w,
                        mainAxisSpacing: 10.h,
                        mainAxisExtent: 44.h,
                      ),
                      itemCount: controller.selectedWords.length,
                      itemBuilder: (context, index) {
                        return WordTile(
                              word: controller.selectedWords[index],
                              borderColor: AppColors.primary,
                            )
                            .animate()
                            .fadeIn(
                              duration: AppAnimations.fast,
                              delay: (50 * index).ms,
                            )
                            .scale(
                              begin: const Offset(0.8, 0.8),
                              end: const Offset(1.0, 1.0),
                            );
                      },
                    ),
                  ),

                  10.h.height,
                ],
              ).paddingAll(10.sp),
            ),
          ],
        ).animate().fadeIn(duration: AppAnimations.slow, delay: 400.ms),

        70.h.height,

        AppCustomButton(
              title: "Continue to Wallet",
              onPressed: () {
                controller.phase.value = RecoveryPhase.complete;
              },
            )
            .paddingHorizontal(30.w)
            .animate()
            .fadeIn(duration: AppAnimations.normal, delay: 800.ms),

        20.h.height,

        GestureDetector(
          onTap: () {
            controller.phase.value = RecoveryPhase.generate;
          },
          child: Text(
            "Back to Seed Phase",
            style: AppTextStyles.customText(
              fontSize: 13.sp,
              color: Colors.white.withValues(alpha: 0.5),
              fontWeight: FontWeight.w400,
            ),
          ),
        ).animate().fadeIn(duration: AppAnimations.normal, delay: 900.ms),
      ],
    );
  }

  Widget _buildCompletePhase() {
    return Expanded(
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Backup Complete!',
                    style: AppTextStyles.customText20(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
                .animate()
                .fadeIn(duration: AppAnimations.slow)
                .slideX(begin: -0.1, end: 0),
            5.h.height,
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Your wallet has been created and your recovery phrase has been verified successfully.',
                style: AppTextStyles.customText(
                  fontSize: 11.sp,
                  color: Colors.white.withValues(alpha: 0.5),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ).animate().fadeIn(duration: AppAnimations.normal, delay: 100.ms),

            20.h.height,

            Container(
              decoration: BoxDecoration(
                color: AppColors.primarySoft,
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.5.sp),
                  width: 2.w,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  18.h.height,

                  Text(
                        'Security Summary',
                        style: AppTextStyles.customText16(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                      .animate()
                      .fadeIn(duration: AppAnimations.fast, delay: 200.ms)
                      .slideX(begin: -0.1, end: 0),

                  16.h.height,

                  _buildSummaryTile(
                        AppAssets.checkIcon,
                        "Recovery phrase saved",
                        "Your 12/24 words have been securely generated",
                      )
                      .animate()
                      .fadeIn(duration: AppAnimations.fast, delay: 300.ms)
                      .slideX(begin: -0.1, end: 0),

                  20.h.height,

                  _buildSummaryTile(
                        AppAssets.checkIcon,
                        "Verification complete",
                        "You've confirmed you can access your backup",
                      )
                      .animate()
                      .fadeIn(duration: AppAnimations.fast, delay: 400.ms)
                      .slideX(begin: -0.1, end: 0),

                  20.h.height,

                  _buildSummaryTile(
                    AppAssets.lockIcon,
                    "Wallet protected",
                    "Your assets are now secured by your recovery phrase",
                  ),

                  18.h.height,
                ],
              ).paddingOnly(left: 14.sp, right: 20.sp),
            ).animate().fadeIn(duration: AppAnimations.slow, delay: 100.ms),

            12.h.height,

            Container(
              decoration: BoxDecoration(
                color: AppColors.primarySoft,
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.5.sp),
                  width: 2.w,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
              ),
              child:
                  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          18.h.height,

                          Text(
                            'Security Tips',
                            style: AppTextStyles.customText16(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          16.h.height,

                          _buildSecurityTile(
                            AppAssets.solidDot,
                            "Consider using a hardware wallet for large holdings ",
                          ).animate().fadeIn(
                            duration: AppAnimations.fast,
                            delay: 600.ms,
                          ),

                          14.h.height,

                          _buildSecurityTile(
                            AppAssets.solidDot,
                            "Never share it with anyone, including support staff",
                          ).animate().fadeIn(
                            duration: AppAnimations.fast,
                            delay: 700.ms,
                          ),

                          14.h.height,

                          _buildSecurityTile(
                            AppAssets.solidDot,
                            "Store your recovery phrase in multiple secure locations",
                          ).animate().fadeIn(
                            duration: AppAnimations.fast,
                            delay: 800.ms,
                          ),

                          18.h.height,
                        ],
                      )
                      .paddingOnly(left: 14.sp, right: 20.sp)
                      .animate()
                      .fadeIn(duration: AppAnimations.slow, delay: 500.ms),
            ),

            40.h.height,

            AppCustomButton(
                  title: "Return Home",
                  onPressed: () {
                    Get.toNamed(AppRoutes.bottomBarView);
                  },
                )
                .paddingHorizontal(30.w)
                .animate()
                .fadeIn(duration: AppAnimations.normal, delay: 1000.ms)
                .slideY(begin: 0.2, end: 0),

            20.h.height,
          ],
        ),
      ),
    );
  }

  Widget _buildWordsWidget({
    required String title,
    required String subTitle,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 60,
            // padding: EdgeInsets.symmetric(vertical: 15.sp),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.sp),
              color: isSelected ? AppColors.primary : AppColors.primarySoft,
              border: isSelected
                  ? null
                  : Border.all(
                      color: AppColors.primary.withValues(alpha: 0.3),
                      width: 2.r,
                    ),
            ),
            child: Center(
              child: Text(
                title,
                style: AppTextStyles.customText16(
                  color: isSelected
                      ? AppColors.white
                      : AppColors.white.withValues(alpha: 0.5),
                ),
              ),
            ),
          ),
        ),
        10.h.height,
        Text(
          subTitle,
          style: AppTextStyles.customText(
            fontSize: 15.sp,
            color: isSelected ? AppColors.white : AppColors.faintColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryTile(String icon, String title, String subTitle) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(icon, width: 22.w, height: 22.w),
        10.w.width,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.customText(
                  fontSize: 13.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                subTitle,
                style: AppTextStyles.customText10(
                  color: Colors.white.withValues(alpha: 0.5),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSecurityTile(String icon, String title) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(icon, width: 12.w, height: 12.w),
        10.w.width,
        Expanded(
          child: Text(
            title,
            style: AppTextStyles.customText(
              color: Colors.white,
              fontSize: 11.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProgressHeader({required int current, required int total}) {
    final double progress = current / total;

    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        final double thumbSize = 22.w;
        final double barHeight = 8.h;

        return SizedBox(
          height: thumbSize,
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(
                height: barHeight,
                width: width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),

              Container(
                height: barHeight,
                width: width * progress,
                decoration: BoxDecoration(
                  color: const Color(0xFF0B6B43),
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ).animate().slideX(
                begin: -1,
                end: 0,
                duration: AppAnimations.slow,
                curve: Curves.easeOut,
              ),

              Positioned(
                left: (width * progress) - (thumbSize / 2),
                child: Container(
                  width: thumbSize,
                  height: thumbSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFF0B6B43),
                    border: Border.all(color: Colors.white, width: 3),
                  ),
                ),
              ).animate().scale(
                duration: AppAnimations.normal,
                delay: 600.ms,
                curve: Curves.elasticOut,
              ),
            ],
          ),
        );
      },
    );
  }
}
