import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:safewallet/app/config/app_colors.dart';
import 'package:safewallet/app/config/app_text_style.dart';
import 'package:safewallet/app/config/padding_extensions.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                            "Welcome Back",
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
                      5.h.height,

                      Text(
                            "SEC Wallet",
                            style: AppTextStyles.customText28(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                          .animate()
                          .fadeIn(duration: 600.ms, delay: 100.ms)
                          .slideY(begin: -0.2, curve: Curves.easeOut),
                    ],
                  ),
                  Container(
                    height: 44.w,
                    width: 89.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(55.r)),
                      color: AppColors.secondary.withValues(alpha: 0.3),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(
                          AssetImage(AppAssets.kycIcon),
                          color: AppColors.secondary,
                        ),
                        6.w.width,
                        Text(
                          "KYC",
                          style: AppTextStyles.customText18(
                            color: AppColors.secondary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              10.h.height,
              _homeCurrencyWidget()
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 200.ms)
                  .slideY(begin: 0.3, curve: Curves.easeOutCubic),

              15.h.height,
              Row(
                children: [
                  _transactionMethods(
                    methodImg: AppAssets.sendIcon,
                    methtodTitle: "Send",
                  ),
                  8.w.width,
                  _transactionMethods(
                    methodImg: AppAssets.receiveIcon,
                    methtodTitle: "Receive",
                  ),
                  8.w.width,
                  _transactionMethods(
                    methodImg: AppAssets.historyIcon,
                    methtodTitle: "History",
                  ),
                ],
              ),
              15.h.height,
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 20.h),
                height: 85.h,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: AppColors.darkGrey),
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
                          child: ImageIcon(
                            AssetImage(AppAssets.sendIcon),
                            size: 25,
                            color: AppColors.white,
                          ).animate().fadeIn(duration: 600.ms, delay: 300.ms),
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
                              "SEC Token Rewards",
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.customText14(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ).animate().fadeIn(duration: 600.ms, delay: 400.ms),

                            4.h.height,

                            Text(
                              "1,234.56 SEC earned",
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.customText10(
                                color: Colors.white.withValues(alpha: 0.6),
                              ),
                            ).animate().fadeIn(duration: 600.ms, delay: 500.ms),
                          ],
                        ),
                      ),
                      ImageIcon(
                        AssetImage(AppAssets.volumeIcon),
                        color: AppColors.secondary,
                      ),
                      2.w.width,
                      Text(
                        "\$745.80",
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.customText16(
                          color: AppColors.secondary,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              _homeCardWidget(
                cardIcon: Icons.arrow_downward,
                cardTitle: "Received",
                cardSubtitle: "tb1qxy2k...Owlh",
                isRecived: true,
              ),
              _homeCardWidget(
                cardIcon: Icons.arrow_upward,
                cardTitle: "Received",
                cardSubtitle: "tb1qxy2k...Owlh",
                isRecived: false,
              ),
              20.h.height,
            ],
          ).paddingHorizontal(20.w),
        ),
      ),
    );
  }

  Widget _transactionMethods({
    required String methodImg,
    required String methtodTitle,
  }) {
    return Container(
      height: 110.h,
      width: 110,
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: AppColors.darkGrey),
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageIcon(AssetImage(methodImg), color: AppColors.white, size: 30),
            Text(
              methtodTitle,
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

  Widget _homeCurrencyWidget() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 20.h),

      decoration: BoxDecoration(
        border: Border.all(width: 2, color: AppColors.darkGrey),
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
        image: DecorationImage(
          image: AssetImage(AppAssets.backgroundCardImg),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// Icon
              Image.asset(AppAssets.bitCoinLogo, width: 50.w),

              12.w.width,

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bitcoin",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.customText20(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ).animate().fadeIn(duration: 600.ms, delay: 400.ms),

                  4.h.height,

                  Text(
                    "Testnet",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.customText12(
                      color: AppColors.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ).animate().fadeIn(duration: 600.ms, delay: 500.ms),
                ],
              ),
              Spacer(),
              Container(
                height: 32.w,
                width: 32.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 2, color: AppColors.darkGrey),
                ),
                child: Icon(
                  Icons.remove_red_eye_outlined,
                  color: AppColors.white,
                  size: 18,
                ),
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
                style: AppTextStyles.customText36(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ).animate().fadeIn(duration: 600.ms, delay: 400.ms),
              7.w.width,
              Text(
                "BTC",
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.customText24(
                  color: Colors.white.withValues(alpha: 0.5),
                  fontWeight: FontWeight.w300,
                ),
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
                style: AppTextStyles.customText18(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ).animate().fadeIn(duration: 600.ms, delay: 400.ms),
              8.w.width,
              ImageIcon(
                AssetImage(AppAssets.volumeIcon),
                color: AppColors.secondary,
              ),
              2.w.width,
              Text(
                "\$745.80",
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.customText18(
                  color: AppColors.secondary,
                  fontWeight: FontWeight.w400,
                ),
              ).animate().fadeIn(duration: 600.ms, delay: 400.ms),
            ],
          ),
        ],
      ).paddingSymmetric(horizontal: 15.w, vertical: 20.w),
    );
  }

  Widget _homeCardWidget({
    required IconData cardIcon,
    required String cardTitle,
    required String cardSubtitle,
    required bool isRecived,
  }) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 20.h),
      height: 85.h,
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: AppColors.darkGrey),
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
                color: isRecived == true
                    ? AppColors.secondary.withValues(alpha: 0.2)
                    : AppColors.red.withValues(alpha: 0.2),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  cardIcon,
                  color: isRecived == true ? AppColors.green : AppColors.red,
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
                    cardTitle,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.customText18(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ).animate().fadeIn(duration: 600.ms, delay: 400.ms),

                  4.h.height,

                  Text(
                    cardSubtitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.customText12(
                      color: Colors.white.withValues(alpha: 0.6),
                    ),
                  ).animate().fadeIn(duration: 600.ms, delay: 500.ms),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "+75.8 BTC",
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.customText16(
                    color: isRecived == true ? AppColors.green : AppColors.red,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "\$34.74",
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.customText16(
                    color: AppColors.darkGrey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
