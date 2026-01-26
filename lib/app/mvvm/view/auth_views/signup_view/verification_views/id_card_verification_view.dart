import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:safewallet/app/config/app_assets.dart';
import 'package:safewallet/app/mvvm/view_model/auth_controller/sign_up_controller/verification_controllers/id_card_verfication_controller.dart';
import 'package:safewallet/app/widgets/app_custom_button.dart';
import 'package:safewallet/app/widgets/custom_back_button.dart';
import 'package:safewallet/app/widgets/sizedbox_extension.dart';

import '../../../../../config/app_colors.dart';
import '../../../../../config/app_strings.dart';
import '../../../../../config/app_text_style.dart';

class IDCardVerificationView extends StatefulWidget {
  const IDCardVerificationView({super.key});

  @override
  State<IDCardVerificationView> createState() => _IDCardVerificationViewState();
}

class _IDCardVerificationViewState extends State<IDCardVerificationView> {
  final IDCardVerificationController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button
              CustomBackButton()
                  .animate()
                  .fadeIn(duration: 400.ms)
                  .slideX(begin: -0.3, curve: Curves.easeOut),

              30.h.height,

              // Title
              Text(
                    AppStrings.idCardVerification,
                    style: AppTextStyles.customText24(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 100.ms)
                  .slideY(begin: -0.2, curve: Curves.easeOut),

              20.h.height,

              /// FrontSide
              Text(
                    AppStrings.frontSide,
                    style: AppTextStyles.customText14(
                      color: Colors.white.withValues(alpha: 0.5),
                      fontWeight: FontWeight.w400,
                    ),
                  )
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 200.ms)
                  .slideY(begin: -0.1, curve: Curves.easeOut),

              14.h.height,
              Obx(() {
                    return GestureDetector(
                      onTap: () {
                        controller.prickFrontImage(context);
                      },
                      child: Container(
                        height: 196.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.transparent,
                          border: Border.all(
                            color: AppColors.darkGrey,
                            width: 2.w,
                          ),
                          borderRadius: BorderRadius.circular(10.r),
                          image: controller.rXFrontImage.value != null
                              ? DecorationImage(
                                  image: FileImage(
                                    controller.rXFrontImage.value!,
                                  ),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                        child: controller.rXFrontImage.value == null
                            ? Center(
                                child: ImageIcon(
                                  AssetImage(AppAssets.imgIcon),
                                  color: AppColors.white,
                                  size: 42.w,
                                ),
                              )
                            : null,
                      ),
                    );
                  })
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 300.ms)
                  .scale(
                    begin: const Offset(0.7, 0.7),
                    curve: Curves.easeOutBack,
                  ),

              20.h.height,

              /// Back Side
              Text(
                    AppStrings.backSide,
                    style: AppTextStyles.customText14(
                      color: Colors.white.withValues(alpha: 0.5),
                      fontWeight: FontWeight.w400,
                    ),
                  )
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 200.ms)
                  .slideY(begin: -0.1, curve: Curves.easeOut),

              14.h.height,
              Obx(() {
                    return GestureDetector(
                      onTap: () {
                        controller.prickBackImage(context);
                      },
                      child: Container(
                        height: 196.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.transparent,
                          border: Border.all(
                            color: AppColors.darkGrey,
                            width: 2.w,
                          ),
                          borderRadius: BorderRadius.circular(10.r),
                          image: controller.rXBackImage.value != null
                              ? DecorationImage(
                                  image: FileImage(
                                    controller.rXBackImage.value!,
                                  ),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                        child: controller.rXBackImage.value == null
                            ? Center(
                                child: ImageIcon(
                                  AssetImage(AppAssets.imgIcon),
                                  color: AppColors.white,
                                  size: 42.w,
                                ),
                              )
                            : null,
                      ),
                    );
                  })
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 300.ms)
                  .scale(
                    begin: const Offset(0.7, 0.7),
                    curve: Curves.easeOutBack,
                  ),
              15.h.height,
              Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.white),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.info_outline, color: AppColors.white),
                        10.w.width,
                        Expanded(
                          child: Text(
                            AppStrings.selfieVerificationAdditionalText,
                            style: AppTextStyles.customText12(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ],
                    ).paddingAll(13.sp),
                  )
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 350.ms)
                  .scale(
                    begin: const Offset(0.7, 0.7),
                    curve: Curves.easeOutBack,
                  ),

              15.h.height,
              AppCustomButton(
                    onPressed: () {},
                    title: AppStrings.idCardVerification,
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
}
