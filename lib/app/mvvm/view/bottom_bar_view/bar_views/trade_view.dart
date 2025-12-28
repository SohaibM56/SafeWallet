import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:safewallet/app/config/app_colors.dart';
import 'package:safewallet/app/config/app_text_style.dart';
import 'package:safewallet/app/config/padding_extensions.dart';
import 'package:safewallet/app/mvvm/view_model/bottom_bar_controller/trade_controller.dart';
import 'package:safewallet/app/widgets/app_custom_button.dart';
import 'package:safewallet/app/widgets/sizedbox_extension.dart';

import '../../../../config/app_assets.dart';
import '../../../../config/utils.dart';
import '../../../../widgets/custom_sheets/crypto_wallet_sheet.dart';

class TradeView extends StatefulWidget {
  const TradeView({super.key});

  @override
  State<TradeView> createState() => _TradeViewState();
}

class _TradeViewState extends State<TradeView> {
  final TradeController controller = Get.find();
  int selectedPlatformIndex = 0;

  String fromCoin = "SOL";
  String toCoin = "BONK";
  final List<String> coins = ["SOL", "BONK", "MEME"];

  final List<String> platforms = ["Pump.fun", "Moonshot", "Raydium"];

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
                    "Trade Meme Coins",
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
                    "Swap Tokens from your favorite platforms",
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

