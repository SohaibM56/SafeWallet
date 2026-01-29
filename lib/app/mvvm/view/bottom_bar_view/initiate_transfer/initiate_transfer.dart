import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:safewallet/app/config/app_assets.dart';
import 'package:safewallet/app/widgets/app_custom_field.dart';
import 'package:safewallet/app/widgets/custom_back_button.dart';
import 'package:safewallet/app/widgets/custom_sheets/review_transaction_sheet.dart';

import '../../../../config/app_colors.dart';
import '../../../../config/app_text_style.dart';
import '../../../../config/padding_extensions.dart';
import '../../../../config/utils.dart';
import '../../../../widgets/app_custom_button.dart';
import '../../../../widgets/sizedbox_extension.dart';

class InitiateTransfer extends StatelessWidget {
  const InitiateTransfer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      // appBar: CustomAppBar(
      //   backgroundColor: AppColors.transparent,
      //   shadowColor: AppColors.transparent,
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(alignment: Alignment.centerLeft, child: CustomBackButton()),
              Image.asset(
                    AppAssets.diagonalArrowIcon,
                    width: 60.w,
                    height: 60.h,
                  )
                  .animate()
                  .fadeIn(duration: 400.ms)
                  .scale(begin: const Offset(0.8, 0.8), duration: 400.ms),

              16.h.height,

              Text(
                "Send",
                style: AppTextStyles.customText24(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ).animate().fadeIn(duration: 400.ms, delay: 100.ms),

              4.h.height,

              Text(
                "Initiate Transfer",
                style: AppTextStyles.customText16(
                  color: Colors.white.withValues(alpha: 0.4),
                  fontWeight: FontWeight.w400,
                ),
              ).animate().fadeIn(duration: 400.ms, delay: 200.ms),

              10.h.height,

              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.white.withValues(alpha: 0.2.sp),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                ),
                child:
                    Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'From',
                                  style: AppTextStyles.customText(
                                    fontSize: 15.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),

                                Row(
                                  children: [
                                    Image.asset(
                                      AppAssets.walletIcon,
                                      width: 11.w,
                                      height: 11.h,
                                    ),
                                    5.w.width,
                                    Text(
                                      'Main Wallet',
                                      style: AppTextStyles.customText12(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            10.h.height,

                            Container(
                              padding: EdgeInsets.all(10.sp),
                              decoration: BoxDecoration(
                                color: AppColors.primarySoft,
                                border: Border.all(
                                  color: AppColors.primary.withValues(
                                    alpha: 0.5.sp,
                                  ),
                                  width: 2.w,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(13.r),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    AppAssets.etherIcon,
                                    width: 35.w,
                                    height: 35.h,
                                  ),
                                  10.w.width,
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Ethereum',
                                          style: AppTextStyles.customText12(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          'Balance: 2.4521 ETH',
                                          style: AppTextStyles.customText10(
                                            color: Colors.white.withValues(
                                              alpha: 0.5,
                                            ),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            12.h.height,

                            Text(
                              'Amount',
                              style: AppTextStyles.customText(
                                fontSize: 15.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            10.h.height,
                            AppCustomField(
                              hintText: "0.00",
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                    decimal: true,
                                  ),
                              textSize: 22.sp,
                              hintTextFontSize: 22.sp,
                              textColor: Colors.white,
                              hintColor: Colors.white,
                              fieldsTextAlign: TextAlign.left,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                                vertical: 18.h,
                              ),
                              isSecondField: true,
                              suffixIcon: Padding(
                                padding: EdgeInsets.only(right: 12.w),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "ETH",
                                      style: AppTextStyles.customText(
                                        color: Colors.white70,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    6.w.width,
                                    Text(
                                      "MAX",
                                      style: AppTextStyles.customText(
                                        color: AppColors.grey,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                        .paddingAll(14.sp)
                        .animate()
                        .fadeIn(duration: 500.ms, delay: 300.ms)
                        .slideY(begin: 0.1, end: 0),
              ),

              10.h.height,

              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.white.withValues(alpha: 0.2.sp),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                ),
                child:
                    Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'To',
                                  style: AppTextStyles.customText(
                                    fontSize: 15.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),

                                Row(
                                  children: [
                                    Image.asset(
                                      AppAssets.qrCodeIcon,
                                      width: 11.w,
                                      height: 11.h,
                                    ),
                                    5.w.width,
                                    Text(
                                      'Scan QR',
                                      style: AppTextStyles.customText12(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            14.h.height,

                            AppCustomField(
                              hintText: "0x..... or ENS name",
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                    decimal: true,
                                  ),
                              textSize: 12.sp,
                              hintTextFontSize: 12.sp,
                              textColor: Colors.white,
                              hintColor: Colors.white,
                              fieldsTextAlign: TextAlign.left,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                                vertical: 18.h,
                              ),
                              isSecondField: true,
                            ),
                          ],
                        )
                        .paddingAll(14.sp)
                        .animate()
                        .fadeIn(duration: 500.ms, delay: 500.ms)
                        .slideY(begin: 0.1, end: 0),
              ),

              10.h.height,

              Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 16.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primarySoft,
                      border: Border.all(
                        color: AppColors.primary.withValues(alpha: 0.5.sp),
                        width: 2.w,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(13.r)),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Network Free',
                                style: AppTextStyles.customText12(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              2.h.height,
                              Text(
                                'Estimated time:  ~30 seconds',
                                style: AppTextStyles.customText10(
                                  color: Colors.white.withValues(alpha: 0.5),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '~\$2.50',
                                style: AppTextStyles.customText12(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              2.h.height,
                              Text(
                                '0.0012 ETH',
                                style: AppTextStyles.customText10(
                                  color: Colors.white.withValues(alpha: 0.5),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                  .animate()
                  .fadeIn(duration: 400.ms, delay: 700.ms)
                  .slideY(begin: 0.1, end: 0),

              20.h.height,

              AppCustomButton(
                    title: "Review Transaction",
                    onPressed: () => Utils.showBottomSheet(
                      context: context,
                      child: ReviewTransactionSheet(),
                    ),
                  )
                  .paddingHorizontal(30.w)
                  .animate()
                  .fadeIn(duration: 400.ms, delay: 900.ms)
                  .slideY(begin: 0.2, end: 0),
            ],
          ).paddingSymmetric(horizontal: 20.w, vertical: 10.h),
        ),
      ),
    );
  }
}
