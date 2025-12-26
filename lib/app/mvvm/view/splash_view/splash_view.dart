import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:safewallet/app/config/app_colors.dart';
import 'package:safewallet/app/mvvm/view_model/splash_controller/splash_controller.dart';
import 'package:safewallet/app/widgets/custom_app_bar.dart';

import '../../../config/app_assets.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final SplashController controller = Get.find();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await controller.showLanguageSheet(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      extendBodyBehindAppBar: true,
      extendBody: true,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Text("v 1.0", style: TextStyle(fontSize: 18, color: AppColors.primary)),
          ),
        ],
      ),
      appBar: CustomAppBar(backgroundColor: AppColors.transparent, title: '', leading: SizedBox.shrink()),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.appLogo, width: double.infinity, height: 130.h).paddingSymmetric(horizontal: 10.w),
            // .animate()
            // .scale(
            //   duration: 1200.ms,
            //   begin: const Offset(0.5, 0.5),
            //   end: const Offset(1, 1),
            //   curve: Curves.elasticOut,
            // )
            // .then(delay: 300.ms)
            // .shake(duration: 800.ms, hz: 4, curve: Curves.elasticOut)
            // .then(delay: 200.ms)
            // .scale(
            //   duration: 600.ms,
            //   begin: const Offset(1, 1),
            //   end: const Offset(0.95, 0.95),
            //   curve: Curves.easeInOut,
            // ),
          ],
        ),
      ),
    );
  }
}
