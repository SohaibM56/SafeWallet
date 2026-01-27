import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/app_colors.dart';
import '../../config/app_text_style.dart';

class AppCustomCard extends StatelessWidget {
  final String language;
  final String imageUrl;
  final VoidCallback onPressed;
  final bool isSelected;

  const AppCustomCard({
    super.key,
    required this.language,
    required this.imageUrl,
    required this.onPressed,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12.r),
      onTap: onPressed,
      child: Container(
        height: 70.h,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primarySoft, width: 2.w),
          color: AppColors.primarySoft,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
          child: Row(
            children: [
              // CustomCachedImage(
              //   imageUrl: imageUrl,
              //   height: 42.h,
              //   width: 42.w,
              //   borderRadius: 100,
              // ),
              // 10.w.width,
              Expanded(
                child: Text(
                  language,
                  style: AppTextStyles.customText(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                ),
              ),

              // ✅ Custom Radio
              Container(
                width: 20.w,
                height: 20.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected ? AppColors.white : AppColors.grey,
                    width: 2,
                  ),
                ),
                child: isSelected
                    ? Center(
                        child: Container(
                          width: 8.w,
                          height: 8.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.white,
                          ),
                        ),
                      )
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
