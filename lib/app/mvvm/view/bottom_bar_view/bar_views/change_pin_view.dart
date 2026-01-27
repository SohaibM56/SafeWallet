import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:safewallet/app/config/app_colors.dart';
import 'package:safewallet/app/config/app_text_style.dart';
import 'package:safewallet/app/mvvm/view_model/change_pin_controller/change_pin_controller.dart';
import 'package:safewallet/app/widgets/app_custom_button.dart';
import 'package:safewallet/app/widgets/app_custom_field.dart';
import 'package:safewallet/app/widgets/custom_app_bar.dart';
import 'package:safewallet/app/widgets/sizedbox_extension.dart';

class ChangePinView extends StatefulWidget {
  const ChangePinView({super.key});

  @override
  State<ChangePinView> createState() => _ChangePinViewState();
}

class _ChangePinViewState extends State<ChangePinView> {
  final ChangePinController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: CustomAppBar(appBarType: AppBarType.backWithLogo),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              80.h.height,

              Text(
                    'Change PIN',
                    style: AppTextStyles.customText24(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                  .animate()
                  .fadeIn(duration: 600.ms)
                  .slideX(begin: -0.2, end: 0, duration: 600.ms),

              8.h.height,

              Text(
                    'Create a PIN to secure your wallet',
                    style: AppTextStyles.customText14(
                      color: AppColors.lightGrey,
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                    ),
                  )
                  .animate()
                  .fadeIn(delay: 200.ms, duration: 600.ms)
                  .slideX(begin: -0.2, end: 0, delay: 200.ms, duration: 600.ms),
              25.h.height,
              Container(
                    margin: EdgeInsets.symmetric(horizontal: 0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.white.withOpacity(.2),
                      ),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 10.h,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppCustomField(
                              labelTitle: 'Enter PIN',
                              hintText: '••••••',
                              textSize: 13.sp,
                              obscuringCharacter: "●",
                              counterColor: AppColors.transparent,
                              maxLength: 6,
                              hintColor: AppColors.white,

                              hintFontWeight: FontWeight.w900,
                              hintTextFontSize: 17.sp,
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Pin is required';
                                }
                                return null;
                              },
                              isSecondField: true,
                            )
                            .animate()
                            .fadeIn(duration: 600.ms, delay: 600.ms)
                            .slideY(begin: 0.2, end: 0, delay: 600.ms)
                            .scale(
                              begin: const Offset(0.95, 0.95),
                              end: const Offset(1, 1),
                              curve: Curves.easeOutBack,
                              delay: 100.ms,
                            ),

                        AppCustomField(
                              labelTitle: 'New PIN',
                              hintText: '••••••',
                              textSize: 13.sp,
                              obscuringCharacter: "●",

                              counterColor: AppColors.transparent,
                              maxLength: 6,

                              hintColor: AppColors.white,

                              hintFontWeight: FontWeight.w900,
                              hintTextFontSize: 17.sp,
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'New Pin is required';
                                }
                                return null;
                              },
                              isSecondField: true,
                            )
                            .animate()
                            .fadeIn(duration: 600.ms, delay: 600.ms)
                            .slideY(begin: 0.2, end: 0, delay: 600.ms)
                            .scale(
                              begin: const Offset(0.95, 0.95),
                              end: const Offset(1, 1),
                              curve: Curves.easeOutBack,
                              delay: 120.ms,
                            ),

                        AppCustomField(
                              labelTitle: 'Confirm New PIN',
                              hintText: '••••••',
                              textSize: 13.sp,
                              obscuringCharacter: "●",

                              counterColor: AppColors.transparent,
                              maxLength: 6,
                              hintColor: AppColors.white,
                              hintFontWeight: FontWeight.w900,
                              hintTextFontSize: 17.sp,
                              controller: controller.confirmPinController,
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Confirm Pin is required';
                                }

                                // else if (value !=
                                //     authController.passwordController.text) {
                                //   return 'Passwords do not match';
                                // }
                                return null;
                              },
                              isSecondField: true,
                            )
                            .animate()
                            .fadeIn(duration: 600.ms, delay: 600.ms)
                            .slideY(begin: 0.2, end: 0, delay: 600.ms)
                            .scale(
                              begin: const Offset(0.95, 0.95),
                              end: const Offset(1, 1),
                              curve: Curves.easeOutBack,
                              delay: 150.ms,
                            ),
                      ],
                    ),
                  )
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 600.ms)
                  .slideY(begin: 0.2, end: 0, delay: 600.ms)
                  .scale(
                    begin: const Offset(0.95, 0.95),
                    end: const Offset(1, 1),
                    curve: Curves.easeOutBack,
                    delay: 50.ms,
                  ),
              56.h.height,
              AppCustomButton(
                    title: 'Save',
                    borderRadius: 100.r,
                    onPressed: () async {},
                    bgColor: AppColors.primary,
                  )
                  .paddingSymmetric(horizontal: 30.w)
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 600.ms)
                  .slideY(begin: 0.2, end: 0, delay: 600.ms)
                  .scale(
                    begin: const Offset(0.95, 0.95),
                    end: const Offset(1, 1),
                    curve: Curves.easeOutBack,
                    delay: 100.ms,
                  ),
            ],
          ).paddingSymmetric(horizontal: 24.w),
        ),
      ),
    );
  }
}
