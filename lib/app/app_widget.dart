import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'config/app_colors.dart';
import 'config/app_routes.dart';

/// Root widget for the LayerX app with GetX and responsive design.
class SafeWalletApp extends StatelessWidget {
  const SafeWalletApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      useInheritedMediaQuery: true,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.secondary),
            useMaterial3: true,
          ),
          initialRoute: AppRoutes.bottomBarView,
          getPages: AppPages.routes,
        );
      },
    );
  }
}
