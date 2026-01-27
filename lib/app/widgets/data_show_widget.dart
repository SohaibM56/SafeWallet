import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safewallet/app/config/app_colors.dart';
import 'package:safewallet/app/config/app_text_style.dart';
import 'package:safewallet/app/widgets/sizedbox_extension.dart';

import '../config/app_assets.dart';

class CustomDataShow extends StatelessWidget {
  const CustomDataShow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          width: double.infinity,
          height: 80.h,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(AppAssets.glassRoundCard)),
          ),
          margin: EdgeInsets.only(top: 30.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: customStatus(
                  status: 'Status',
                  imagePath: AppAssets.shieldPrivate,
                  tittle: 'SECURE',
                ),
              ),

              _customDivider(),

              Expanded(
                child: customStatus(
                  status: 'Vetting',
                  imagePath: AppAssets.veitingIcon,
                  tittle: 'ACTIVE',
                ),
              ),

              _customDivider(),

              Expanded(
                child: customStatus(
                  status: 'Approval',
                  imagePath: AppAssets.approvalIcon,
                  tittle: '4-EYES',
                ),
              ),

              _customDivider(),

              Expanded(
                child: customStatus(
                  status: 'Region',
                  imagePath: AppAssets.regionIcon,
                  tittle: 'KSA',
                ),
              ),
            ],
          ),
        )
        .animate()
        .fadeIn(duration: 600.ms, delay: 200.ms)
        .slideY(begin: 0.3, curve: Curves.easeOutCubic)
        .animate()
        .fadeIn(duration: 600.ms, delay: 300.ms)
        .scale(begin: const Offset(0.7, 0.7), curve: Curves.easeOutBack);
  }

  Widget _customDivider({double? height, double? width}) {
    return Image.asset(
      AppAssets.gradientBorder,
      height: height ?? 40.h,
      width: width ?? 1.5.w,
    );
  }

  Widget customStatus({
    required String status,
    required String imagePath,
    required String tittle,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 17.h,
              width: 17.w,
              color: AppColors.lightTextColor,
            ),

            4.w.width,
            Text(
              status,
              style: AppTextStyles.customTextRboto(
                fontWeight: FontWeight.w500,
                color: AppColors.lightTextColor,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
        Text(
          tittle,
          style: AppTextStyles.customTextRboto(
            fontWeight: FontWeight.w600,
            color: AppColors.white,
            fontSize: 16.sp,
          ),
        ),
      ],
    );
  }
}
