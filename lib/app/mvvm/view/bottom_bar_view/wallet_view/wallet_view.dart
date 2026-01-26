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

class WalletView extends StatelessWidget {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: CustomAppBar(title: '', backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(AppAssets.diagonalArrowIcon, width: 60.w, height: 60.h)
                .animate()
                .fadeIn(duration: 400.ms)
                .scale(begin: const Offset(0.8, 0.8), duration: 400.ms),

            6.h.height,

            Text(
              "Send",
              style: AppTextStyles.customText(
                fontSize: 23.sp,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ).animate().fadeIn(duration: 400.ms, delay: 100.ms),

            4.h.height,

            Text(
              "Transfer tokens to another wallet",
              style: AppTextStyles.customText(
                fontSize: 14.sp,
                color: Colors.white.withValues(alpha: 0.4),
                fontWeight: FontWeight.w400,
              ),
            ).animate().fadeIn(duration: 400.ms, delay: 200.ms),

            10.h.height,

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
                        5.h.height,
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
                                    color: Colors.white.withValues(alpha: 0.5),
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
                            color: AppColors.secondary,
                            borderRadius: BorderRadius.circular(6.r),
                            border: Border.all(
                              color: AppColors.white.withValues(alpha: 0.09),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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

                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 2.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.secondary,
                            borderRadius: BorderRadius.circular(6.r),
                            border: Border.all(
                              color: AppColors.white.withValues(alpha: 0.09),
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  cursorColor: AppColors.white,
                                  style: AppTextStyles.customText26(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: "0.00",
                                    hintStyle: AppTextStyles.customText26(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    filled: false,
                                    border: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                  ),
                                ),

                                // Text(
                                //   '0.00',
                                //   style: AppTextStyles.customText26(
                                //     color: Colors.white,
                                //     fontWeight: FontWeight.w500,
                                //   ),
                                // ),
                              ),

                              Row(
                                children: [
                                  Text(
                                    'ETH',
                                    style: AppTextStyles.customText12(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  2.w.width,
                                  Text(
                                    'MAX',
                                    style: AppTextStyles.customText(
                                      fontSize: 7.sp,
                                      color: Colors.white.withValues(
                                        alpha: 0.8,
                                      ),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        5.h.height,
                      ],
                    ).paddingAll(10.sp),
                  ],
                )
                .animate()
                .fadeIn(duration: 500.ms, delay: 300.ms)
                .slideY(begin: 0.1, end: 0),

            10.h.height,

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
                        5.h.height,
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
                                    color: Colors.white.withValues(alpha: 0.5),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        14.h.height,

                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 14.w,
                            vertical: 2.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.secondary,
                            borderRadius: BorderRadius.circular(6.r),
                            border: Border.all(
                              color: AppColors.white.withValues(alpha: 0.09),
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  cursorColor: AppColors.white,
                                  style: AppTextStyles.customText12(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: "0x..... or ENS name",
                                    hintStyle: AppTextStyles.customText12(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    filled: false,
                                    border: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                  ),
                                ),
                                // Text(
                                //   '0x..... or ENS name',
                                //   style: AppTextStyles.customText12(
                                //     color: Colors.white,
                                //     fontWeight: FontWeight.w500,
                                //   ),
                                // ),
                              ),
                            ],
                          ),
                        ),

                        5.h.height,
                      ],
                    ).paddingAll(10.sp),
                  ],
                )
                .animate()
                .fadeIn(duration: 500.ms, delay: 500.ms)
                .slideY(begin: 0.1, end: 0),

            10.h.height,

            Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 16.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius: BorderRadius.circular(6.r),
                    border: Border.all(
                      color: AppColors.white.withValues(alpha: 0.09),
                    ),
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

            20.h.height,

            GestureDetector(
              onTap: () {},
              child: Text(
                "Cancel",
                style: AppTextStyles.customText(
                  fontSize: 13.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ).animate().fadeIn(duration: 400.ms, delay: 1000.ms),
          ],
        ).paddingSymmetric(horizontal: 20.w, vertical: 10.h),
      ),
    );
  }
}
