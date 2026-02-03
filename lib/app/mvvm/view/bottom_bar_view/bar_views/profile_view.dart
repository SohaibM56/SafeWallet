import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:safewallet/app/config/app_colors.dart';
import 'package:safewallet/app/config/app_routes.dart';
import 'package:safewallet/app/config/app_text_style.dart';
import 'package:safewallet/app/config/padding_extensions.dart';
import 'package:safewallet/app/widgets/common_app_bar.dart';
import 'package:safewallet/app/widgets/custom_menu_tile.dart';
import 'package:safewallet/app/widgets/sizedbox_extension.dart';

import '../../../../config/app_assets.dart';
import '../../../view_model/profile_controllers/profile_controller.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final ProfileController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.h.height,
            CommonAppBar(),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Security', style: AppTextStyles.customText(fontSize: 16, color: AppColors.white)),
                    8.h.height,
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14.sp),
                        border: Border.all(color: AppColors.white.withOpacity(0.2)),
                      ),
                      child: Column(
                        children: [
                          CustomMenuTile(icon: AppAssets.lockTransaction, onTap: () => Get.toNamed(AppRoutes.changePinView), title: 'Change Transaction PIN'),
                          Divider(color: AppColors.white.withOpacity(0.1), thickness: 1.h).paddingHorizontal(10.w),
                          CustomMenuTile(
                            icon: AppAssets.autoLock,
                            title: 'Auto Lock',
                            onTap: () {
                              Get.toNamed(AppRoutes.autoLockTimeView);
                            },
                          ),
                        ],
                      ),
                    ),
                    15.h.height,
                    Text('Preferences ', style: AppTextStyles.customText(fontSize: 16, color: AppColors.white)),
                    10.h.height,
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14.sp),
                        border: Border.all(color: AppColors.white.withOpacity(0.2)),
                      ),
                      child: Column(
                        children: [
                          Obx(
                            () => CustomMenuTile(
                              icon: AppAssets.notification,
                              title: 'Push Notifications',
                              isToggle: controller.isToggleEnabled.value,
                              onToggle: () {
                                controller.isToggleEnabled.value = !controller.isToggleEnabled.value;
                              },
                            ),
                          ),
                          Divider(color: AppColors.white.withOpacity(0.1), thickness: 1.h).paddingHorizontal(10.w),
                          CustomMenuTile(
                            icon: AppAssets.langIcon2,
                            title: 'Language',
                            onTap: () {
                              Get.toNamed(AppRoutes.languageView, arguments: {'isFromSetting': true});
                            },
                          ),
                        ],
                      ),
                    ),
                    15.h.height,
                    Text('Support', style: AppTextStyles.customText(fontSize: 16, color: AppColors.white)),
                    15.h.height,
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14.sp),
                        border: Border.all(color: AppColors.white.withOpacity(0.2)),
                      ),
                      child: Column(
                        children: [
                          CustomMenuTile(icon: AppAssets.termsServiceIcon, title: 'Terms of Service', onTap: () => Get.toNamed(AppRoutes.termServiceView)),
                          Divider(color: AppColors.white.withOpacity(0.1), thickness: 1.h).paddingHorizontal(10.w),
                          CustomMenuTile(icon: AppAssets.privacyPolicyIcon, title: 'Privacy Policy', onTap: () => Get.toNamed(AppRoutes.privacyView)),
                          Divider(color: AppColors.white.withOpacity(0.1), thickness: 1.h).paddingHorizontal(10.w),
                          CustomMenuTile(icon: AppAssets.aboutUsIcon, title: 'About us', onTap: () => Get.toNamed(AppRoutes.aboutusView)),
                        ],
                      ),
                    ),
                  ],
                ),
              ).paddingTop(15.h),
            ).animate().fadeIn(duration: 600.ms, delay: 150.ms).slideY(begin: -0.2, curve: Curves.easeOut),
            20.h.height,
          ],
        ).paddingHorizontal(20.w),
      ),
    );
  }
}
