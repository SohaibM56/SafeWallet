import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:safewallet/app/config/app_assets.dart';
import 'package:safewallet/app/config/app_colors.dart';
import 'package:safewallet/app/config/app_routes.dart';
import 'package:safewallet/app/config/app_text_style.dart';
import 'package:safewallet/app/config/padding_extensions.dart';
import 'package:safewallet/app/widgets/custom_app_bar.dart';
import 'package:safewallet/app/widgets/sizedbox_extension.dart';

class SetupWalletView extends StatefulWidget {
  const SetupWalletView({super.key});

  @override
  State<SetupWalletView> createState() => _SetupWalletViewState();
}

class _SetupWalletViewState extends State<SetupWalletView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBgColor,
      appBar: CustomAppBar(title: '', backgroundColor: Colors.transparent),
      body: Column(
        children: [

          10.h.height,
          Align(
            alignment: AlignmentGeometry.centerLeft,
            child: Text(
              'Setup Your Wallet',
              style: AppTextStyles.customText24(color: Colors.white, fontWeight: FontWeight.w700),
            ),
          ),
          Align(
            alignment: AlignmentGeometry.centerLeft,
            child: Text('Create a new wallet or import an existing one', style: AppTextStyles.customText14(color: Colors.white)),
          ),
          25.h.height,
          GestureDetector(
            onTap: () {
              Get.offAllNamed(AppRoutes.loginView);
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10.sp),
                border: Border.all(color: Colors.white.withOpacity(0.5)),
              ),
              child: Column(
                children: [
                  Image.asset(AppAssets.addWalletIcon, height: 40.h),
                  8.h.height,
                  Text(
                    'Create New Wallet',
                    style: AppTextStyles.customText16(color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                  3.h.height,
                  Text('Generate a new 12-word recovery phrase', style: AppTextStyles.customText14(color: Colors.white.withOpacity(0.5))),
                ],
              ).paddingVertical(20.h),
            ),
          ),
          15.h.height,
          GestureDetector(
            onTap: () {
              Get.offAllNamed(AppRoutes.loginView);
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10.sp),
                border: Border.all(color: Colors.white.withOpacity(0.5)),
              ),
              child: Column(
                children: [
                  Image.asset(AppAssets.importWalletIcon, height: 40.h),
                  8.h.height,
                  Text(
                    'Import Existing Wallet',
                    style: AppTextStyles.customText16(color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                  3.h.height,
                  Text('Restore using your recovery phrase', style: AppTextStyles.customText14(color: Colors.white.withOpacity(0.5))),
                ],
              ).paddingVertical(20.h),
            ),
          ),
        ],
      ).paddingHorizontal(15.w),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color(0xff151F24),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20.sp), topRight: Radius.circular(20.sp)),
          border: Border.symmetric(horizontal: BorderSide(color: Colors.white.withOpacity(0.17))),
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(AppAssets.securityIcon, height: 22.h).paddingTop(10.h),
              10.w.width,
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Non-Custodial Security',
                    style: AppTextStyles.customText16(color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Your private keys are stored securely on\nyour device. You own your keys.',
                    style: AppTextStyles.customText12(color: Colors.white.withOpacity(0.5)),
                  ),
                ],
              ),
            ],
          ).paddingTop(15.sp).paddingHorizontal(15.w),
        ),
      ),
    );
  }
}
