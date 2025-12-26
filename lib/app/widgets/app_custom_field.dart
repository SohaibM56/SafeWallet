import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safewallet/app/widgets/sizedbox_extension.dart';

import '../config/app_colors.dart';
import '../config/app_text_style.dart';

class AppCustomField extends StatelessWidget {
  const AppCustomField({
    super.key,
    this.hintText,
    this.controller,
    this.maxLines,
    this.minLines,
    this.fieldsTextAlign,
    this.fieldsInputType,
    this.hintFontWeight,
    this.hintColor,
    this.hintTextOverflow,
    this.isReadOnly,
    this.hintTextFontFamily,
    this.hintTextFontSize,
    this.contentPadding,
    this.focusedBorderColor,
    this.enabledBorderColor,
    this.errorBorderColor,
    this.disabledBorderColor,
    this.focusErrorBorderColor,
    this.obscureText = false,
    this.focusNode,
    this.onFieldSubmitted,
    this.textInputAction,
    this.initialValue,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixIconColor,
    this.suffixIconColor,
    this.onChanged,
    this.onPressed,
    this.labelText,
    this.labelColor,
    this.labelFontWeight,
    this.labelTextOverflow,
    this.labelTextFontFamily,
    this.labelTextFontSize,
    this.filled,
    this.fillColor,
    this.textColor,
    this.validationText,
    this.labelTitle,
    this.titleWidget,
    this.counterColor,
    this.isRequired = false,
    this.keyboardType,
    this.maxLength,
    this.enabled = true,
    this.onTap,
    this.labelTitleSize,
    this.cursorColor,
    this.textSize,
  });

  final Color? cursorColor;
  final int? maxLength;
  final String? validationText;
  final String? hintText;
  final TextEditingController? controller;
  final int? maxLines;
  final int? minLines;
  final TextAlign? fieldsTextAlign;
  final TextInputType? fieldsInputType;
  final bool? obscureText;
  final FontWeight? hintFontWeight;
  final Color? hintColor;
  final bool? isReadOnly;
  final TextOverflow? hintTextOverflow;
  final String? hintTextFontFamily;
  final double? hintTextFontSize;
  final String? labelText;
  final Color? labelColor;
  final FontWeight? labelFontWeight;
  final TextOverflow? labelTextOverflow;
  final TextInputType? keyboardType;
  final String? labelTextFontFamily;
  final double? labelTextFontSize;
  final double? textSize;
  final EdgeInsets? contentPadding;
  final Color? focusedBorderColor;
  final Color? enabledBorderColor;
  final Color? errorBorderColor;
  final Color? counterColor;
  final Color? disabledBorderColor;
  final Color? focusErrorBorderColor;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;
  final String? initialValue;
  final FormFieldValidator<String>? validator;
  final Widget? prefixIcon;
  final Widget? titleWidget;
  final Widget? suffixIcon;
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final Function(String)? onChanged;
  final VoidCallback? onPressed;
  final bool? filled;
  final Color? fillColor;
  final Color? textColor;
  final String? labelTitle;
  final bool isRequired;
  final bool enabled;
  final double? labelTitleSize;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (labelTitle != null)
          Row(
            children: [
              Text(
                labelTitle ?? '',
                style: AppTextStyles.customText(
                  fontSize: labelTitleSize ?? 16,
                  color: labelColor ?? AppColors.white.withValues(alpha: 0.5),
                  fontWeight: FontWeight.w400,
                ),
              ),
              if (isRequired) Text(' *', style: AppTextStyles.customText16(color: AppColors.primary)),
            ],
          ),
        if (titleWidget != null) titleWidget!,
        0.h.height,
        TextFormField(
          maxLength: maxLength,
          cursorColor: cursorColor ?? AppColors.secondary,
          enabled: enabled,
          autovalidateMode: AutovalidateMode.onUserInteraction,

          validator: (value) {
            if (validator != null) {
              return validator!(value);
            } else if (value == null || value.isEmpty) {
              return validationText ?? "This field cannot be empty";
            }
            return null;
          },
          style: AppTextStyles.customText(fontSize: textSize ?? 16, color: textColor ?? AppColors.white),

          initialValue: initialValue,
          textAlign: fieldsTextAlign ?? TextAlign.start,
          maxLines: maxLines ?? 1,
          controller: controller,
          minLines: minLines ?? 1,
          readOnly: isReadOnly ?? false,
          keyboardType: keyboardType,
          obscureText: obscureText ?? false,
          obscuringCharacter: "•",
          focusNode: focusNode,
          onFieldSubmitted: onFieldSubmitted,
          onChanged: onChanged,
          textInputAction: textInputAction ?? TextInputAction.next,
          onTap: onTap,
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },

          decoration: InputDecoration(
            counterStyle: AppTextStyles.customText12(color: counterColor ?? AppColors.black),

            hintText: hintText,
            hintStyle: AppTextStyles.customText(
              fontSize: hintTextFontSize ?? 14.sp,
              fontWeight: hintFontWeight ?? FontWeight.w400,
              color: hintColor ?? AppColors.white.withOpacity(0.9),
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            floatingLabelStyle: const TextStyle(color: Colors.grey),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            filled: filled ?? true,
            fillColor: fillColor ?? AppColors.transparent,
            border: UnderlineInputBorder(borderSide: BorderSide(color: enabledBorderColor ?? AppColors.textLightBlack.withOpacity(0.4))),
            prefixIconColor: prefixIconColor,
            suffixIconColor: suffixIconColor,
            contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 1.w),
            prefixIconConstraints: BoxConstraints(minWidth: 40.w, minHeight: 40.h),
            suffixIconConstraints: BoxConstraints(minWidth: 40.w, minHeight: 40.h),
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: focusedBorderColor ?? AppColors.secondary, width: 2.0)),
            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 2.0, color: enabledBorderColor ?? AppColors.textLightBlack.withOpacity(0.4))),
            focusedErrorBorder: UnderlineInputBorder(borderSide: BorderSide(color: focusErrorBorderColor ?? AppColors.negativeRed, width: 2.0)),
            disabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 2.0, color: disabledBorderColor ?? AppColors.textLightBlack.withOpacity(0.3))),
            errorMaxLines: 2,
            errorStyle: TextStyle(color: Colors.red, fontSize: 12.sp),
          ),
        ),
      ],
    );
  }
}
