import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:safewallet/app/config/app_colors.dart';
import 'package:safewallet/app/config/padding_extensions.dart';
import 'package:safewallet/app/mvvm/view_model/splash_controller/splash_controller.dart';
import 'package:safewallet/app/widgets/app_logol/app_logo_widget.dart';
import 'package:safewallet/app/widgets/custom_app_bar.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final SplashController controller = Get.find();

  @override
  void initState() {
    controller.decideaAndNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      extendBodyBehindAppBar: true,
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Text("v-1.5", style: TextStyle(fontSize: 18, color: AppColors.white)),
            ),
          ],
        ),
      ),
      appBar: CustomAppBar(backgroundColor: AppColors.transparent, title: '', leading: SizedBox.shrink()),
      body: Center(child: AppLogoWidget().paddingHorizontal(50.w)),
    );
  }
}
