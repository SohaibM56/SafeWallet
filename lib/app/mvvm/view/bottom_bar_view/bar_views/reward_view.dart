import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:safewallet/app/config/app_colors.dart';
import 'package:safewallet/app/config/app_text_style.dart';
import 'package:safewallet/app/config/padding_extensions.dart';
import 'package:safewallet/app/config/utils.dart';
import 'package:safewallet/app/mvvm/view_model/bottom_bar_controller/trade_controller.dart';
import 'package:safewallet/app/widgets/app_custom_button.dart';
import 'package:safewallet/app/widgets/custom_sheets/stake_more_sec_sheet.dart';
import 'package:safewallet/app/widgets/custom_sheets/unlock_rewards_sheet.dart';
import 'package:safewallet/app/widgets/sizedbox_extension.dart';

import '../../../../config/app_assets.dart';

class RewardView extends StatefulWidget {
  const RewardView({super.key});

  @override
  State<RewardView> createState() => _RewardViewState();
}

class _RewardViewState extends State<RewardView> {
  final TradeController controller = Get.find();
  int selectedPlatformIndex = 0;
  final List<String> platforms = ["Coin-Back Rewards", "Stalking"];

  final methods = [
    {"icon": AppAssets.lockedIcon, "title": "Locked", "count": "1,2345.65"},
    {"icon": AppAssets.walletIcon, "title": "Available", "count": "567.89"},
    {"icon": AppAssets.graphIcon, "title": "Stalked", "count": "2,500.00"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                    "Sec Records",
                    style: AppTextStyles.customText28(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 100.ms)
                  .slideY(begin: -0.2, curve: Curves.easeOut),

              10.h.height,
              Text(
                    "Earn and Grow Your SEC Token",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.customText(
                      fontSize: 15,
                      color: Colors.white.withValues(alpha: 0.7),
                      fontWeight: FontWeight.w400,
                    ),
                  )
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 200.ms)
                  .slideY(begin: -0.1, curve: Curves.easeOut),
              20.h.height,

              _buildRecordWidget()
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 200.ms)
                  .slideY(begin: 0.3, curve: Curves.easeOutCubic),

              10.h.height,

