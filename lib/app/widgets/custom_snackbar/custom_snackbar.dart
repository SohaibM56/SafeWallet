import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../config/app_colors.dart';
import '../../config/app_text_style.dart';

/// =======================
/// ALERT STATUS ENUM
/// =======================
enum AlertStatus { SUCCESS, WARNING, ERROR }

/// =======================
/// PREMIUM SNACKBAR (PUBLIC API
/// =======================
class PremiumSnackbar {
  static void success(List<String> messages, {String? title}) {
    _show(status: AlertStatus.SUCCESS, title: title, messages: messages);
  }

  static void warning(List<String> messages, {String? title}) {
    _show(status: AlertStatus.WARNING, title: title, messages: messages);
  }

  static void error(List<String> messages, {String? title}) {
    _show(status: AlertStatus.ERROR, title: title, messages: messages);
  }

  static void _show({
    required AlertStatus status,
    String? title,
    required List<String> messages,
  }) {
    final config = _statusConfig(status);

    CustomSnackbar.show(
      title: title ?? config.title,
      messageText: messages,
      backgroundColor: config.backgroundColor,
      iconData: config.icon,
      iconColor: config.iconColor,
      borderColor: config.borderColor,
      emoji: config.emoji,
    );
  }

  static _SnackbarConfig _statusConfig(AlertStatus status) {
    switch (status) {
      case AlertStatus.SUCCESS:
        return _SnackbarConfig(
          title: "Success",
          backgroundColor: AppColors.primary,
          borderColor: AppColors.primary.withOpacity(0.8),
          icon: Icons.check_circle_outline_rounded,
          iconColor: Colors.white,
          emoji: "🎉",
        );

      case AlertStatus.WARNING:
        return _SnackbarConfig(
          title: "Warning",
          backgroundColor: AppColors.warningAmber,
          borderColor: AppColors.warningAmber.withOpacity(0.8),
          icon: Icons.warning_amber_rounded,
          iconColor: Colors.black,
          emoji: "⚠️",
        );

      case AlertStatus.ERROR:
        return _SnackbarConfig(
          title: "Error",
          backgroundColor: const Color(0xffcc1200),
          borderColor: const Color(0xffcc1200).withOpacity(0.8),
          icon: Icons.error_outline_rounded,
          iconColor: Colors.white,
          emoji: "💥",
        );
    }
  }
}

/// =======================
/// INTERNAL CONFIG MODEL
/// =======================
class _SnackbarConfig {
  final String title;
  final Color backgroundColor;
  final Color borderColor;
  final IconData icon;
  final Color iconColor;
  final String emoji;

  _SnackbarConfig({
    required this.title,
    required this.backgroundColor,
    required this.borderColor,
    required this.icon,
    required this.iconColor,
    required this.emoji,
  });
}

/// =======================
/// NEW CUSTOM SNACKBAR UI (ANIMATED)
/// =======================
class CustomSnackbar {
  static void show({
    String? title,
    String? message,
    List<String>? messageText,
    Color? backgroundColor,
    IconData? iconData,
    Color? iconColor,
    Color? borderColor,
    Duration? displayDuration,
    Duration? animationDuration,
    SnackPosition? position,
    String? emoji,
  }) {
    final bg = backgroundColor ?? Colors.black;
    final txtColor = Colors.white;
    final duration = displayDuration ?? const Duration(seconds: 3);
    final anim = animationDuration ?? const Duration(milliseconds: 600);
    final snackPosition = position ?? SnackPosition.BOTTOM;

    Widget snackbarWidget = ZoomIn(
      duration: anim,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [bg, bg.withOpacity(0.85)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: borderColor ?? Colors.white24),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 10),
          ],
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              child: Row(
                children: [
                  if (iconData != null)
                    Pulse(
                      infinite: true,
                      child: Container(
                        padding: EdgeInsets.all(10.sp),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: iconColor?.withOpacity(0.15),
                        ),
                        child: Icon(iconData, color: iconColor, size: 26.sp),
                      ),
                    ),

                  SizedBox(width: 12.w),

                  /// TEXT AREA (NO OVERFLOW)
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Bounce(
                          child: Row(
                            children: [
                              Text(
                                title ?? "Notice",
                                style: AppTextStyles.customText16(
                                  color: txtColor,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                emoji ?? "",
                                style: TextStyle(fontSize: 24.sp),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 6.h),
                        SlideInLeft(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: messageText != null
                                ? messageText
                                      .map(
                                        (m) => Padding(
                                          padding: EdgeInsets.only(bottom: 4.h),
                                          child: Text(
                                            m,
                                            style: AppTextStyles.customText12(
                                              color: txtColor.withOpacity(0.9),
                                              height: 1.4,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList()
                                : [
                                    Center(
                                      child: Text(
                                        message ?? "",
                                        style: AppTextStyles.customText12(
                                          color: txtColor.withOpacity(0.9),
                                          height: 1.4,
                                        ),
                                      ),
                                    ),
                                  ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(width: 8.w),

                  // InkWell(
                  //   onTap: () => Get.back(),
                  //   child: Align(
                  //     alignment: Alignment.topRight,
                  //     child: Icon(Icons.close, color: txtColor, size: 20.sp),
                  //   ),
                  // ),
                  InkWell(
                    onTap: () => Get.back(),
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.w),
                      child: Icon(Icons.close, color: txtColor, size: 20.sp),
                    ),
                  ),
                ],
              ),
            ),

            /// PROGRESS BAR
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: TweenAnimationBuilder<double>(
                duration: duration,
                tween: Tween(begin: 0, end: 1),
                builder: (_, value, __) {
                  return LinearProgressIndicator(
                    value: value,
                    minHeight: 3,
                    backgroundColor: Colors.transparent,
                    valueColor: AlwaysStoppedAnimation(
                      Colors.white.withOpacity(0.7),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );

    Get.rawSnackbar(
      // "",
      // "",
      messageText: snackbarWidget,
      duration: duration,
      snackPosition: snackPosition,
      backgroundColor: Colors.transparent,
      overlayBlur: 0,
      overlayColor: Colors.transparent,
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      snackStyle: SnackStyle.FLOATING,
      borderRadius: 0,
      isDismissible: true,
    );
  }
}

/// =======================
/// EXTENSIONS
/// =======================
extension QuickSnackbarList on List<String> {
  void showSuccess({String? title}) =>
      PremiumSnackbar.success(this, title: title);
  void showWarning({String? title}) =>
      PremiumSnackbar.warning(this, title: title);
  void showError({String? title}) => PremiumSnackbar.error(this, title: title);
}

extension QuickSnackbarString on String {
  void showSuccess({String? title}) =>
      PremiumSnackbar.success([this], title: title);
  void showWarning({String? title}) =>
      PremiumSnackbar.warning([this], title: title);
  void showError({String? title}) =>
      PremiumSnackbar.error([this], title: title);
}
