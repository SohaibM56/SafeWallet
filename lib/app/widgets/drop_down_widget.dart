import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safewallet/app/config/app_colors.dart';
import 'package:safewallet/app/config/app_text_style.dart';

class DropDownWidget<T> extends StatelessWidget {
  final T? selectedValue;
  final void Function(T?)? onChanged;
  final List<T> itemsList;
  final Color? borderColor;
  final TextStyle? textStyle;
  final Color? fillColor;
  final String title;
  final bool? isRequired;
  final List<DropdownMenuItem<T>>? items;
  final String Function(T)? itemAsString;

  const DropDownWidget({
    super.key,
    required this.selectedValue,
    required this.onChanged,
    required this.itemsList,
    this.textStyle,
    this.fillColor,
    this.borderColor,
    required this.title,
    this.items,
    this.isRequired = false,
    this.itemAsString,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Title + required indicator
          Row(
            children: [
              Text(
                title,
                style: AppTextStyles.customText16(
                  color: Color(0xff515151),
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (isRequired ?? false)
                Text(
                  ' *',
                  style: AppTextStyles.customText14(color: AppColors.primary),
                ),
            ],
          ),
          SizedBox(height: 5.h),

          /// Dropdown
          Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: SizedBox(
              height: 50.h,
              width: double.infinity,
              child: DropdownButtonHideUnderline(
                child: DropdownButton2<T>(
                  enableFeedback: false,
                  isExpanded: true,
                  value: selectedValue,
                  onChanged: onChanged,
                  items: itemsList.map((item) {
                    return DropdownMenuItem<T>(
                      value: item,
                      child: Text(
                        itemAsString != null
                            ? itemAsString!(item)
                            : item.toString(),
                        style:
                            textStyle ??
                            AppTextStyles.customText14(color: AppColors.black),
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  }).toList(),
                  buttonStyleData: ButtonStyleData(
                    height: 50,
                    width: 160,
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.sp),
                      color: fillColor ?? AppColors.transparent,
                      border: Border.all(
                        color: borderColor ?? const Color(0xffD9D9D9),
                        width: 1,
                      ),
                    ),
                  ),
                  iconStyleData: IconStyleData(
                    icon: Icon(Icons.keyboard_arrow_down_rounded, size: 25.sp),
                    iconSize: 25.sp,
                    iconEnabledColor: AppColors.black,
                    iconDisabledColor: Colors.black.withOpacity(0.15),
                  ),
                  dropdownStyleData: DropdownStyleData(
                    offset: const Offset(-15, 10),
                    direction: DropdownDirection.left,
                    maxHeight: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border.all(
                        color: AppColors.primary.withOpacity(0.1),
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 40,
                    padding: EdgeInsets.only(left: 14, right: 14),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
