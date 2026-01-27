import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:safewallet/app/config/app_colors.dart';
import 'package:safewallet/app/config/app_routes.dart';
import 'package:safewallet/app/config/app_text_style.dart';
import 'package:safewallet/app/config/padding_extensions.dart';
import 'package:safewallet/app/widgets/app_custom_button.dart';
import 'package:safewallet/app/widgets/app_logol/app_logo_widget.dart';
import 'package:safewallet/app/widgets/custom_app_bar.dart';
import 'package:safewallet/app/widgets/sizedbox_extension.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "title": "Direct Ownership",
      "arabicTitle": "الملكية المباشرة",
      "desc":
          "Your assets are anchored to your identity. SafeWallet provides the rails; you hold the keys via the Secure Enclave.",
      "arabicDesc":
          "أصولك مرتبطة بهويتك الوطنية. توفر ’سيف ووليت‘ البنية التحتية؛ بينما تملك أنت المفاتيح عبر المعالج الآمن.",
    },
    {
      "title": "Invisible Governance",
      "arabicTitle": "الحوكمة الخفية",
      "desc":
          "All transfers are screened by the Vetting Engine to ensure SAMA compliance and national asset protection.",
      "arabicDesc":
          "تخضع جميع التحويلات لفحص ’محرك التدقيق‘ لضمان الامتثال لمعايير ’ساما‘ وحماية الأصول الوطنية.",
    },
    {
      "title": "Identity Recovery",
      "arabicTitle": "استعادة الهوية",
      "desc":
          "Your NAFATH identity is your recovery anchor. No passwords, no central database. Pure identity-based security.",
      "arabicDesc":
          "هويتك في ’نفاذ‘ هي مرجعك للاستعادة. لا كلمات مرور، ولا قواعد بيانات مركزية. أمان قائم كلياً على الهوية.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: CustomAppBar(appBarType: AppBarType.custom, addBackButton: false),
      body: SafeArea(
        child: Column(
          children: [
            AppLogoWidget(),
            SizedBox(
              height: 200.h,
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingData.length,
                onPageChanged: (index) {
                  setState(() => currentIndex = index);
                },
                itemBuilder: (context, index) {
                  final item = onboardingData[index];

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        item["title"] ?? "",
                        style: AppTextStyles.customText22(
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                      ),
                      5.h.height,
                      Text(
                        item["arabicTitle"] ?? "",
                        style: AppTextStyles.customText22(
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                      ),
                      5.h.height,
                      Text(
                        item["desc"] ?? "",
                        textAlign: TextAlign.center,
                        style: AppTextStyles.customText14(
                          fontWeight: FontWeight.w500,
                          color: AppColors.white.withValues(alpha: 0.8),
                        ),
                      ),
                      5.h.height,
                      Text(
                        item["arabicDesc"] ?? "",
                        textAlign: TextAlign.center,
                        style: AppTextStyles.customText14(
                          fontWeight: FontWeight.w500,
                          color: AppColors.white.withValues(alpha: 0.8),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ).paddingVertical(90.h),

            // Dots indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingData.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: currentIndex == index ? 14 : 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: currentIndex == index
                        ? Colors.white
                        : Colors.white38,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            33.h.height,

            // Next Button
            AppCustomButton(
              title: "Next",
              onPressed: () {
                // if (currentIndex < onboardingData.length - 1) {
                //   _pageController.nextPage(
                //     duration: const Duration(milliseconds: 300),
                //     curve: Curves.easeOut,
                //   );
                // } else {
                Get.offAllNamed(AppRoutes.bottomBarView);
                // }
              },
            ).paddingHorizontal(50.w),

            // 40.h.height,
          ],
        ).paddingHorizontal(20.w),
      ),
    );
  }
}
