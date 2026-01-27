import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:safewallet/app/config/app_routes.dart';
import 'package:safewallet/app/mvvm/view_model/auth_controller/login_controller/login_controller.dart';
import 'package:safewallet/app/widgets/app_custom_button.dart';
import 'package:safewallet/app/widgets/app_custom_field.dart';
import 'package:safewallet/app/widgets/sizedbox_extension.dart';

import '../../../../config/app_assets.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_strings.dart';
import '../../../../config/app_text_style.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginController authController = Get.find();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                60.h.height,

                /// Logo
                Align(
                  alignment: Alignment.center,
                  child:
                      Image.asset(
                            AppAssets.appLogo,
                            height: 125.h,
                            width: 150.w,
                          )
                          .animate()
                          .fadeIn(duration: 800.ms)
                          .scale(
                            begin: const Offset(0.8, 0.8),
                            curve: Curves.easeOutBack,
                          ),
                ),
                60.h.height,

                /// Login Title
                Text(
                      AppStrings.welcome,
                      style: AppTextStyles.customText24(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                    .animate()
                    .fadeIn(duration: 500.ms, delay: 200.ms)
                    .slideY(begin: -0.2, curve: Curves.easeOut),
                8.h.height,

                /// Subtitle
                Text(
                  AppStrings.loginText,
                  style: AppTextStyles.customText14(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ).animate().fadeIn(duration: 500.ms, delay: 300.ms),
                40.h.height,
                AppCustomField(
                      labelTitle: AppStrings.emailAddress,
                      hintText:
                          '${AppStrings.enter} ${AppStrings.emailAddress}',
                      controller: authController.emailController,
                      // validator: (value) {
                      //   if (value == null || value.trim().isEmpty) {
                      //     return AppStrings.emailRequired;
                      //   } else if (!GetUtils.isEmail(value.trim())) {
                      //     return AppStrings.enterValidEmail;
                      //   }
                      //   return null;
                      // },
                    )
                    .animate(delay: 400.ms)
                    .fadeIn(duration: 500.ms)
                    .slideY(begin: 0.2, curve: Curves.easeOut),
                20.h.height,

                /// Password Label & Field
                Obx(
                      () => AppCustomField(
                        labelTitle: AppStrings.password,
                        hintText: '${AppStrings.enter} ${AppStrings.password}',
                        controller: authController.passwordController,
                        obscureText: authController.obscureText.value,
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

                /// Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.forgotPasswordView);
                    },
                    child: Text(
                      AppStrings.forgotPassword,
                      style: AppTextStyles.customText14(
                        color: Colors.white.withValues(alpha: 0.8),
                      ),
                    ),
                  ),
                ).animate(delay: 700.ms).fadeIn(duration: 500.ms),
                70.h.height,

                /// Login Button
                AppCustomButton(
                      title: AppStrings.logIn,
                      onPressed: () async {
                        Get.toNamed(AppRoutes.bottomBarView);
                        //   if (!formKey.currentState!.validate()) {
                        //     return;
                        //   }

                        //   try {
                        //     GetLoader.showAppLoader();
                        //     bool result = await authController.loginMethod(
                        //       context,
                        //     );
                        //     GetLoader.hideAppLoader();
                        //     if (result == true) {
                        //       GlobalVariables.errorMessages.showSuccess();
                        //       // Get.offAllNamed(AppRoutes.bottomBarView);
                        //     } else {
                        //       GlobalVariables.errorMessages.showError();
                        //     }
                        //   } catch (e) {
                        //     GlobalVariables.errorMessages.showError();
                        //   }
                      },
                    )
                    .paddingSymmetric(horizontal: 20.w)
                    .animate(delay: 900.ms)
                    .fadeIn(duration: 500.ms)
                    .scale(
                      begin: const Offset(0.9, 0.9),
                      curve: Curves.easeOutBack,
                    ),
                20.h.height,
                Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.dontHaveAccount,
                          style: AppTextStyles.customText14(
                            color: Colors.white.withValues(alpha: 0.7),
                          ),
                        ),
                        5.w.width,
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.signUpView);
                          },
                          child: Text(
                            AppStrings.signUp,
                            style: AppTextStyles.customText14(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )
                    .animate(delay: 1100.ms)
                    .fadeIn(duration: 600.ms)
                    .slideY(begin: 0.2, curve: Curves.easeOut),
              ],
            ),
          ).paddingSymmetric(horizontal: 15.w),
        ),
      ),
    );
  }
}
