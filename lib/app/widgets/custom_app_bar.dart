import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safewallet/app/config/padding_extensions.dart';
import 'package:safewallet/app/widgets/custom_back_button.dart';

import '../config/app_colors.dart';
import '../config/app_text_style.dart';

enum AppBarType {
  backWithLogo,
  homeWithActions,
  centeredTitle,
  leftTitle,
  custom,
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final String? subtitle;
  final AppBarType appBarType;
  final double? toolBarHeight;
  final Color? backButtonColor;
  final VoidCallback? onBackPressed;
  final bool centerTitle;
  final double elevation;
  final double? titleTextFont;
  final Color backgroundColor;
  final Color shadowColor;
  final Color titleColor;
  final Widget? trailing;
  final Widget? leading;
  final Widget? titleWidget;
  final double? leadingWidth;
  final double? borderRadius;
  final VoidCallback? onTrailingTap;
  final bool isWhite;
  final bool addPadding;
  final bool addBackButton;
  final bool addBottomPadding;
  final double? bottomPadding;
  final SystemUiOverlayStyle? statusBarStyle;

  final Widget? logoWidget;
  final String? walletName;
  final VoidCallback? onWalletTap;
  final VoidCallback? onSettingsTap;

  const CustomAppBar({
    super.key,
    this.title,
    this.subtitle,
    this.appBarType = AppBarType.centeredTitle,
    this.leadingWidth,
    this.onBackPressed,
    this.centerTitle = true,
    this.elevation = 0.0,
    this.backgroundColor = AppColors.transparent,
    this.shadowColor = Colors.black,
    this.titleColor = AppColors.white,
    this.trailing,
    this.leading,
    this.statusBarStyle,
    this.titleWidget,
    this.backButtonColor,
    this.toolBarHeight,
    this.borderRadius,
    this.titleTextFont,
    this.onTrailingTap,
    this.isWhite = false,
    this.addPadding = false,
    this.addBackButton = true,
    this.addBottomPadding = false,
    this.bottomPadding,
    this.logoWidget,
    this.walletName,
    this.onWalletTap,
    this.onSettingsTap,
  });

  double _calculateSubtitleHeight() {
    if (subtitle == null) return 0;

    final basePadding = 22.h;
    final screenWidth = ScreenUtil().screenWidth;
    final textWidth = screenWidth - 60.w;
    final charsPerLine = (textWidth / 7.5).floor();
    final estimatedLines = (subtitle!.length / charsPerLine).ceil().clamp(1, 5);
    final lineHeight = 13.sp * 1.5;

    return basePadding + (estimatedLines * lineHeight);
  }

  Widget? _buildLeading(BuildContext context) {
    if (leading != null) return leading;

    switch (appBarType) {
      case AppBarType.backWithLogo:
        return CustomBackButton(
          onTap: onBackPressed ?? () => Navigator.of(context).maybePop(),
        ).paddingLeft(15.w);

      case AppBarType.homeWithActions:
        return logoWidget != null
            ? Padding(
                padding: EdgeInsets.only(left: 16.w),
                child: logoWidget,
              )
            : null;

      case AppBarType.centeredTitle:
      case AppBarType.leftTitle:
        if (addBackButton) {
          return CustomBackButton(
            onTap: onBackPressed ?? () => Navigator.of(context).maybePop(),
          ).paddingLeft(15.w);
        }
        return null;

      case AppBarType.custom:
        if (addBackButton) {
          return CustomBackButton(
            onTap: onBackPressed ?? () => Navigator.of(context).maybePop(),
          ).paddingLeft(15.w);
        }
        return const SizedBox.shrink();
    }
  }

