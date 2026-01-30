import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/app_colors.dart';
import '../config/app_text_style.dart';

class AppCustomButton extends StatefulWidget {
  final String title;
  final VoidCallback onPressed;

  final Gradient? gradient;
  final double? borderRadius;
  final double? height;
  final double? width;
  final TextStyle? textStyle;

  /// OLD BUTTON FEATURES
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final bool isGradientEnabled;
  final Color? bgColor;
  final Color? borderColor;
  final GlobalKey? textKey;
  final EdgeInsetsGeometry? padding;
  final bool showShadow;

  const AppCustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.gradient,
    this.borderRadius,
    this.height,
    this.width,
    this.textStyle,
    this.padding,
    this.prefixIcon,
    this.suffixIcon,
    this.isGradientEnabled = false,
    this.bgColor = AppColors.primary,
    this.borderColor,
    this.textKey,
    this.showShadow = true,
  });

  @override
  State<AppCustomButton> createState() => _AppCustomButtonState();
}

class _AppCustomButtonState extends State<AppCustomButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _pressController;

  late Animation<double> _scaleAnimation;
  late Animation<double> _heightAnimation;
  late Animation<double> _widthAnimation;
  late Animation<double> _elevationAnimation;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _paddingAnimation;
  late Animation<double> _shadowBlurAnimation;
  late Animation<Offset> _shadowOffsetAnimation;
  late Animation<double> _innerShadowAnimation;

  bool _isPressed = false;

  @override
  void initState() {
    super.initState();

    _pressController = AnimationController(
      duration: const Duration(milliseconds: 80),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.96).animate(
      CurvedAnimation(parent: _pressController, curve: Curves.easeInOutCubic),
    );

    _heightAnimation = Tween<double>(begin: 1.0, end: 0.97).animate(
      CurvedAnimation(parent: _pressController, curve: Curves.easeOutQuart),
    );

    _widthAnimation = Tween<double>(begin: 1.0, end: 1.02).animate(
      CurvedAnimation(parent: _pressController, curve: Curves.easeOutBack),
    );

    _elevationAnimation = Tween<double>(begin: 6.0, end: 1.0).animate(
      CurvedAnimation(parent: _pressController, curve: Curves.easeInOutCubic),
    );

    _colorAnimation =
        ColorTween(
          begin: widget.bgColor ?? AppColors.primary,
          end: (widget.bgColor ?? AppColors.primary).withOpacity(0.85),
        ).animate(
          CurvedAnimation(
            parent: _pressController,
            curve: Curves.easeInOutCubic,
          ),
        );

    _paddingAnimation = Tween<double>(begin: 0.0, end: 4.0).animate(
      CurvedAnimation(parent: _pressController, curve: Curves.easeOutCubic),
    );

    _shadowBlurAnimation = Tween<double>(begin: 12.0, end: 4.0).animate(
      CurvedAnimation(parent: _pressController, curve: Curves.easeInOutCubic),
    );

    _shadowOffsetAnimation =
        Tween<Offset>(
          begin: const Offset(0, 6),
          end: const Offset(0, 2),
        ).animate(
          CurvedAnimation(
            parent: _pressController,
            curve: Curves.easeInOutCubic,
          ),
        );

    _innerShadowAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _pressController, curve: Curves.easeInOutCubic),
    );
  }

  @override
  void dispose() {
    _pressController.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    HapticFeedback.selectionClick();
    setState(() => _isPressed = true);
    _pressController.forward();
  }

  void _onTapUp(TapUpDetails details) {
    setState(() => _isPressed = false);
    _pressController.reverse();
    widget.onPressed();
  }

  void _onTapCancel() {
    setState(() => _isPressed = false);
    _pressController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final double h = widget.height ?? 56.h;
    final double w = widget.width ?? double.infinity;
    final double radius = widget.borderRadius ?? 30.r;

    return SizedBox(
      height: h,
      width: w,
      child: AnimatedBuilder(
        animation: _pressController,
        builder: (context, _) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Material(
              color: Colors.transparent,
              elevation: _elevationAnimation.value,
              shadowColor: AppColors.primary.withOpacity(0.25),
              borderRadius: BorderRadius.circular(radius),
              child: GestureDetector(
                onTapDown: _onTapDown,
                onTapUp: _onTapUp,
                onTapCancel: _onTapCancel,
                child: Container(
                  height: h * _heightAnimation.value,
                  width: w == double.infinity ? w : w * _widthAnimation.value,
                  padding:
                      widget.padding ??
                      EdgeInsets.symmetric(
                        horizontal: 16.w + _paddingAnimation.value,
                        vertical: 10.h,
                      ),
                  decoration: BoxDecoration(
                    color: widget.isGradientEnabled
                        ? null
                        : _colorAnimation.value,
                    gradient: widget.isGradientEnabled ? widget.gradient : null,
                    borderRadius: BorderRadius.circular(radius),
                    border: Border.all(
                      color: widget.borderColor ?? AppColors.transparent,
                      width: _isPressed ? 0.5 : 1,
                    ),
                    boxShadow: widget.showShadow
                        ? [
                            BoxShadow(
                              color: Colors.black.withOpacity(
                                0.15 * (1 - _innerShadowAnimation.value),
                              ),
                              blurRadius: _shadowBlurAnimation.value,
                              offset: _shadowOffsetAnimation.value,
                            ),
                          ]
                        : [],
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (widget.prefixIcon != null) widget.prefixIcon!,
                      if (widget.prefixIcon != null) SizedBox(width: 6.w),
                      Flexible(
                        child: Text(
                          widget.title,
                          key: widget.textKey,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                              widget.textStyle ??
                              AppTextStyles.customText16(
                                color: AppColors.white,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                      if (widget.suffixIcon != null) SizedBox(width: 6.w),
                      if (widget.suffixIcon != null) widget.suffixIcon!,
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
