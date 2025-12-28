import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:safewallet/app/config/app_assets.dart';
import 'package:safewallet/app/widgets/custom_sheets/review_transaction_sheet.dart';

import '../../../../config/app_colors.dart';
import '../../../../config/app_text_style.dart';
import '../../../../config/padding_extensions.dart';
import '../../../../config/utils.dart';
import '../../../../widgets/app_custom_button.dart';
import '../../../../widgets/custom_app_bar.dart';
import '../../../../widgets/sizedbox_extension.dart';

class BuyAssetView extends StatelessWidget {
  const BuyAssetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: CustomAppBar(title: '', backgroundColor: Colors.transparent),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Buy Digital Assets",
            style: AppTextStyles.customText(
              fontSize: 22.sp,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ).animate().fadeIn(duration: 400.ms, delay: 100.ms),

          4.h.height,

          Text(
            "Fiat On-Ramp",
            style: AppTextStyles.customText(
              fontSize: 14.sp,
              color: Colors.white.withValues(alpha: 0.4),
              fontWeight: FontWeight.w400,
            ),
          ).animate().fadeIn(duration: 400.ms, delay: 200.ms),

          16.h.height,

          Stack(
                children: [
                  Positioned.fill(
                    child: SvgPicture.asset(
                      AppAssets.completeGradient,
                      fit: BoxFit.fill,
                    ),
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Pay with SAR',
                            style: AppTextStyles.customText(
                              fontSize: 13.sp,
                              color: Colors.white.withValues(alpha: 0.8),
                              fontWeight: FontWeight.w400,
                            ),
                          ),

                          Text(
                            'Balance: 50,000 SAR',
                            style: AppTextStyles.customText(
                              fontSize: 13.sp,
                              color: Colors.white.withValues(alpha: 0.8),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),

                      5.h.height,

                      Text(
                        '0.00',
                        style: AppTextStyles.customText(
                          fontSize: 22.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      10.h.height,

                      Align(
                        alignment: Alignment.center,
                        child: SvgPicture.asset(AppAssets.smallTransferIcon),
                      ),

                      20.h.height,

                      Row(
                        children: [
                          Text(
                            'Receive Digital Asset',
                            style: AppTextStyles.customText(
                              fontSize: 13.sp,
                              color: Colors.white.withValues(alpha: 0.8),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),

                      5.h.height,

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '0',
                            style: AppTextStyles.customText(
                              fontSize: 22.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 6.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withValues(alpha: 0.5),
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(
                                color: AppColors.white.withValues(alpha: 0.2),
                              ),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  AppAssets.bitcoinIcon,
                                  width: 19.w,
                                  height: 19.w,
                                ),
                                5.w.width,
                                Text(
                                  'BTC',
                                  style: AppTextStyles.customText(
                                    fontSize: 13.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                10.w.width,
                                Image.asset(
                                  AppAssets.downArrow,
                                  width: 9.w,
                                  height: 4.h,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ).paddingAll(14.sp),
                ],
              )
              .animate()
              .fadeIn(duration: 500.ms, delay: 300.ms)
              .slideY(begin: 0.1, end: 0),

          14.h.height,

          Stack(
                children: [
                  Positioned.fill(
                    child: SvgPicture.asset(
                      AppAssets.transparentFill,
                      fit: BoxFit.fill,
                    ),
                  ),

                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        10.h.height,

                        Text(
                          'Linked Bank Account',
                          style: AppTextStyles.customText(
                            fontSize: 14.sp,
                            color: Colors.white.withValues(alpha: 0.5),
                            fontWeight: FontWeight.w400,
                          ),
                        ),

                        2.h.height,

                        Text(
                          'tb1qxy2kgdygjrsqt...f4g8',
                          style: AppTextStyles.customText(
                            fontSize: 21.sp,
                            color: AppColors.green,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        14.h.height,

                        Text(
                          'Exchange Rate',
                          style: AppTextStyles.customText(
                            fontSize: 14.sp,
                            color: Colors.white.withValues(alpha: 0.5),
                            fontWeight: FontWeight.w400,
                          ),
                        ),

                        2.h.height,

                        Text(
                          '1BTC = 150,000 SAR',
                          style: AppTextStyles.customText(
                            fontSize: 21.sp,
                            color: AppColors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        5.h.height,
                      ],
                    ).paddingAll(10.sp),
                  ),
                ],
              )
              .animate()
              .fadeIn(duration: 500.ms, delay: 500.ms)
              .slideY(begin: 0.1, end: 0),

          60.h.height,

          AppCustomButton(
                title: "Buy BTC",
                onPressed: () => Utils.showBottomSheet(
                  context: context,
                  child: ReviewTransactionSheet(),
                ),
              )
              .paddingHorizontal(30.w)
              .animate()
              .fadeIn(duration: 400.ms, delay: 900.ms)
              .slideY(begin: 0.2, end: 0),

          Spacer(),

          Text(
            textAlign: TextAlign.center,
            "By proceeding, you agree to our terms and acknowledge SAMA compliance requirements.",
            style: AppTextStyles.customText(
              fontSize: 10.sp,
              color: Colors.white.withValues(alpha: 0.5),
              fontWeight: FontWeight.w400,
            ),
          ).animate().fadeIn(duration: 400.ms, delay: 1000.ms),
          10.h.height,
        ],
      ).paddingSymmetric(horizontal: 20.w, vertical: 10.h),
    );
  }
}
