import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:riff_switch/riff_switch.dart';
import 'package:safewallet/app/config/app_assets.dart';
import 'package:safewallet/app/config/app_colors.dart';
import 'package:safewallet/app/config/app_text_style.dart';
import 'package:safewallet/app/config/padding_extensions.dart';
import 'package:safewallet/app/widgets/sizedbox_extension.dart';

class CustomMenuTile extends StatelessWidget {
  final String icon;
  final String title;
  final bool? isApproved;
  final bool? isToggle;
  final VoidCallback? onToggle;
  final VoidCallback? onTap;

  const CustomMenuTile({super.key, required this.icon, required this.title, this.isToggle, this.isApproved = false, this.onToggle, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            20.w.width,
            icon.endsWith(".svg") ? SvgPicture.asset(icon, width: 40.w, height: 40.w) : Image.asset(icon, width: 40.w, height: 40.w),
            12.w.width,
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.customText14(fontWeight: FontWeight.w400, color: AppColors.white),
              ),
            ),
            isToggle != null
                ? RiffSwitch(
                    value: isToggle!,
                    onChanged: (value) => onToggle?.call(),
                    type: RiffSwitchType.decorative,
                    height: 23,
                    width: 46,
                    thumbMargin: 2,
                    borderRadius: 40,
                    activeColor: AppColors.white,
                    activeTrackColor: AppColors.primary,
                    inactiveThumbColor: AppColors.primary,
                    inactiveTrackColor: AppColors.white,
                    borderColor: Colors.white.withValues(alpha: 0.4),
                  ).paddingRight(20.w)
                : isApproved == true
                ? SvgPicture.asset(AppAssets.kycLogo).paddingRight(20.w)
                : Icon(Icons.navigate_next_outlined, color: AppColors.white).paddingRight(title == "Logout" ? 30.w : 20.w),
          ],
        ).paddingVertical(8.sp),
      ),
    );
  }
}
