import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safewallet/app/config/app_colors.dart';
import 'package:safewallet/app/config/app_text_style.dart';

class WordTile extends StatelessWidget {
  final String word;
  final Color? borderColor;
  final IconData? icon;
  final VoidCallback? onTap;

  const WordTile({
    super.key,
    required this.word,
    this.borderColor,
    this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary,
        border: Border.all(
          color: borderColor ?? AppColors.white.withValues(alpha: 0.4),
          width: 1.w,
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) Icon(icon, size: 16.sp, color: Colors.white),
            SizedBox(width: 10.w),
            Text(word, style: AppTextStyles.customText10(
                color: Colors.white.withValues(alpha: 0.7),
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}