              _buildPlatformSelector()
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 200.ms)
                  .slideY(begin: 0.3, curve: Curves.easeOutCubic),

              10.h.height,

              if (selectedPlatformIndex == 0) ...[
                Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: AppColors.darkGrey),
                        borderRadius: BorderRadius.all(Radius.circular(10.r)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 10.w,
                        ),
                        child: Column(
                          children: [
                            5.h.height,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  AppAssets.ovalLockIcon,
                                  width: 45.w,
                                  height: 45.h,
                                ),
                                10.w.width,
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Locked Rewards",
                                        style: AppTextStyles.customText12(
                                          color: AppColors.white.withValues(
                                            alpha: 0.5,
                                          ),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ).animate().fadeIn(
                                        duration: 600.ms,
                                        delay: 400.ms,
                                      ),
                                      5.h.height,
                                      Text(
                                        "1,234.56 SEC",
                                        style: AppTextStyles.customText18(
                                          color: AppColors.white,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ).animate().fadeIn(
                                        duration: 600.ms,
                                        delay: 400.ms,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            10.h.height,

                            Text(
                              "Coin-Back rewards from your Trades. Unlock to move\nto your available balance",
                              style: AppTextStyles.customText12(
                                color: AppColors.white.withValues(alpha: 0.5),
                                fontWeight: FontWeight.w400,
                              ),
                            ).animate().fadeIn(duration: 600.ms, delay: 400.ms),

                            10.h.height,

                            AppCustomButton(
                              title: "Unlock Rewards",
                              onPressed: () {
                                Utils.showBottomSheet(
                                  context: context,
                                  child: UnlockRewardsSheet(),
                                );
                              },
                            ).paddingHorizontal(30.w),
                            5.h.height,
                          ],
                        ),
                      ),
                    )
                    .animate()
                    .fadeIn(duration: 600.ms, delay: 250.ms)
                    .slideY(begin: 0.3, curve: Curves.easeOutCubic),
                Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 10.h),
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.w,
                        vertical: 16.h,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: AppColors.darkGrey),
                        borderRadius: BorderRadius.all(Radius.circular(10.r)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "How to Coin-back Works ",
                                    style: AppTextStyles.customText18(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ).animate().fadeIn(
                                    duration: 600.ms,
                                    delay: 400.ms,
                                  ),

                                  10.h.height,

                                  Text(
                                    "1.   Get 25% of the fee back as SEC tokens!",
                                    style: AppTextStyles.customText12(
                                      color: Colors.white.withValues(
                                        alpha: 0.6,
                                      ),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ).animate().fadeIn(
                                    duration: 600.ms,
                                    delay: 500.ms,
                                  ),
                                  4.h.height,

                                  Text(
                                    "2.   1% transaction fee is applied to each swap",
                                    style: AppTextStyles.customText12(
                                      color: Colors.white.withValues(
                                        alpha: 0.6,
                                      ),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ).animate().fadeIn(
                                    duration: 600.ms,
                                    delay: 500.ms,
                                  ),
                                  4.h.height,

                                  Text(
                                    "3.   Trade meme coins on pump.fun, moonshot, or raydium",
                                    style: AppTextStyles.customText12(
                                      color: Colors.white.withValues(
                                        alpha: 0.6,
                                      ),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ).animate().fadeIn(
                                    duration: 600.ms,
                                    delay: 500.ms,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .animate()
                    .fadeIn(duration: 600.ms, delay: 300.ms)
                    .slideY(begin: 0.3, curve: Curves.easeOutCubic),
              ],
              if (selectedPlatformIndex == 1) ...[
                Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: AppColors.darkGrey),
                        borderRadius: BorderRadius.all(Radius.circular(10.r)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 10.w,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  5.h.height,
                                  Text(
                                    "Current APY",
                                    style: AppTextStyles.customText18(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ).animate().fadeIn(
                                    duration: 600.ms,
                                    delay: 400.ms,
                                  ),

                                  5.h.height,

                                  Text(
                                    "Stake your SEC tokens to earn passive rewards",
                                    style: AppTextStyles.customText12(
                                      color: AppColors.white.withValues(
                                        alpha: 0.5,
                                      ),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ).animate().fadeIn(
                                    duration: 600.ms,
                                    delay: 400.ms,
                                  ),

                                  5.h.height,
                                ],
                              ),
                            ),
                            Text(
                              "12.5 %",
                              style: AppTextStyles.customText18(
                                color: AppColors.green,
                                fontWeight: FontWeight.w800,
                              ),
                            ).animate().fadeIn(duration: 600.ms, delay: 400.ms),
                          ],
                        ),
                      ),
                    )
                    .animate()
                    .fadeIn(duration: 600.ms, delay: 250.ms)
                    .slideY(begin: 0.3, curve: Curves.easeOutCubic),

                20.h.height,

                Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: AppColors.darkGrey),
                        borderRadius: BorderRadius.all(Radius.circular(10.r)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 10.w,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            10.h.height,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Currently Staked",
                                      style: AppTextStyles.customText10(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ).animate().fadeIn(
                                      duration: 600.ms,
                                      delay: 400.ms,
                                    ),

                                    5.h.height,
                                    Text(
                                      "2,500.00 SEC",
                                      style: AppTextStyles.customText18(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ).animate().fadeIn(
                                      duration: 600.ms,
                                      delay: 400.ms,
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Projected Monthly",
                                      style: AppTextStyles.customText10(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ).animate().fadeIn(
                                      duration: 600.ms,
                                      delay: 400.ms,
                                    ),
                                    5.h.height,
                                    Text(
                                      "+26.04 SEC",
                                      style: AppTextStyles.customText18(
                                        color: AppColors.green,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ).animate().fadeIn(
                                      duration: 600.ms,
                                      delay: 400.ms,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            10.h.height,
                            LinearProgressIndicator(
                              value: 0.6,
                              minHeight: 7.0,
                              backgroundColor: AppColors.secondary.withValues(
                                alpha: 0.2,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                            ),
                            10.h.height,
                            Text(
                              "65% of available tokens staked",
                              textAlign: TextAlign.start,
                              style: AppTextStyles.customText10(
                                color: AppColors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ).animate().fadeIn(duration: 600.ms, delay: 400.ms),
                            10.h.height,
                          ],
                        ),
                      ),
                    )
                    .animate()
                    .fadeIn(duration: 600.ms, delay: 250.ms)
                    .slideY(begin: 0.3, curve: Curves.easeOutCubic),

                20.h.height,

                AppCustomButton(
                  title: "Stake More SEC",
                  prefixIcon: ImageIcon(
                    AssetImage(AppAssets.volumeIcon),
                    size: 25,
                    color: AppColors.white,
                  ),
                  onPressed: () {
                    Utils.showBottomSheet(
                      context: context,
                      child: StakeMoreSECSheet(),
                    );
                  },
                ).paddingHorizontal(30.w),
              ],

              10.h.height,
            ],
          ).paddingHorizontal(20.w),
        ),
      ),
    );
  }

  Widget _buildRecordWidget() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 10.h),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: AppColors.darkGrey),
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
        image: DecorationImage(
          image: AssetImage(AppAssets.backgroundCardImg),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          10.h.height,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(AppAssets.ovalRewardIcon, width: 45.w, height: 45.h),
              10.w.width,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total SEC Balance",
                      style: AppTextStyles.customText12(
                        color: AppColors.white.withValues(alpha: 0.5),
                        fontWeight: FontWeight.w400,
                      ),
                    ).animate().fadeIn(duration: 600.ms, delay: 400.ms),
                    5.h.height,
                    Text(
                      "4,302.45 SEC",
                      style: AppTextStyles.customText18(
                        color: AppColors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ).animate().fadeIn(duration: 600.ms, delay: 400.ms),
                  ],
                ),
              ),
            ],
          ),

          20.h.height,
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8.w,
              mainAxisSpacing: 8.h,
              mainAxisExtent: 85.h,
            ),
            itemCount: methods.length,
            itemBuilder: (context, index) {
              return _transactionMethods(
                methodImg: methods[index]["icon"]!,
                methtodTitle: methods[index]["title"]!,
                count: methods[index]["count"]!,
              );
            },
          ).animate().fadeIn(duration: 600.ms, delay: 300.ms),
          10.h.height,
        ],
      ).paddingAll(12.w),
    );
  }

  Widget _buildPlatformSelector() {
    return Container(
      height: 44.h,
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: const Color(0xFF0E1A24),
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(color: AppColors.white.withValues(alpha: 0.12)),
      ),
      child: Row(
        children: List.generate(platforms.length, (index) {
          final bool isSelected = selectedPlatformIndex == index;

          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedPlatformIndex = index;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeOut,
                decoration: BoxDecoration(
                  border: isSelected
                      ? Border.all(
                          color: AppColors.secondary.withValues(alpha: 0.3),
                        )
                      : null,
                  color: isSelected
                      ? AppColors.secondary.withValues(alpha: 0.1)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(25.r),
                ),
                child: Center(
                  child: Text(
                    platforms[index],
                    style: AppTextStyles.customText12(
                      color: isSelected
                          ? AppColors.white
                          : AppColors.white.withValues(alpha: 0.5),
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _transactionMethods({
    required String methodImg,
    required String methtodTitle,
    required String count,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary,
        border: Border.all(width: 1.w, color: AppColors.darkGrey),
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageIcon(
              AssetImage(methodImg),
              color: AppColors.white,
              size: 18.sp,
            ),
            Text(
              methtodTitle,
              style: AppTextStyles.customText12(
                color: AppColors.white.withValues(alpha: 0.5),
                fontWeight: FontWeight.w400,
              ),
            ).paddingVertical(5.h),
            Text(
              count,
              style: AppTextStyles.customText16(
                color: AppColors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget _buildStakeMoreSheet(){
  //   return
  // }
}
