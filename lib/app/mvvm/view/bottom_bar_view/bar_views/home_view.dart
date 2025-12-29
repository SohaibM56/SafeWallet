import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:safewallet/app/config/app_colors.dart';
import 'package:safewallet/app/config/app_routes.dart';
import 'package:safewallet/app/config/app_text_style.dart';
import 'package:safewallet/app/config/padding_extensions.dart';
import 'package:safewallet/app/config/utils.dart';
import 'package:safewallet/app/widgets/custom_sheets/receive_sheet.dart';
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

  // final methods = [
  //   {
  //     "icon": AppAssets.sendIcon,
  //     "title": "Send",
  //     "onTap": () {
  //       Get.toNamed(AppRoutes.walletView);
  //     },
  //   },
  //   {"icon": AppAssets.receiveIcon, "title": "Receive", "onTap": () {}},
  //   {"icon": AppAssets.historyIcon, "title": "History", "onTap": () {}},
  // ];
  List<TransactionMethod> methods = <TransactionMethod>[
    TransactionMethod(
      icon: AppAssets.sendIcon,
      title: "Send",
      onTap: () {
        Get.toNamed(AppRoutes.walletView);
      },
    ),
    TransactionMethod(
      icon: AppAssets.receiveIcon,
      title: "Receive",
      onTap: () {},
    ),
    TransactionMethod(
      icon: AppAssets.historyIcon,
      title: "History",
      onTap: () {
        Get.toNamed(AppRoutes.allActivityView);
      },
    ),
  ];

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
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                              "Welcome Back",
                              style: AppTextStyles.customText14(
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
                              style: AppTextStyles.customText26(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                            .animate()
                            .fadeIn(duration: 600.ms, delay: 100.ms)
                            .slideY(begin: -0.2, curve: Curves.easeOut),
                      ],
                    ),
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
                  IconButton(
                    onPressed: () {},
                    icon: Container(
                      height: 44.w,
                      width: 44.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.white),
                      ),
                      child: Center(
                        child: Stack(
                          children: [
                            ImageIcon(
                              AssetImage(AppAssets.filledNotificationIcon),
                              color: AppColors.white,
                            ),
                            Positioned(
                              right: 0,
                              child: Container(
                                height: 10.w,
                                width: 10.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.secondary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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

              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8.w,
                  mainAxisSpacing: 8.h,
                ),
                itemCount: methods.length,
                itemBuilder: (context, index) {
                  return _transactionMethods(
                    methodImg: methods[index].icon,
                    methtodTitle: methods[index].title,
                    onTap: methods[index].title == "Receive"
                        ? () {
                            Utils.showBottomSheet(
                              context: context,
                              child: ReceiveSheet(),
                            );
                          }
                        : methods[index].onTap,
                  );
                },
              ).animate().fadeIn(duration: 600.ms, delay: 300.ms),

              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 20.h),
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
                          child: ImageIcon(
                            AssetImage(AppAssets.rewards),
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
                        color: AppColors.green,
                      ),
                      2.w.width,
                      Text(
                        "\$745.80",
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.customText16(
                          color: AppColors.green,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              10.h.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent Activity",
                    style: AppTextStyles.customText20(
                      color: AppColors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ).animate().fadeIn(duration: 600.ms, delay: 400.ms),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.allActivityView);
                    },
                    child: Text(
                      "View All",
                      style: AppTextStyles.customText14(
                        color: AppColors.softgreen,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ).animate().fadeIn(duration: 600.ms, delay: 400.ms),
                ],
              ),
              15.h.height,
              _homeCardWidget(
                cardIcon: AppAssets.greenArrow,
                cardTitle: "Received",
                cardSubtitle: "tb1qxy2k...Owlh",
                isRecived: true,
              ),
              _homeCardWidget(
                cardIcon: AppAssets.redArrow,
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
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 110.h,
        width: 110,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.darkGrey),
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageIcon(
                AssetImage(methodImg),
                color: AppColors.white,
                size: 30,
              ),
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
      ),
    );
  }

  Widget _homeCurrencyWidget() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 20.h),

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
                  border: Border.all(width: 1, color: AppColors.darkGrey),
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
                color: AppColors.green,
              ),
              2.w.width,
              Text(
                "\$745.80",
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.customText18(
                  color: AppColors.green,
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
    required String cardIcon,
    required String cardTitle,
    required String cardSubtitle,
    required bool isRecived,
  }) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10.h),
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
                color: isRecived == true
                    ? AppColors.secondary.withValues(alpha: 0.2)
                    : AppColors.red.withValues(alpha: 0.2),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: ImageIcon(
                  AssetImage(cardIcon),
                  size: isRecived == true ? 25 : 35,
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
                  "${isRecived == true ? '+' : '-'}75.8 BTC",
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

class TransactionMethod {
  final String icon;
  final String title;
  final VoidCallback onTap;

  TransactionMethod({
    required this.icon,
    required this.title,
    required this.onTap,
  });
}
