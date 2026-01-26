import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safewallet/app/config/app_colors.dart';
import 'package:safewallet/app/config/app_text_style.dart';

class WordTile extends StatelessWidget {
  final String word;
  final Color? borderColor;
  final Color? color;
  final IconData? icon;
  final VoidCallback? onTap;

  const WordTile({
    super.key,
    required this.word,
    this.borderColor,
    this.color,
    this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color ?? AppColors.primarySoft,
          border: Border.all(
            color: borderColor ?? AppColors.primary.withValues(alpha: 0.3),
            width: 2.r,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) Icon(icon, size: 16.sp, color: Colors.white),
            SizedBox(width: 10.w),
            Text(
              word,
              style: AppTextStyles.customText10(
                color: AppColors.white.withValues(alpha: 0.5),
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
