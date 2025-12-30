import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:safewallet/app/config/app_text_style.dart';
import 'package:safewallet/app/config/padding_extensions.dart';
import 'package:safewallet/app/config/utils.dart';
import 'package:safewallet/app/widgets/app_custom_button.dart';
import 'package:safewallet/app/widgets/custom_sheets/transaction_sent_sheet.dart';
import 'package:safewallet/app/widgets/sizedbox_extension.dart';

import '../../config/app_assets.dart';
import '../../config/app_colors.dart';

class SecurityCheckSheet extends StatefulWidget {
  const SecurityCheckSheet({super.key});

  @override
  State<SecurityCheckSheet> createState() => _SecurityCheckSheetState();
}

class _SecurityCheckSheetState extends State<SecurityCheckSheet> {
  final isChecked = false.obs;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: AnimatedPadding(
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeOut,
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SafeArea(
          maintainBottomViewPadding: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        "Security Check",
                        style: AppTextStyles.customText18(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(Icons.close, color: AppColors.black, size: 22.sp),
                    ),
                  ],
                ).paddingRight(5.w),

                30.h.height,

                Container(
                  padding: EdgeInsets.all(14.sp),
                  decoration: BoxDecoration(
                    color: AppColors.faintBgColor,
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(AppAssets.tickIcon, width: 18.w, height: 18.h),
                      8.w.width,
                      Text(
                        "Low Risk",
                        style: AppTextStyles.customText(
                          fontSize: 16.sp,
                          color: AppColors.secondary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                10.h.height,

                Container(
                  decoration: BoxDecoration(
                    color: AppColors.black.withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: TextFormField(
                    style: AppTextStyles.customText(
                      fontSize: 14.sp,
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Recipient Address',
                      hintText: "ØxA3F9b72C4e18DØE5d92bCIC7f4A8",
                      labelStyle: AppTextStyles.customText(
                        fontSize: 12.sp,
                        color: AppColors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                      filled: false,
                      fillColor: AppColors.black.withValues(alpha: 0.05),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 14.w,
                        vertical: 14.h,
                      ),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ),

                20.h.height,

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.check, color: AppColors.black, size: 16.sp),
                    8.w.width,
                    Text(
                      "Address is not on any sanctions list",
                      style: AppTextStyles.customText(
                        fontSize: 12.sp,
                        color: AppColors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                14.h.height,

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.check, color: AppColors.black, size: 16.sp),
                    8.w.width,
                    Text(
                      "No suspicious activity detected",
                      style: AppTextStyles.customText(
                        fontSize: 12.sp,
                        color: AppColors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                14.h.height,

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.check, color: AppColors.black, size: 16.sp),
                    8.w.width,
                    Text(
                      "Transaction within normal parameters",
                      style: AppTextStyles.customText(
                        fontSize: 12.sp,
                        color: AppColors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                14.h.height,

                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 16.h),
                  decoration: BoxDecoration(
                    color: AppColors.faintBgColor,
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 24.w,
                        height: 24.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                          border: Border.all(
                            color: Colors.grey[400]!,
                            width: 1.w,
                          ),
                          color: AppColors.faintBgColor,
                        ),
                        child: Theme(
                          data: ThemeData(
                            checkboxTheme: CheckboxThemeData(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.r),
                              ),
                              side: BorderSide.none,
                            ),
                          ),
                          child: Obx(() => Checkbox(
                            value: isChecked.value,
                            onChanged: (value) {
                              isChecked.value =  !isChecked.value;
                            },
                            activeColor: Colors.transparent,
                            checkColor: Colors.black,
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            visualDensity: VisualDensity.compact,
                          )),
                        ),
                      ),
                      10.w.width,
                      Expanded(
                        child: Text(
                          "I confirm that I have verified the recipient address and understand this transaction is irreversible.",
                          style: AppTextStyles.customText(
                            fontSize: 11.sp,
                            color: AppColors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                20.h.height,

                AppCustomButton(
                  title: "Confirm & Continue",
                  onPressed: () {
                    Get.back();
                    Utils.showBottomSheet(context: context, child: TransactionSentSheet());
                  },
                ).paddingHorizontal(30.w),

                10.h.height,
              ],
            ).paddingAll(20.sp),
          ),
        ),
      ),
    );
  }
}
