import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:safewallet/app/config/app_colors.dart';
import 'package:safewallet/app/config/app_text_style.dart';
import 'package:safewallet/app/config/padding_extensions.dart';
import 'package:safewallet/app/widgets/custom_menu_tile.dart';
import 'package:safewallet/app/widgets/custom_sheets/language_select_sheet.dart';
import 'package:safewallet/app/widgets/custom_sheets/personal_info_sheet.dart';
import 'package:safewallet/app/widgets/sizedbox_extension.dart';

import '../../../../config/app_assets.dart';
import '../../../../config/app_routes.dart';
import '../../../../config/utils.dart';
import '../../../../widgets/custom_sheets/logout_sheet.dart';
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
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Column(
          children: [
            20.h.height,
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 30.h),
                      child: Stack(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 200.h,
                            child: SvgPicture.asset(
                              AppAssets.backgroundCard,
                              width: double.infinity,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 85.h,
                              bottom: 30.h,
                              left: 20.w,
                              right: 20.w,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'Android Toker',
                                  style: AppTextStyles.customText16(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ).animate().fadeIn(
                                  duration: 600.ms,
                                  delay: 400.ms,
                                ),
                                2.h.height,
                                Text(
                                  'androidToker58272@jeux.com',
                                  style: AppTextStyles.customText(
                                    fontSize: 13.sp,
                                    color: Colors.white.withValues(alpha: 0.6),
                                  ),
                                ).animate().fadeIn(
                                  duration: 600.ms,
                                  delay: 500.ms,
                                ),
                                5.h.height,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      AppAssets.clipIcon,
                                      color: Colors.white.withValues(
                                        alpha: 0.6,
                                      ),
                                    ),
                                    5.w.width,
                                    Text(
                                      'tb1qxy2kgdygj rsqtzg2n0yrf24',
                                      style: AppTextStyles.customText(
                                        fontSize: 13.sp,
                                        color: Colors.white.withValues(
                                          alpha: 0.6,
                                        ),
                                      ),
                                    ),
                                  ],
                                ).animate().fadeIn(
                                  duration: 600.ms,
                                  delay: 600.ms,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                    .animate()
                    .fadeIn(duration: 600.ms, delay: 200.ms)
                    .slideY(begin: 0.3, curve: Curves.easeOutCubic),
                Positioned(
                  top: 0,
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
                                    Utils.showBottomSheet(
                                      context: context,
                                      child: PersonalInfoSheet(),
                                    );
                                    // Utils.showPickImageOptionsDialog(
                                    //   context,
                                    //   onCameraTap: () async {
                                    //     Navigator.of(context).pop();
                                    //     await controller
                                    //         .pickProfileFromCamera();
                                    //   },
                                    //   onGalleryTap: () async {
                                    //     Navigator.of(context).pop();
                                    //     await controller
                                    //         .pickProfileFromGallery();
                                    //   },
                                    // );
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
              ],
            ),

            Expanded(
                  child: SingleChildScrollView(
                    child: Container(
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
                              icon: AppAssets.notificationIcon,
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
                            icon: AppAssets.langIcon,
                            title: 'Language',
                            onTap: () => Utils.showBottomSheet(
                              context: context,
                              child: LangugaeSelectSheet(),
                            ),
                          ),
                          Divider(
                            color: Colors.white.withValues(alpha: 0.1),
                          ).paddingHorizontal(10.w),
                          CustomMenuTile(
                            icon: AppAssets.shieldIcon,
                            title: 'KYC Status',
                            isApproved: true,
                          ),
                          Divider(
                            color: Colors.white.withValues(alpha: 0.1),
                          ).paddingHorizontal(10.w),
                          CustomMenuTile(
                            icon: AppAssets.currencyIcon,
                            title: 'Currency',
                            onTap: () => Get.toNamed(AppRoutes.currencyView),
                          ),
                          Divider(
                            color: Colors.white.withValues(alpha: 0.1),
                          ).paddingHorizontal(10.w),
                          CustomMenuTile(
                            icon: AppAssets.supportIcon,
                            title: 'Help & Support',
                            onTap: () => Get.toNamed(AppRoutes.supportView),
                          ),
                          Divider(
                            color: Colors.white.withValues(alpha: 0.1),
                          ).paddingHorizontal(10.w),
                          CustomMenuTile(
                            icon: AppAssets.logoutIcon,
                            title: 'Logout',
                            onTap: () => Utils.showBottomSheet(
                              context: context,
                              child: LogoutSheet(),
                            ),
                          ).paddingBottom(5.h),
                        ],
                      ),
                    ),
                  ),
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
