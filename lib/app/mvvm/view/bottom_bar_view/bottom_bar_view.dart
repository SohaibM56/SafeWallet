import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:safewallet/app/config/app_assets.dart';
import 'package:safewallet/app/mvvm/view/bottom_bar_view/bar_views/audit_view.dart';
import 'package:safewallet/app/mvvm/view/bottom_bar_view/bar_views/card_view.dart';
import 'package:safewallet/app/mvvm/view/bottom_bar_view/bar_views/home_view.dart';
import 'package:safewallet/app/mvvm/view/bottom_bar_view/bar_views/profile_view.dart';
import 'package:safewallet/app/widgets/sizedbox_extension.dart';

import '../../../config/app_colors.dart';
import '../../../config/app_text_style.dart';
import '../../view_model/bottom_bar_controller/bottom_bar_controller.dart';

class BottomBarView extends StatefulWidget {
  const BottomBarView({super.key});

  @override
  State<BottomBarView> createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView> {
  List screens = <Widget>[
    HomeView(),
    AuditView(),
    CardView(),
    // ToolsView(),
    ProfileView(),
  ];

  final BottomBarController barController = Get.find();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        exit(0);
      },
      child: SafeArea(
        top: false,
        bottom: true,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          extendBody: true,
          backgroundColor: AppColors.black,
          body: Obx(() => screens[barController.selectedIndex.value]),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 12.h),
            child: Container(
              height: 74.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22.r),
                gradient: LinearGradient(
                  colors: [Color(0xff1f3f34), Color(0xff0f2a22)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                border: Border.all(color: AppColors.secondary.withOpacity(.4)),
              ),
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _newBottomItem(
                      index: 0,
                      icon: AppAssets.home,
                      label: "Home",
                    ),
                    _newBottomItem(
                      index: 1,
                      icon: AppAssets.auditIc,
                      label: "Audit",
                    ),
                    _newBottomItem(
                      index: 2,
                      icon: AppAssets.cardIc,
                      label: "Card",
                    ),
                    _newBottomItem(
                      index: 3,
                      icon: AppAssets.settingsIc,
                      label: "Settings",
                    ),
                  ],
                ),
              ),
            ),
          ),

          // bottomNavigationBar: Container(
          //   width: 1.sw,
          //   height: 70.h,
          //   decoration: BoxDecoration(
          //     color: AppColors.bgSecondary,
          //     border: Border.all(color: AppColors.secondary),
          //   ),
          //   child: Obx(
          //     () => Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       children: [
          //         _bottomIconBuilder(
          //           index: 0,
          //           icon: AppAssets.home,
          //           label: 'Home',
          //           activeIcon: AppAssets.homeActive,
          //         ),
          //         _bottomIconBuilder(
          //           index: 1,
          //           icon: AppAssets.trade,
          //           label: 'Trade',
          //           activeIcon: AppAssets.trade,
          //         ),
          //         _bottomIconBuilder(
          //           index: 2,
          //           icon: AppAssets.rewards,
          //           label: 'Rewards',
          //           activeIcon: AppAssets.rewardsActive,
          //         ),
          //         _bottomIconBuilder(
          //           index: 3,
          //           icon: AppAssets.tool,
          //           label: 'Tools',
          //           activeIcon: AppAssets.toolActive,
          //         ),
          //         _bottomIconBuilder(
          //           index: 4,
          //           icon: AppAssets.profile,
          //           label: 'Profile',
          //           activeIcon: AppAssets.profileActive,
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ),
      ),
    );
  }

  Widget _newBottomItem({
    required int index,
    required String icon,
    required String label,
  }) {
    bool isSelected = barController.selectedIndex.value == index;

    return GestureDetector(
      onTap: () {
        barController.selectedIndex.value = index;
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        margin: EdgeInsets.symmetric(vertical: 6.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              height: 20.sp,
              color: isSelected ? Colors.white : Colors.white54,
            ),
            8.w.width,
            Text(
              label,
              style: AppTextStyles.customText(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomIconBuilder({
    int? index,
    required String icon,
    required String activeIcon,
    required String label,
  }) {
    bool isSelected = barController.selectedIndex.value == index;

    return Expanded(
      child: InkWell(
        onTap: () {
          barController.selectedIndex.value = index ?? 0;
        },
        child: Center(
          child: Column(
            children: [
              8.h.height,
              Image.asset(
                isSelected ? activeIcon : icon,
                color: isSelected ? AppColors.primary : AppColors.iconColor,
                height: 25.h,
              ),
              8.h.height,
              Text(
                label,
                style: AppTextStyles.customText(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: isSelected ? AppColors.primary : AppColors.iconColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
