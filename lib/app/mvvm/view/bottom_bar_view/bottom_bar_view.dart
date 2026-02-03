import 'dart:io';
import 'dart:ui';

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
  List screens = <Widget>[HomeView(), AuditView(), CardView(), ProfileView()];

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
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 12.h),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22.r),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40), // more blur
                child: Container(
                  height: 80.h,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff1f3f34).withOpacity(0.85), // more vivid
                        Color(0xff0f2a22).withOpacity(0.85),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(22.r),
                    border: Border.all(color: AppColors.white.withOpacity(0.08)),
                  ),
                  child: Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _newBottomItem(index: 0, icon: AppAssets.home, label: "Home"),
                        _newBottomItem(index: 1, icon: AppAssets.auditIc, label: "Audit"),
                        _newBottomItem(index: 2, icon: AppAssets.cardIc, label: "Card"),
                        _newBottomItem(index: 3, icon: AppAssets.settingsIc, label: "Settings"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _newBottomItem({required int index, required String icon, required String label}) {
    bool isSelected = barController.selectedIndex.value == index;

    return GestureDetector(
      onTap: () {
        barController.selectedIndex.value = index;
      },
      child: AnimatedContainer(
        width: 70.w,
        duration: const Duration(milliseconds: 250),
        margin: EdgeInsets.symmetric(vertical: 6.h),
        decoration: BoxDecoration(color: isSelected ? AppColors.primary : Colors.transparent, borderRadius: BorderRadius.circular(16.r)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(icon, height: 23.h, color: isSelected ? Colors.white : Colors.white54),
            5.h.height,
            Text(
              label,
              style: AppTextStyles.customText(fontSize: 14, fontWeight: FontWeight.w500, color: isSelected ? Colors.white : Colors.white54),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomIconBuilder({int? index, required String icon, required String activeIcon, required String label}) {
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
              Image.asset(isSelected ? activeIcon : icon, color: isSelected ? AppColors.primary : AppColors.iconColor, height: 25.h),
              8.h.height,
              Text(
                label,
                style: AppTextStyles.customText(fontSize: 10, fontWeight: FontWeight.w400, color: isSelected ? AppColors.primary : AppColors.iconColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