              _buildPlatformSelector()
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 200.ms)
                  .slideY(begin: 0.3, curve: Curves.easeOutCubic),
              // 15.h.height,

              _buildTransactionWidget()
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 200.ms)
                  .slideY(begin: 0.3, curve: Curves.easeOutCubic),

              10.h.height,
              Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: AppColors.darkGrey),
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.w,
                        vertical: 20.w,
                      ),
                      child: Column(
                        children: [
                          10.h.height,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ImageIcon(
                                AssetImage(AppAssets.infoIcon),
                                size: 25,
                                color: AppColors.white,
                              ).animate().fadeIn(
                                duration: 600.ms,
                                delay: 300.ms,
                              ),

                              12.w.width,
                              Text(
                                "Fee Breakdown",
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.customText18(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                ),
                              ).animate().fadeIn(
                                duration: 600.ms,
                                delay: 400.ms,
                              ),
                            ],
                          ),
                          15.h.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Transaction Fee (1%)",
                                style: AppTextStyles.customText12(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "0 SOL",
                                style: AppTextStyles.customText16(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),

                          10.h.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "SEC Coin-back (25% of fee)",
                                style: AppTextStyles.customText12(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "+0 SEC",
                                style: AppTextStyles.customText16(
                                  color: AppColors.secondary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 250.ms)
                  .slideY(begin: 0.3, curve: Curves.easeOutCubic),
              // 15.h.height,
              Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 10.h),
                    height: 85.h,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: AppColors.darkGrey),
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          /// Icon
                          Container(
                            height: 50.w,
                            width: 50.w,
                            decoration: BoxDecoration(
                              color: AppColors.softgreen.withValues(alpha: 0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child:
                                  ImageIcon(
                                    AssetImage(AppAssets.handIcon),
                                    size: 25,
                                    color: AppColors.white,
                                  ).animate().fadeIn(
                                    duration: 600.ms,
                                    delay: 300.ms,
                                  ),
                            ),
                          ),

                          12.w.width,

                          /// ✅ Text Area (Expanded FIX)
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Earn SEC Token Rewards!",
                                  style: AppTextStyles.customText16(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ).animate().fadeIn(
                                  duration: 600.ms,
                                  delay: 400.ms,
                                ),

                                4.h.height,

                                Text(
                                  "Get 25% of every fee back as SEC tokens",
                                  style: AppTextStyles.customText10(
                                    color: Colors.white.withValues(alpha: 0.6),
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
              20.h.height,
              AppCustomButton(
                    title: "Swap Tokens",
                    onPressed: () {
                      Utils.showBottomSheet(
                        context: context,
                        child: CryptoWalletSheet(),
                      );
                    },
                  )
                  .paddingSymmetric(horizontal: 20.w)
                  .animate(delay: 1000.ms)
                  .fadeIn(duration: 600.ms)
                  .scale(
                    begin: const Offset(0.95, 0.95),
                    curve: Curves.easeOutBack,
                  ),
              12.h.height,
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Network: Solana Devante ( Test/Dev Environment)",
                  style: AppTextStyles.customText12(
                    color: Colors.white.withValues(alpha: 0.5),
                    fontWeight: FontWeight.w400,
                  ),
                ).animate().fadeIn(duration: 600.ms, delay: 500.ms),
              ),
              10.h.height,
            ],
          ).paddingHorizontal(20.w),
        ),
      ),
    );
  }

  Widget _buildTransactionWidget() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 10.h),
      height: 200.h,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: AppColors.darkGrey),
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
        image: DecorationImage(
          image: AssetImage(AppAssets.backgroundCardImg),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "From",

                  style: AppTextStyles.customText12(
                    color: AppColors.white.withValues(alpha: 0.5),
                    fontWeight: FontWeight.w400,
                  ),
                ).animate().fadeIn(duration: 600.ms, delay: 400.ms),
                Text(
                  "0.00",

                  style: AppTextStyles.customText22(
                    color: AppColors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ).animate().fadeIn(duration: 600.ms, delay: 400.ms),

                40.h.height,

                Text(
                  "From",

                  style: AppTextStyles.customText12(
                    color: AppColors.white.withValues(alpha: 0.5),
                    fontWeight: FontWeight.w400,
                  ),
                ).animate().fadeIn(duration: 600.ms, delay: 400.ms),
                Text(
                  "0.00",

                  style: AppTextStyles.customText22(
                    color: AppColors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ).animate().fadeIn(duration: 600.ms, delay: 400.ms),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: 50.w,
                  width: 50.w,
                  decoration: BoxDecoration(
                    color: AppColors.softgreen.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: ImageIcon(
                      AssetImage(AppAssets.arrowsIcon),
                      size: 25,
                      color: AppColors.white,
                    ).animate().fadeIn(duration: 600.ms, delay: 300.ms),
                  ),
                ),
              ),
            ],
          ),
          30.w.width,
          Column(
            children: [
              15.h.height,
              Text(
                "Balance: 12.5",
                style: AppTextStyles.customText12(
                  color: Colors.white.withValues(alpha: 0.5),
                  fontWeight: FontWeight.w300,
                ),
              ).animate().fadeIn(duration: 600.ms, delay: 400.ms),
              10.h.height,
              _buildCoinDropdown(
                value: fromCoin,
                items: coins,
                onChanged: (val) {
                  setState(() {
                    fromCoin = val;
                  });
                },
              ),
              8.h.height,
              Text(
                "Balance: 1,234.56",

                style: AppTextStyles.customText12(
                  color: Colors.white.withValues(alpha: 0.5),
                  fontWeight: FontWeight.w300,
                ),
              ).animate().fadeIn(duration: 600.ms, delay: 400.ms),
              10.h.height,
              _buildCoinDropdown(
                value: toCoin,
                items: coins,
                onChanged: (val) {
                  setState(() {
                    toCoin = val;
                  });
                },
              ),
            ],
          ),
        ],
      ).paddingAll(12.w),
    );
  }

  Widget _buildCoinDropdown({
    required String value,
    required List<String> items,
    required ValueChanged<String> onChanged,
  }) {
    return Container(
      height: 32.w,
      width: 115.w,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFF0E1A24),
        border: Border.all(color: AppColors.white.withValues(alpha: 0.15)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isDense: true,
          isExpanded: true,
          dropdownColor: const Color(0xFF0E1A24),
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
          onChanged: (val) {
            onChanged(val!);
          },
          items: items.map((coin) {
            return DropdownMenuItem<String>(
              value: coin,
              child: Row(
                children: [
                  Container(
                    height: 20.w,
                    width: 20.w,
                    decoration: const BoxDecoration(
                      color: Colors.deepPurple,
                      shape: BoxShape.circle,
                    ),
                  ),
                  7.w.width,
                  Expanded(
                    child: Text(
                      coin,
                      style: AppTextStyles.customText12(
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
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
}
