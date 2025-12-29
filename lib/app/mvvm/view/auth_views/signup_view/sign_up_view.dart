import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:safewallet/app/config/app_routes.dart';
import 'package:safewallet/app/mvvm/view_model/auth_controller/sign_up_controller/sign_up_controller.dart';
import 'package:safewallet/app/widgets/app_custom_button.dart';
import 'package:safewallet/app/widgets/app_custom_field.dart';
import 'package:safewallet/app/widgets/custom_app_bar.dart';
import 'package:safewallet/app/widgets/custom_pickers/country_picker_widget.dart';
import 'package:safewallet/app/widgets/sizedbox_extension.dart';

import '../../../../config/app_assets.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_strings.dart';
import '../../../../config/app_text_style.dart';
import '../../../../config/utils.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final SignUpController authController = Get.find();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: CustomAppBar(title: '', backgroundColor: Colors.transparent),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                      AppStrings.signUp,
                      style: AppTextStyles.customText24(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                    .animate()
                    .fadeIn(duration: 600.ms, delay: 100.ms)
                    .slideY(begin: -0.2, curve: Curves.easeOut),
                5.h.height,
                Text(
                      AppStrings.signUpText,
                      style: AppTextStyles.customText16(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                    .animate()
                    .fadeIn(duration: 600.ms, delay: 200.ms)
                    .slideY(begin: -0.1, curve: Curves.easeOut),

                20.h.height,

                Center(
                  child:
                      Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.bottomRight,
                            children: [
                              Obx(() {
                                return Container(
                                  height: 110.h,
                                  width: 110.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey[200],
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 4,
                                    ),
                                    image: authController.rXfile.value != null
                                        ? DecorationImage(
                                            image: FileImage(
                                              authController.rXfile.value!,
                                            ),
                                            fit: BoxFit.cover,
                                          )
                                        : null,
                                  ),
                                  child: authController.rXfile.value == null
                                      ? ClipOval(
                                          child: Image.asset(
                                            AppAssets.placeholder,
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      : null,
                                );
                              }),
                              Positioned(
                                bottom: 5.h,
                                right: 5.w,
                                child: GestureDetector(
                                  onTap: () {
                                    Utils.showPickImageOptionsDialog(
                                      context,
                                      onCameraTap: () async {
                                        Navigator.of(context).pop();
                                        await authController
                                            .pickProfileFromCamera();
                                      },
                                      onGalleryTap: () async {
                                        Navigator.of(context).pop();
                                        await authController
                                            .pickProfileFromGallery();
                                      },
                                    );
                                  },
                                  child: SvgPicture.asset(
                                    AppAssets.cameraIc,
                                    height: 25.h,
                                  ),
                                ),
                              ),
                            ],
                          )
                          .animate()
                          .fadeIn(duration: 600.ms, delay: 300.ms)
                          .scale(
                            begin: const Offset(0.7, 0.7),
                            curve: Curves.easeOutBack,
                          ),
                ),
                20.h.height,
                AppCustomField(
                      labelTitle: AppStrings.fullName,
                      hintText: '${AppStrings.enter} ${AppStrings.fullName}',
                      controller: authController.nameController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return AppStrings.fullNameRequired;
                        }
                        return null;
                      },
                    )
                    .animate(delay: 500.ms)
                    .fadeIn(duration: 500.ms)
                    .slideY(begin: 0.2, curve: Curves.easeOut),
                20.h.height,
                AppCustomField(
                      labelTitle: AppStrings.emailAddress,
                      hintText:
                          '${AppStrings.enter} ${AppStrings.emailAddress}',
                      controller: authController.emailController,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 16.h,
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return AppStrings.emailRequired;
                        } else if (!GetUtils.isEmail(value.trim())) {
                          return AppStrings.enterValidEmail;
                        }
                        return null;
                      },
                    )
                    .animate(delay: 600.ms)
                    .fadeIn(duration: 500.ms)
                    .slideY(begin: 0.2, curve: Curves.easeOut),
                20.h.height,

                Obx(
                  () =>
                      CountryPickerWidget(
                            labelText: AppStrings.phoneNumber,
                            controller: authController.phoneController,
                            selectedCountry:
                                authController.selectedCountry.value,
                            isRequired: true,
                            onCountrySelected: (country) {
                              authController.selectedCountry.value = country;
                            },
                            onPhoneNumberChanged: (value) {
                              // yahan phone number mil jayega
                              debugPrint("Phone: $value");
                            },
                          )
                          .animate(delay: 650.ms)
                          .fadeIn(duration: 500.ms)
                          .slideY(begin: 0.2, curve: Curves.easeOut),
                ),
                20.h.height,
                Obx(
                      () => AppCustomField(
                        labelTitle: AppStrings.password,
                        hintText: '${AppStrings.enter} ${AppStrings.password}',
                        controller: authController.passwordController,
                        obscureText: authController.obscureText.value,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return AppStrings.confirmPasswordRequired;
                          } else if (value.length < 6) {
                            return AppStrings.passLengthError;
                          } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
                            return AppStrings.passCapLetterError;
                          } else if (!RegExp(r'[a-z]').hasMatch(value)) {
                            return AppStrings.passSmallLetterError;
                          } else if (!RegExp(r'[0-9]').hasMatch(value)) {
                            return AppStrings.passNumError;
                          }
                          return null;
                        },
                        suffixIcon: GestureDetector(
                          onTap: () {
                            authController.obscureText.value =
                                !authController.obscureText.value;
                          },
                          child: Icon(
                            authController.obscureText.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            size: 20.sp,
                          ),
                        ),
                      ),
                    )
                    .animate(delay: 600.ms)
                    .fadeIn(duration: 500.ms)
                    .slideY(begin: 0.2, curve: Curves.easeOut),
                20.h.height,
                Obx(
                      () => AppCustomField(
                        labelTitle: AppStrings.confirmPassword,
                        hintText:
                            '${AppStrings.enter} ${AppStrings.confirmPassword}',
                        controller: authController.confirmPasswordController,
                        obscureText: authController.confirmObscureText.value,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return AppStrings.confirmPasswordRequired;
                          } else if (value !=
                              authController.passwordController.text) {
                            return AppStrings.passwordsDoNotMatch;
                          }
                          return null;
                        },
                        suffixIcon: GestureDetector(
                          onTap: () {
                            authController.confirmObscureText.value =
                                !authController.confirmObscureText.value;
                          },
                          child: Icon(
                            authController.confirmObscureText.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            size: 20.sp,
                          ),
                        ),
                      ),
                    )
                    .animate(delay: 600.ms)
                    .fadeIn(duration: 500.ms)
                    .slideY(begin: 0.2, curve: Curves.easeOut),
                50.h.height,
                AppCustomButton(
                      title: AppStrings.next,
                      onPressed: () {
                        Get.toNamed(AppRoutes.verificationView);
                      },
                    )
                    .paddingSymmetric(horizontal: 20.w)
                    .animate(delay: 1000.ms)
                    .fadeIn(duration: 600.ms)
                    .scale(
                      begin: const Offset(0.95, 0.95),
                      curve: Curves.easeOutBack,
                    ),
                40.h.height,
                Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.alreadyHaveAccount,
                          style: AppTextStyles.customText14(
                            color: Colors.white.withValues(alpha: 0.7),
                          ),
                        ),
                        5.w.width,
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Text(
                            AppStrings.signIn,
                            style: AppTextStyles.customText14(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )
                    .animate(delay: 1150.ms)
                    .fadeIn(duration: 600.ms)
                    .slideY(begin: 0.2, curve: Curves.easeOut),
                20.h.height,
              ],
            ),
          ).paddingSymmetric(horizontal: 15.w),
        ),
      ),
    );
  }
}
