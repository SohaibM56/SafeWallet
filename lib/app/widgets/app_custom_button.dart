import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safewallet/app/widgets/sizedbox_extension.dart';

import '../config/app_colors.dart';
import '../config/app_text_style.dart';

class AppCustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double? borderRadius;
  final double? height;
  final double? width;
  final TextStyle? textStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? bgColor;
  final Color? borderColor;
  final GlobalKey? textKey;

  const AppCustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.borderRadius,
    this.height,
    this.width,
    this.textStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.bgColor,
    this.borderColor,
    this.textKey,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 56.h,
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: () {
          HapticFeedback.mediumImpact();
          onPressed();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 30.r),
            side: BorderSide(color: borderColor ?? AppColors.transparent),
          ),
          elevation: 0,
          padding: EdgeInsets.zero,
        ),
        child: Ink(
          decoration: BoxDecoration(
            color: (bgColor ?? AppColors.secondary),
            borderRadius: BorderRadius.circular(borderRadius ?? 30.r),
          ),
          child: Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (prefixIcon != null) prefixIcon!,
                if (prefixIcon != null) 6.width,
                Text(
                  title,
                  key: textKey,
                  style:
                      textStyle ??
                      AppTextStyles.customText16(
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                if (suffixIcon != null) 6.width,
                if (suffixIcon != null) suffixIcon!,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
