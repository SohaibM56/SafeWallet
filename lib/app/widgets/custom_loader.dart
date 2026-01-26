import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/app_colors.dart';

class CustomLoader extends StatelessWidget {
  final double? height;
  final double? width;

  const CustomLoader({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return CupertinoActivityIndicator(
      color: AppColors.secondary,
      radius: 20.sp,
    );
  }
}
