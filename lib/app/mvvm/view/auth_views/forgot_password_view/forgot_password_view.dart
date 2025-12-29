import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:safewallet/app/mvvm/view_model/auth_controller/forgot_password_controller/forgot_password_controller.dart';
import 'package:safewallet/app/widgets/app_custom_button.dart';
import 'package:safewallet/app/widgets/app_custom_field.dart';
import 'package:safewallet/app/widgets/custom_back_button.dart';
import 'package:safewallet/app/widgets/sizedbox_extension.dart';

import '../../../../config/app_routes.dart';
import '../../../../config/app_strings.dart';
import '../../../../config/app_text_style.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final ForgotPasswordController authController = Get.find();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF05080F), Color(0xFF0D121F)],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomBackButton(isWhite: true)
                        .animate()
                        .fadeIn(duration: 400.ms)
                        .slideX(begin: -0.3, curve: Curves.easeOut),

                    30.h.height,

                    Text(
                          'Forgot Password',
                          style: AppTextStyles.customText24(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                        .animate()
                        .fadeIn(duration: 600.ms, delay: 100.ms)
                        .slideY(begin: -0.2, curve: Curves.easeOut),

                    8.h.height,

                    /// Subtitle
                    Text(
                          'Enter your registered email to\nreceive a reset link.',
                          style: AppTextStyles.customText16(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          ),
                        )
                        .animate()
                        .fadeIn(duration: 600.ms, delay: 200.ms)
                        .slideY(begin: -0.1, curve: Curves.easeOut),

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
                        .animate(delay: 500.ms)
                        .fadeIn(duration: 500.ms)
                        .slideY(begin: 0.2, curve: Curves.easeOut),

                    50.h.height,

                    /// Sign Up Button
                    AppCustomButton(
                          title: "Reset Password",
                          onPressed: () {
                            Get.offAllNamed(AppRoutes.loginView);
                          },
                        )
                        .paddingSymmetric(horizontal: 20.w)
                        .animate(delay: 1000.ms)
                        .fadeIn(duration: 600.ms)
                        .scale(
                          begin: const Offset(0.95, 0.95),
                          curve: Curves.easeOutBack,
                        ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
