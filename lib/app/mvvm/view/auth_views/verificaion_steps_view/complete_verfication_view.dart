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
  State<ComleteVerificationView> createState() =>
      _ComleteVerificationViewState();
}

class _ComleteVerificationViewState extends State<ComleteVerificationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: CustomAppBar(
        appBarType: AppBarType.centeredTitle,
        titleWidget: Image.asset(AppAssets.appHorizontalLogo, height: 44.h),
      ),
      body: SafeArea(
        child: Column(
          children: [
            80.h.height,

            Text(
                  AppStrings.completeVerificationTitle,
                  style: AppTextStyles.customText24(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                )
                .paddingSymmetric(horizontal: 30.w)
                .animate()
                .fadeIn(duration: 100.ms, delay: 500.ms)
                .slideY(
                  begin: 0.5,
                  end: 0,
                  duration: 800.ms,
                  curve: Curves.easeOutCubic,
                )
                .then(),
            10.h.height,

            Text(
                  AppStrings.completeVerificationDesc,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.customText14(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                )
                .paddingSymmetric(horizontal: 20.w)
                .animate()
                .fadeIn(duration: 150.ms, delay: 700.ms)
                .slideY(
                  begin: 0.5,
                  end: 0,
                  duration: 800.ms,
                  curve: Curves.easeOutCubic,
                )
                .then(),
            75.h.height,

            AppCustomButton(
                  title: "Create Wallet",

                  onPressed: () {
                    Get.toNamed(AppRoutes.recoveryPhaseView);
                  },
                )
                .animate()
                .fadeIn(duration: 150.ms, delay: 900.ms)
                .slideY(
                  begin: 0.5,
                  end: 0,
                  duration: 800.ms,
                  curve: Curves.easeOutCubic,
                ),

            // AppCustomButton(
            //       title: AppStrings.createWalletBtn,
            //       onPressed: () {
            //         Get.toNamed(AppRoutes.recoveryPhaseView);
            //       },
            //       height: 56.h,
            //     )
            //     .animate()
            //     .fadeIn(duration: 200.ms, delay: 200.ms)
            //     .slideY(
            //       begin: 1.0,
            //       end: 0,
            //       duration: 900.ms,
            //       curve: Curves.easeOutBack,
            //     )
            //     .then()
            //     .shimmer(
            //       delay: 2600.ms,
            //       duration: 1800.ms,
            //       color: Colors.white.withValues(alpha: 0.4),
            //     )
            //     .then()
            //     .scaleXY(
            //       delay: 3200.ms,
            //       duration: 800.ms,
            //       begin: 1,
            //       end: 1.03,
            //       curve: Curves.easeInOut,
            //     )
            //     .then()
            //     .scaleXY(
            //       duration: 800.ms,
            //       begin: 1.03,
            //       end: 1,
            //       curve: Curves.easeInOut,
            //     )
            //     .then()
            //     .shake(
            //       delay: 4500.ms,
            //       hz: 3,
            //       duration: 1000.ms,
            //       curve: Curves.elasticOut,
            //     ),
          ],
        ).paddingHorizontal(30.w),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color(0xff151F24),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.sp),
            topRight: Radius.circular(20.sp),
          ),
          border: Border.symmetric(
            horizontal: BorderSide(color: Colors.white.withValues(alpha: 0.17)),
          ),
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                AppAssets.securityIcon,
                height: 22.h,
              ).paddingTop(7.h),

              10.w.width,

              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.nonCustodialTitle,
                      style: AppTextStyles.customText16(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      AppStrings.nonCustodialText,
                      overflow: TextOverflow.visible,
                      maxLines: 2,
                      style: AppTextStyles.customText12(
                        color: Colors.white.withValues(alpha: 0.5),
                      ),
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
