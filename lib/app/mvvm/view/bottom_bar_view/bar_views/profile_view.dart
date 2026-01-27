import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:safewallet/app/config/app_colors.dart';
import 'package:safewallet/app/config/app_routes.dart';
import 'package:safewallet/app/config/app_text_style.dart';
import 'package:safewallet/app/config/padding_extensions.dart';
import 'package:safewallet/app/widgets/custom_menu_tile.dart';
import 'package:safewallet/app/widgets/data_show_widget.dart';
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

            Text(
              'Welcome Back',
              style: AppTextStyles.customTextRboto(
                fontSize: 15.sp,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
            Row(
              children: [
                Text(
                  'SEC Wallet',
                  style: AppTextStyles.customTextRboto(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                Spacer(),

                Image.asset(AppAssets.kycImage, height: 44.h, width: 89.w),
                9.w.width,
                Stack(
                  children: [
                    Container(
                      height: 44.r,
                      width: 44.r,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.borderGrey.withOpacity(.3),
                          width: 1.5,
                        ),
                        shape: BoxShape.circle,
                        color: Color(0xff132D28),
                      ),
                      child: Center(
                        child: Image.asset(
                          AppAssets.filledNotificationIcon,
                          height: 21.sp,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 12.w,
                      top: 13.h,
                      child: SvgPicture.asset(AppAssets.solidDot, height: 8.h),
                    ),
                  ],
                ),
              ],
            ),

            CustomDataShow(),
            Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Security',
                          style: AppTextStyles.customTextRboto(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.white,
                          ),
                        ).paddingVertical(8.h),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.1),
                              width: 1.w,
                            ),
                          ),
                          child: Column(
                            children: [
                              CustomMenuTile(
                                icon: AppAssets.lockTransaction,
                                onTap: () =>
                                    Get.toNamed(AppRoutes.changePinView),
                                title: 'Change Transaction PIN',
                              ),
                              Divider(
                                color: Colors.white.withValues(alpha: 0.1),
                              ).paddingHorizontal(10.w),
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

                        Text(
                          'Preferences ',
                          style: AppTextStyles.customTextRboto(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.white,
                          ),
                        ).paddingVertical(8.h),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.1),
                              width: 1.w,
                            ),
                          ),
                          child: Column(
                            children: [
                              Obx(
                                () => CustomMenuTile(
                                  icon: AppAssets.notification,
                                  title: 'Push Notifications',
                                  isToggle: controller.isToggleEnabled.value,
                                  onToggle: () {
                                    controller.isToggleEnabled.value =
                                        !controller.isToggleEnabled.value;
                                  },
                                ),
                              ),
                              Divider(
                                color: Colors.white.withValues(alpha: 0.1),
                              ).paddingHorizontal(10.w),
                              CustomMenuTile(
                                icon: AppAssets.langIcon2,
                                title: 'Language',
                                onTap: () {
                                  Get.toNamed(
                                    AppRoutes.languageView,
                                    arguments: {'isFromSetting': true},
                                  );
                                },
                              ),
                            ],
                          ),
                        ),

                        Text(
                          'Support',
                          style: AppTextStyles.customTextRboto(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.white,
                          ),
                        ).paddingVertical(8.h),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.1),
                              width: 1.w,
                            ),
                          ),
                          child: Column(
                            children: [
                              CustomMenuTile(
                                icon: AppAssets.termsServiceIcon,
                                title: 'Terms of Service',
                                onTap: () =>
                                    Get.toNamed(AppRoutes.termServiceView),
                              ),

                              Divider(
                                color: Colors.white.withValues(alpha: 0.1),
                              ).paddingHorizontal(10.w),
                              CustomMenuTile(
                                icon: AppAssets.privacyPolicyIcon,
                                title: 'Privacy Policy',
                                onTap: () => Get.toNamed(AppRoutes.privacyView),
                              ),
                              Divider(
                                color: Colors.white.withValues(alpha: 0.1),
                              ).paddingHorizontal(10.w),
                              CustomMenuTile(
                                icon: AppAssets.aboutUsIcon,
                                title: 'About us',
                                onTap: () => Get.toNamed(AppRoutes.aboutusView),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ).paddingTop(15.h),
                )
                .animate()
                .fadeIn(duration: 600.ms, delay: 300.ms)
                .scale(
                  begin: const Offset(0.7, 0.7),
                  curve: Curves.easeOutBack,
                ),
            20.h.height,
          ],
        ).paddingHorizontal(20.w),
      ),
    );
  }
}