  Widget? _buildTitle() {
    if (titleWidget != null) return titleWidget;

    switch (appBarType) {
      case AppBarType.backWithLogo:
        return logoWidget;

      case AppBarType.homeWithActions:
        return null;

      case AppBarType.centeredTitle:
        return title != null && title!.isNotEmpty
            ? Text(
                title!,
                textAlign: TextAlign.center,
                style: AppTextStyles.customText(
                  fontSize: titleTextFont ?? 20.sp,
                  color: titleColor,
                  fontWeight: FontWeight.w600,
                ),
              )
            : null;

      case AppBarType.leftTitle:
        return title != null && title!.isNotEmpty
            ? Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title!,
                  style: AppTextStyles.customText(
                    fontSize: titleTextFont ?? 20.sp,
                    color: titleColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            : null;

      case AppBarType.custom:
        return title != null && title!.isNotEmpty
            ? Text(
                title!,
                textAlign: centerTitle ? TextAlign.center : TextAlign.start,
                style: AppTextStyles.customText(
                  fontSize: titleTextFont ?? 20.sp,
                  color: titleColor,
                  fontWeight: FontWeight.w600,
                ),
              )
            : null;
    }
  }

  List<Widget> _buildActions() {
    List<Widget> actions = [];

    switch (appBarType) {
      case AppBarType.backWithLogo:
        break;

      case AppBarType.homeWithActions:
        if (walletName != null) {
          actions.add(
            GestureDetector(
              onTap: onWalletTap,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      walletName!,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: AppColors.white,
                      size: 20.sp,
                    ),
                  ],
                ),
              ),
            ),
          );
          actions.add(SizedBox(width: 12.w));
        }

        actions.add(
          GestureDetector(
            onTap: onSettingsTap,
            child: Container(
              width: 44.sp,
              height: 44.sp,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(
                Icons.settings_outlined,
                color: AppColors.white,
                size: 22.sp,
              ),
            ),
          ),
        );
        actions.add(SizedBox(width: 16.w));
        break;

      case AppBarType.centeredTitle:
      case AppBarType.leftTitle:
      case AppBarType.custom:
        if (trailing != null) {
          actions.add(
            GestureDetector(
              onTap: onTrailingTap,
              child: Padding(
                padding: EdgeInsets.only(right: 16.w),
                child: trailing!,
              ),
            ),
          );
        }
        break;
    }

    return actions;
  }

  double _getLeadingWidth() {
    if (leadingWidth != null) return leadingWidth!;

    switch (appBarType) {
      case AppBarType.homeWithActions:
        return 150.w;
      case AppBarType.backWithLogo:
      case AppBarType.centeredTitle:
      case AppBarType.leftTitle:
        return 60.w;
      default:
        return addBackButton ? 60.w : 0;
    }
  }

  bool _shouldCenterTitle() {
    switch (appBarType) {
      case AppBarType.backWithLogo:
      case AppBarType.centeredTitle:
        return true;
      case AppBarType.leftTitle:
        return false;
      default:
        return centerTitle;
    }
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(borderRadius ?? 0),
        ),
      ),
      automaticallyImplyLeading: false,
      titleSpacing: _shouldCenterTitle() ? 0 : 10,
      toolbarHeight: toolBarHeight ?? kToolbarHeight,
      scrolledUnderElevation: 0.0,
      systemOverlayStyle:
          statusBarStyle ??
          SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: isWhite
                ? Brightness.light
                : Brightness.dark,
            statusBarBrightness: isWhite ? Brightness.light : Brightness.dark,
          ),
      backgroundColor: backgroundColor,
      surfaceTintColor: Colors.transparent,
      leadingWidth: _getLeadingWidth(),
      elevation: elevation,
      shadowColor: shadowColor.withValues(alpha: 0.3),
      centerTitle: _shouldCenterTitle(),
      leading: _buildLeading(context),
      title: _buildTitle(),
      actions: _buildActions(),
      bottom: subtitle != null
          ? PreferredSize(
              preferredSize: Size.fromHeight(_calculateSubtitleHeight()),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    left: 30.w,
                    right: 30.w,
                    top: 2.h,
                    bottom: 20.h,
                  ),
                  child: Text(
                    subtitle!,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.customText(
                      fontSize: 15.sp,
                      color: AppColors.white,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                  ),
                ),
              ),
            )
          : (addBottomPadding
                ? PreferredSize(
                    preferredSize: Size.fromHeight(bottomPadding ?? 10.h),
                    child: SizedBox(height: bottomPadding ?? 10.h),
                  )
                : null),
    );

    return addPadding
        ? Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: appBar,
          )
        : appBar;
  }

  @override
  Size get preferredSize => Size.fromHeight(
    (toolBarHeight ?? kToolbarHeight) +
        (subtitle != null
            ? _calculateSubtitleHeight()
            : (addBottomPadding ? (bottomPadding ?? 10.h) : 0)),
  );
}
