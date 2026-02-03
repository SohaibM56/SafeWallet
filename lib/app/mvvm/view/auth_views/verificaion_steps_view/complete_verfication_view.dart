import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:safewallet/app/config/app_assets.dart';
import 'package:safewallet/app/config/app_colors.dart';
import 'package:safewallet/app/config/app_routes.dart';
import 'package:safewallet/app/config/app_strings.dart';
import 'package:safewallet/app/config/app_text_style.dart';
import 'package:safewallet/app/config/padding_extensions.dart';
import 'package:safewallet/app/widgets/app_custom_button.dart';
import 'package:safewallet/app/widgets/custom_app_bar.dart';
import 'package:safewallet/app/widgets/sizedbox_extension.dart';

class ComleteVerificationView extends StatefulWidget {
  const ComleteVerificationView({super.key});

  @override
  State<ComleteVerificationView> createState() => _ComleteVerificationViewState();
}

class _ComleteVerificationViewState extends State<ComleteVerificationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: CustomAppBar(
        appBarType: AppBarType.centeredTitle,
        toolBarHeight: 80.h,
        titleWidget: Image.asset(AppAssets.appHorizontalLogo, height: 44.h),
      ),
      body: SafeArea(
        child: Column(
          children: [
            80.h.height,

            // Title
            Text(
                  AppStrings.completeVerificationTitle,
                  style: AppTextStyles.customText28(color: Colors.white, fontWeight: FontWeight.w700),
                )
                .paddingSymmetric(horizontal: 30.w)
                .animate()
                .fadeIn(duration: 400.ms, delay: 300.ms)
                .slideY(begin: 0.3, end: 0, duration: 600.ms, curve: Curves.easeOutCubic)
                .scaleXY(begin: 0.98, end: 1.0, curve: Curves.easeOutBack),

            10.h.height,

            // Description
            Text(
                  AppStrings.completeVerificationDesc,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.customText16(color: Colors.white, fontWeight: FontWeight.w400),
                )
                .paddingSymmetric(horizontal: 20.w)
                .animate()
                .fadeIn(duration: 400.ms, delay: 450.ms)
                .slideY(begin: 0.3, end: 0, duration: 600.ms, curve: Curves.easeOutCubic)
                .scaleXY(begin: 0.98, end: 1.0, curve: Curves.easeOutBack),

            75.h.height,

            // Create Wallet Button
            AppCustomButton(
                  title: "Create Wallet",
                  onPressed: () {
                    Get.toNamed(AppRoutes.recoveryPhaseView);
                  },
                )
                .paddingHorizontal(30.w)
                .animate()
                .fadeIn(duration: 400.ms, delay: 600.ms)
                .slideY(begin: 0.4, end: 0, duration: 700.ms, curve: Curves.easeOutBack)
                .scaleXY(begin: 0.97, end: 1.0, curve: Curves.easeInOut)
                .then(),
          ],
        ).paddingHorizontal(30.w),
      ),
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
              SvgPicture.asset(AppAssets.securityIcon, height: 22.h).paddingTop(7.h),

              10.w.width,

              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.nonCustodialTitle,
                      style: AppTextStyles.customText16(color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      AppStrings.nonCustodialText,
                      overflow: TextOverflow.visible,
                      maxLines: 2,
                      style: AppTextStyles.customText12(color: Colors.white.withValues(alpha: 0.5)),
                    ),
                    12.h.height,
                  ],
                ),
              ),
            ],
          ).paddingTop(15.sp).paddingHorizontal(15.w),
        ),
      ),
    );
  }
}
