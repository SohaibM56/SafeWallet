
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

  const CustomMenuTile({
    super.key,
    required this.icon,
    required this.title,
    this.isToggle,
    this.isApproved = false,
    this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        20.w.width,
        icon.endsWith(".svg")? SvgPicture.asset(icon, width: 40.w, height: 40.w): Image.asset(icon, width: 40.w, height: 40.w),
        20.w.width,
        Expanded(
          child: Text(
            title,
            style: AppTextStyles.customText14(
              fontWeight: FontWeight.w400,
              color: AppColors.white,
            ),
          ),
        ),
        isToggle!=null
            ? Transform.scale(
                scale: 0.6,
                child: Switch.adaptive(
                  value: isToggle!,
                  onChanged:(value) => onToggle?.call(),
                  activeThumbColor: Colors.white,
                  thumbColor: WidgetStateProperty.all(Colors.green),
                  activeTrackColor: Colors.green,
                  inactiveThumbColor: Colors.green,
                  inactiveTrackColor: Colors.grey[300],
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  trackOutlineColor: WidgetStateProperty.all(
                    Colors.transparent,
                  ),
                ),
              ).paddingRight(10.w)
            : isApproved == true
            ? SvgPicture.asset(AppAssets.kycLogo).paddingRight(20.w)
            : Icon(
                Icons.navigate_next_outlined,
                color: AppColors.white,
              ).paddingRight(title == "Logout" ? 30.w : 20.w),
      ],
    ).paddingVertical(10.sp);
  }
}
