import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:safewallet/app/config/app_colors.dart';
import 'package:safewallet/app/config/app_routes.dart';
import 'package:safewallet/app/config/app_text_style.dart';
import 'package:safewallet/app/config/padding_extensions.dart';
import 'package:safewallet/app/config/utils.dart';
import 'package:safewallet/app/widgets/common_app_bar.dart';
import 'package:safewallet/app/widgets/sizedbox_extension.dart';

import '../../../../config/app_assets.dart';
import '../../../view_model/profile_controllers/profile_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ProfileController controller = Get.put(ProfileController());
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            15.h.height,
            CommonAppBar(),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    _homeCurrencyWidget(),
                    16.h.height,
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isTapped = true;
                              });
                              Get.toNamed(AppRoutes.initiateTransfer);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14.sp),
                                color: isTapped == true ? AppColors.primary : AppColors.black,
                                border: Border.all(color: AppColors.white.withOpacity(0.08)),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(AppAssets.chatIc, height: 16.w),
                                    5.w.width,
                                    Text(
                                      "Initiate Transfer",
                                      style: AppTextStyles.customText12(color: AppColors.white, fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ).paddingAll(23.sp),
                            ),
                          ),
                        ),
                        10.w.width,
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13.sp),
                              color: AppColors.black,
                              border: Border.all(color: AppColors.white.withOpacity(0.08)),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(AppAssets.cardIc, height: 16.w),
                                  5.w.width,
                                  Text(
                                    "Obsidian Card",
                                    style: AppTextStyles.customText12(color: AppColors.white, fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ).paddingAll(23.sp),
                          ),
                        ),
                      ],
                    ).animate().fadeIn(duration: 600.ms, delay: 150.ms).slideY(begin: -0.2, curve: Curves.easeOut),
                    10.h.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Recent Activity",
                          style: AppTextStyles.customText22(color: AppColors.white, fontWeight: FontWeight.w500),
                        ).animate().fadeIn(duration: 600.ms, delay: 400.ms),
                        TextButton(
                          onPressed: () {
                            Get.toNamed(AppRoutes.allActivityView);
                          },
                          child: Text(
                            "View All",
                            style: AppTextStyles.customText16(color: AppColors.white.withOpacity(0.6), fontWeight: FontWeight.w400),
                          ),
                        ).animate().fadeIn(duration: 600.ms, delay: 400.ms),
                      ],
                    ),
                    _homeCardWidget(cardTitle: "Incoming Transfer", cardSubtitle: "tb1qxy2k...Owlh", isIncomming: true),
                    _homeCardWidget(cardTitle: "Outgoing Transfer", cardSubtitle: "tb1qxy2k...Owlh", isIncomming: false),
                    _homeCardWidget(cardTitle: "Incoming Transfer", cardSubtitle: "tb1qxy2k...Owlh", isIncomming: true),
                    _homeCardWidget(cardTitle: "Outgoing Transfer", cardSubtitle: "tb1qxy2k...Owlh", isIncomming: false),
                  ],
                ),
              ),
            ),
            20.h.height,
          ],
        ).paddingHorizontal(20.w),
      ),
    );
  }

  // Widget _transactionMethods({
  //   required String methodImg,
  //   required String methtodTitle,
  //   required VoidCallback onTap,
  // }) {
  //   return GestureDetector(
  //     onTap: onTap,
  //     child: Container(
  //       height: 110.h,
  //       width: 110,
  //       decoration: BoxDecoration(
  //         border: Border.all(width: 1, color: AppColors.darkGrey),
  //         borderRadius: BorderRadius.all(Radius.circular(10.r)),
  //       ),
  //       child: Center(
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             ImageIcon(
  //               AssetImage(methodImg),
  //               color: AppColors.white,
  //               size: 30,
  //             ),
  //             Text(
  //               methtodTitle,
  //               style: AppTextStyles.customText16(
  //                 color: AppColors.white,
  //                 fontWeight: FontWeight.w400,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _homeCurrencyWidget() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primarySoft,
        border: Border.all(color: Colors.white.withOpacity(0.08)),
        borderRadius: BorderRadius.all(Radius.circular(14.sp)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// Icon
                  Container(
                    decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.white.withValues(alpha: 0.2)),
                    child: Center(child: Image.asset(AppAssets.walletIc, height: 20.w).paddingAll(10)),
                  ).animate().fadeIn(duration: 600.ms, delay: 400.ms),

                  12.w.width,

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Wallet",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.customText20(color: Colors.white, fontWeight: FontWeight.w400),
                      ).animate().fadeIn(duration: 600.ms, delay: 400.ms),

                      4.h.height,

                      Text(
                        "Sovereign Rails",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.customText10(color: AppColors.white.withValues(alpha: 0.6), fontWeight: FontWeight.w400),
                      ).animate().fadeIn(duration: 600.ms, delay: 500.ms),
                    ],
                  ),
                ],
              ),
              12.h.height,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "0.3459",
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.customText28(color: Colors.white, fontWeight: FontWeight.w700),
                  ).animate().fadeIn(duration: 600.ms, delay: 400.ms),
                  7.w.width,
                  Text(
                    "SAR",
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.customText18(color: Colors.white.withValues(alpha: 0.5), fontWeight: FontWeight.w300),
                  ).animate().fadeIn(duration: 600.ms, delay: 400.ms),
                ],
              ),
              8.h.height,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "\$745.80",
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.customText12(color: Colors.white, fontWeight: FontWeight.w400),
                  ).animate().fadeIn(duration: 600.ms, delay: 400.ms),
                  8.w.width,
                  ImageIcon(AssetImage(AppAssets.volumeUpIcon), color: AppColors.green),
                  2.w.width,
                  Text(
                    "\$745.80",
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.customText12(color: AppColors.green, fontWeight: FontWeight.w400),
                  ).animate().fadeIn(duration: 600.ms, delay: 400.ms),
                ],
              ),
            ],
          ),

          Image.asset(AppAssets.gradientBorder, height: 120.h, width: 2.5.w),
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// Icon
                  Container(
                    decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.white.withValues(alpha: 0.2)),
                    child: Center(child: Image.asset(AppAssets.bitcoinIc, height: 20.w).paddingAll(10)),
                  ).animate().fadeIn(duration: 600.ms, delay: 400.ms),

                  12.w.width,

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bitcoin",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.customText20(color: Colors.white, fontWeight: FontWeight.w400),
                      ).animate().fadeIn(duration: 600.ms, delay: 400.ms),

                      4.h.height,

                      Text(
                        "Sovereign Assets",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.customText10(color: AppColors.white.withValues(alpha: 0.6), fontWeight: FontWeight.w400),
                      ).animate().fadeIn(duration: 600.ms, delay: 500.ms),
                    ],
                  ),
                ],
              ),
              12.h.height,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "0.0236",
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.customText28(color: Colors.white, fontWeight: FontWeight.w700),
                  ).animate().fadeIn(duration: 600.ms, delay: 400.ms),
                  7.w.width,
                  Text(
                    "BTC",
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.customText18(color: Colors.white.withValues(alpha: 0.5), fontWeight: FontWeight.w300),
                  ).animate().fadeIn(duration: 600.ms, delay: 400.ms),
                ],
              ),
              8.h.height,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "\$745.80",
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.customText12(color: Colors.white, fontWeight: FontWeight.w400),
                  ).animate().fadeIn(duration: 600.ms, delay: 400.ms),
                  8.w.width,
                  ImageIcon(AssetImage(AppAssets.volumeDownIcon), color: AppColors.red),
                  2.w.width,
                  Text(
                    "\$463.80",
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.customText12(color: AppColors.red, fontWeight: FontWeight.w400),
                  ).animate().fadeIn(duration: 600.ms, delay: 400.ms),
                ],
              ),
            ],
          ),
        ],
      ).paddingSymmetric(horizontal: 15.w, vertical: 20.w).animate().fadeIn(duration: 600.ms, delay: 200.ms).slideY(begin: 0.3, curve: Curves.easeOutCubic),
    ).animate().fadeIn(duration: 600.ms, delay: 200.ms).slideY(begin: 0.3, curve: Curves.easeOutCubic);
  }

  Widget _homeCardWidget({required String cardTitle, required String cardSubtitle, required bool isIncomming}) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10.h),
      height: 85.h,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: AppColors.white.withOpacity(0.2)),
        borderRadius: BorderRadius.all(Radius.circular(14.sp)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Icon
            Container(
              height: 50.w,
              width: 50.w,
              decoration: BoxDecoration(
                color: isIncomming == true ? AppColors.primary.withValues(alpha: 0.5) : AppColors.red.withValues(alpha: 0.2),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: isIncomming == true
                    ? Icon(Icons.add, size: 35, color: AppColors.green)
                    : ImageIcon(AssetImage(AppAssets.redArrow), size: 35, color: AppColors.red),
              ),
            ),

            5.w.width,

            /// ✅ Text Area (Expanded FIX)
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cardTitle,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.customText18(color: Colors.white, fontWeight: FontWeight.w500),
                  ).animate().fadeIn(duration: 600.ms, delay: 400.ms),

                  4.h.height,

                  Text(
                    cardSubtitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.customText12(color: Colors.white.withValues(alpha: 0.6)),
                  ).animate().fadeIn(duration: 600.ms, delay: 500.ms),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${isIncomming == true ? '+' : '-'}75.8 BTC",
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.customText16(color: isIncomming == true ? AppColors.softgreen : AppColors.red, fontWeight: FontWeight.w600),
                ),
                Text(
                  "\$34.74",
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.customText16(color: AppColors.darkGrey, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 600.ms, delay: 150.ms).slideY(begin: -0.2, curve: Curves.easeOut);
  }
}
