import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:safewallet/app/config/app_assets.dart';
import 'package:safewallet/app/config/app_colors.dart';
import 'package:safewallet/app/config/app_routes.dart';
import 'package:safewallet/app/config/app_strings.dart';
import 'package:safewallet/app/config/app_text_style.dart';
import 'package:safewallet/app/config/padding_extensions.dart';
import 'package:safewallet/app/widgets/app_custom_button.dart';
import 'package:safewallet/app/widgets/custom_app_bar.dart';
import 'package:safewallet/app/widgets/sizedbox_extension.dart';

class VerificationStepsView extends StatefulWidget {
  const VerificationStepsView({super.key});

  @override
  State<VerificationStepsView> createState() => _VerificationStepsViewState();
}

class _VerificationStepsViewState extends State<VerificationStepsView> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  final List<Map<String, String>> onboardingData = [
    {"icon": AppAssets.signalIC, "text": AppStrings.seccureConneciton},
    {"icon": AppAssets.scanningIC, "text": AppStrings.nafathIdentity},
    {"icon": AppAssets.biometricAuth, "text": AppStrings.biometric},
    {"icon": AppAssets.finalizeIC, "text": AppStrings.finalizeStep},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: CustomAppBar(
        appBarType: AppBarType.centeredTitle,
        titleWidget: Image.asset(AppAssets.appHorizontalLogo, height: 44.h),
        onBackPressed: () {
          if (currentIndex == 0) {
            Get.back();
          } else {
            _pageController.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
          }
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingData.length,
                onPageChanged: (index) {
                  setState(() => currentIndex = index);
                },
                itemBuilder: (context, index) {
                  final item = onboardingData[index];

                  return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image.asset(
                              item["icon"] ?? "",
                              width: double.infinity,
                              height: 225.h,
                            ),
                            25.h.height,

                            Text(
                              item["text"] ?? "",
                              textAlign: TextAlign.center,
                              style: AppTextStyles.customText32(
                                fontWeight: FontWeight.w600,
                                color: AppColors.white,
                              ),
                            ),
                            5.h.height,
                          ],
                        ),
                      )
                      .animate()
                      .fadeIn(duration: 150.ms, delay: 150.ms)
                      .slideY(
                        begin: 0.5,
                        end: 0,
                        duration: 800.ms,
                        curve: Curves.easeInOut,
                      );
                },
              ),
            ),

            63.h.height,

            // Dots Indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingData.length,
                (index) =>
                    AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: currentIndex == index ? 14.w : 14.w,
                          height: 6,
                          decoration: BoxDecoration(
                            color: currentIndex == index
                                ? Colors.white
                                : Colors.white38,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        )
                        .animate()
                        .fadeIn(duration: 150.ms, delay: 150.ms)
                        .slideY(
                          begin: 0.5,
                          end: 0,
                          duration: 300.ms,
                          curve: Curves.easeOutCubic,
                        ),
              ),
            ),

            33.h.height,

            // Next Button
            AppCustomButton(
                  title: AppStrings.nextBtn,
                  suffixIcon: Icon(
                    Icons.arrow_forward,
                    size: 25.sp,
                    color: AppColors.white,
                  ),
                  onPressed: () {
                    if (currentIndex < onboardingData.length - 1) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                      );
                    } else {
                      Get.toNamed(AppRoutes.completeVerificationView);
                    }
                  },
                )
                .paddingHorizontal(50.w)
                .animate()
                .fadeIn(duration: 200.ms, delay: 200.ms)
                .slideY(
                  begin: 1.0,
                  end: 0,
                  duration: 900.ms,
                  curve: Curves.easeOutBack,
                )
                .then()
                .shimmer(
                  delay: 2600.ms,
                  duration: 1800.ms,
                  color: Colors.white.withValues(alpha: 0.4),
                )
                .then()
                .scaleXY(
                  delay: 3200.ms,
                  duration: 800.ms,
                  begin: 1,
                  end: 1.03,
                  curve: Curves.easeInOut,
                )
                .then()
                .scaleXY(
                  duration: 800.ms,
                  begin: 1.03,
                  end: 1,
                  curve: Curves.easeInOut,
                )
                .then()
                .shake(
                  delay: 4500.ms,
                  hz: 3,
                  duration: 1000.ms,
                  curve: Curves.elasticOut,
                ),

            40.h.height,
          ],
        ).paddingHorizontal(20.w),
      ),
    );
  }
}
