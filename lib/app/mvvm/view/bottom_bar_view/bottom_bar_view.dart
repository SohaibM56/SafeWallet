import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:safewallet/app/widgets/sizedbox_extension.dart';

import '../../../config/app_assets.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_text_style.dart';
import '../../view_model/bottom_bar_controller/bottom_bar_controller.dart';

class BottomBarView extends StatefulWidget {
  const BottomBarView({super.key});

  @override
  State<BottomBarView> createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView> {
  List screens = <Widget>[Container(color: Colors.grey,), Container(color: Colors.amber,), Container(color: Colors.red,),
    // WalletView(),
    Container(color: Colors.black26,),
    Container(color: Colors.green,)];

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
          backgroundColor: AppColors.primary,
          body: Obx(() => screens[barController.selectedIndex.value]),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: Container(
            width: 1.sw,
            height: 70.h,
            decoration: BoxDecoration(
              color: AppColors.bgSecondary,
              border: Border.all(color: AppColors.primary),
            ),
            child: Obx(
                  () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _bottomIconBuilder(index: 0, icon: AppAssets.home, label: 'Home', activeIcon: AppAssets.homeActive),
                  _bottomIconBuilder(index: 1, icon: AppAssets.trade, label: 'Trade', activeIcon: AppAssets.trade),
                  _bottomIconBuilder(index: 2, icon: AppAssets.rewards, label: 'Rewards', activeIcon: AppAssets.rewardsActive),
                  _bottomIconBuilder(index: 3, icon: AppAssets.tool, label: 'Tools', activeIcon: AppAssets.toolActive),
                  _bottomIconBuilder(index: 4, icon: AppAssets.profile, label: 'Profile', activeIcon: AppAssets.profileActive),
                ],
              ),
            ),
          ),
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
              Image.asset(isSelected ? activeIcon : icon,color: isSelected ? AppColors.secondary : AppColors.iconColor, height: 25.h,),
              8.h.height,
              Text(
                label,
                style: AppTextStyles.customText(fontSize: 10, fontWeight: FontWeight.w400, color: isSelected ? AppColors.secondary : AppColors.iconColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
