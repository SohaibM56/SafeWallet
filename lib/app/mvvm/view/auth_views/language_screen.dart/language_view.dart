import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:safewallet/app/config/app_assets.dart';
import 'package:safewallet/app/config/app_colors.dart';
import 'package:safewallet/app/config/app_routes.dart';
import 'package:safewallet/app/config/app_strings.dart';
import 'package:safewallet/app/config/app_text_style.dart';
import 'package:safewallet/app/config/padding_extensions.dart';
import 'package:safewallet/app/mvvm/model/body_model/language_body_model.dart';
import 'package:safewallet/app/mvvm/view_model/language_controller/language_controlller.dart';
import 'package:safewallet/app/widgets/app_custom_button.dart';
import 'package:safewallet/app/widgets/custom_app_bar.dart';
import 'package:safewallet/app/widgets/custom_cards/app_custom_card.dart';
import 'package:safewallet/app/widgets/sizedbox_extension.dart';

class LanguageView extends StatefulWidget {
  const LanguageView({super.key});

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  final LanguageControlller controller = Get.put(LanguageControlller());
  bool isFromSettings = false;

  @override
  void initState() {
    final Map<String, dynamic> arguments = Get.arguments ?? {};
    isFromSettings = arguments['isFromSetting'] ?? false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: isFromSettings == true
          ? CustomAppBar(appBarType: AppBarType.custom, title: AppStrings.selectLangTitle, addBackButton: true, centerTitle: true, toolBarHeight: 80.h)
          : CustomAppBar(
              appBarType: AppBarType.custom,
              titleWidget: Image.asset(AppAssets.appHorizontalLogo, height: 44.h),
              addBackButton: false,
              centerTitle: true,
              toolBarHeight: 80.h,
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: isFromSettings == true
          ? null
          : AppCustomButton(
              title: AppStrings.continueText,
              onPressed: () {
                if (isFromSettings == true) {
                  Get.back();
                  return;
                }
                Get.toNamed(AppRoutes.getStartedView);
              },
            ).paddingOnly(bottom: 30.h, right: 25.w, left: 25.w),
      body: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isFromSettings ? SizedBox.shrink() : 20.h.height,
            isFromSettings
                ? SizedBox.shrink()
                : Text(
                    AppStrings.selectLangTitle.tr,
                    style: AppTextStyles.customText20(fontWeight: FontWeight.w600, color: AppColors.white),
                  ),
            3.h.height,
            isFromSettings
                ? SizedBox.shrink()
                : Text(
                    AppStrings.selectLangSubtitle.tr,
                    style: AppTextStyles.customText12(fontWeight: FontWeight.w500, color: AppColors.white.withValues(alpha: 0.5)),
                  ),
            10.h.height,
            Obx(
              () => Column(
                children: [
                  ...List.generate(controller.languages.length, (index) {
                    LanguageBodyModel? language = controller.languages[index];
                    return Column(
                      children: [
                        10.h.height,
                        AppCustomCard(
                          language: language.language,
                          isSelected: controller.selectedLanguage.value == language.language,
                          onPressed: () {
                            controller.selectLanguage(language.language);
                          },
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ),
            Spacer(),

            100.h.height,
          ],
        ).paddingHorizontal(16.h),
      ),
    );
  }
}
