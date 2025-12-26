import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:safewallet/app/config/app_routes.dart';
import 'package:safewallet/app/config/app_strings.dart';
import 'package:safewallet/app/config/app_text_style.dart';
import 'package:safewallet/app/config/padding_extensions.dart';
import 'package:safewallet/app/mvvm/model/body_model/language_body_model.dart';
import 'package:safewallet/app/mvvm/view_model/profile_controllers/profile_controller.dart';
import 'package:safewallet/app/widgets/app_custom_button.dart';
import 'package:safewallet/app/widgets/custom_cards/app_custom_card.dart';
import 'package:safewallet/app/widgets/sizedbox_extension.dart';

class LangugaeSelectSheet extends StatelessWidget {
  const LangugaeSelectSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.find();

    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(AppStrings.language.tr, style: AppTextStyles.customText28(fontWeight: FontWeight.w600)),
            15.h.height,
            Obx(
              () => Column(
                children: [
                  ...List.generate(controller.languages.length, (index) {
                    LanguageBodyModel? language = controller.languages[index];
                    return Column(
                      children: [
                        16.h.height,
                        AppCustomCard(
                          language: language.language,
                          imageUrl: language.imageUrl,
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
            20.h.height,
            AppCustomButton(
              title: AppStrings.continueText,
              onPressed: () {
                Get.toNamed(AppRoutes.getStartedView);
              },
            ).paddingHorizontal(20.w),
            12.h.height,
          ],
        ).paddingAll(20.sp),
      ),
    );
  }
}
