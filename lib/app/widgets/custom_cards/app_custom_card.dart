import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safewallet/app/widgets/sizedbox_extension.dart';

import '../../config/app_colors.dart';
import '../../config/app_text_style.dart';
import '../custom_cache_image/custom_cached_image.dart';

class AppCustomCard extends StatelessWidget {
  final String language;
  final String imageUrl;
  final VoidCallback onPressed;
  final bool isSelected;

  const AppCustomCard({super.key, required this.language, required this.imageUrl, required this.onPressed, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12.r),
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffE5E5E5)),
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
          child: Row(
            children: [
              CustomCachedImage(imageUrl: imageUrl, height: 42.h, width: 42.w, borderRadius: 100),
              10.w.width,
              Expanded(
                child: Text(
                  language,
                  style: AppTextStyles.customText(fontSize: 16.sp, fontWeight: FontWeight.w500),
                ),
              ),

              // ✅ Custom Radio
              Container(
                width: 20.w,
                height: 20.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: isSelected ? AppColors.secondary : AppColors.lightGrey, width: 2),
                ),
                child: isSelected
                    ? Center(
                        child: Container(
                          width: 8.w,
                          height: 8.w,
                          decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.secondary),
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
