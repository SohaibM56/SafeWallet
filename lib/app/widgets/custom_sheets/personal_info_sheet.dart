import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:safewallet/app/config/app_routes.dart';
import 'package:safewallet/app/config/app_strings.dart';
import 'package:safewallet/app/config/app_text_style.dart';
import 'package:safewallet/app/config/padding_extensions.dart';
import 'package:safewallet/app/mvvm/view_model/profile_controllers/profile_controller.dart';
import 'package:safewallet/app/widgets/app_custom_button.dart';
import 'package:safewallet/app/widgets/app_custom_field.dart';
import 'package:safewallet/app/widgets/sizedbox_extension.dart';

import '../../config/app_assets.dart';
import '../../config/app_colors.dart';
import '../../config/utils.dart';

class PersonalInfoSheet extends StatelessWidget {
  const PersonalInfoSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(Icons.close, color: AppColors.black, size: 24.sp),
              ),
            ).paddingRight(5.w),
            Text(
              AppStrings.personalInfo.tr,
              style: AppTextStyles.customText24(fontWeight: FontWeight.w600),
            ),
            15.h.height,

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
                      image: controller.rXFile.value != null
                          ? DecorationImage(
                        image: FileImage(
                          controller.rXFile.value!,
                        ),
                        fit: BoxFit.cover,
                      )
                          : null,
                    ),
                    child: controller.rXFile.value == null
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
                          await controller
                              .pickProfileFromCamera();
                        },
                        onGalleryTap: () async {
                          Navigator.of(context).pop();
                          await controller
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
            ),

            20.h.height,

            AppCustomField(
              labelColor: AppColors.black,
              hintColor: AppColors.hintTextColor,
              labelTitle: "Full Name",
              hintText: "Enter Full Name",
              labelTitleSize : 14.sp
            ),

            20.h.height,

            AppCustomField(
              labelColor: AppColors.black,
              hintColor: AppColors.hintTextColor,
              labelTitle: "Email Address",
              hintText: "Enter Email Address",
              labelTitleSize : 14.sp
            ),

            20.h.height,
            AppCustomButton(
              title: "Okay",
              onPressed: () {
                Get.toNamed(AppRoutes.getStartedView);
              },
            ).paddingHorizontal(30.w),
            12.h.height,
          ],
        ).paddingAll(20.sp),
      ),
    );
  }
}
