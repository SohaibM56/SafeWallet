import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safewallet/app/config/app_colors.dart';
import 'package:safewallet/app/config/app_text_style.dart';
import 'package:safewallet/app/config/padding_extensions.dart';
import 'package:safewallet/app/widgets/app_logol/app_logo_widget.dart';
import 'package:safewallet/app/widgets/custom_app_bar.dart';
import 'package:safewallet/app/widgets/sizedbox_extension.dart';

class AboutUsView extends StatefulWidget {
  const AboutUsView({super.key});

  @override
  State<AboutUsView> createState() => _AboutUsViewState();
}

class _AboutUsViewState extends State<AboutUsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: CustomAppBar(
        appBarType: AppBarType.custom,

        title: 'About us',
        addBackButton: true,
        centerTitle: true,
      ),

      body: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            28.h.height,
            AppLogoWidget().paddingHorizontal(70.w),
            23.h.height,
            customText(),
          ],
        ).paddingHorizontal(16.h),
      ),
    );
  }
}

Widget customText({String? heading, String? text}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Lorem ipsum ',
        style: AppTextStyles.customTextRboto(
          fontSize: 16.sp,
          color: AppColors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      Text(
        'Dolor sit amet consectetur. Quam bibendum sit nec egestas facilisis molestie nisi sit sed. Lobortis neque neque amet facilisis sapien velit sed id suspendisse. Sed ac porta pellentesque magna. Varius nisl aliquet mauris tempor amet in. dolor sit amet consectetur. Quam bibendum sit nec egestas facilisis molestie nisi sit sed. Lobortis neque neque amet facilisis sapien velit sed id suspendisse. Sed ac porta pellentesque magna. Varius nisl aliquet mauris tempor amet in. dolor sit amet consectetur. Quam bibendum sit nec egestas facilisis molestie nisi sit sed. Lobortis neque neque amet facilisis sapien velit sed id suspendisse. Sed ac porta pellentesque magna. Varius nisl aliquet mauris tempor amet in. dolor sit amet consectetur. Quam bibendum sit nec egestas facilisis molestie nisi sit sed. Lobortis neque neque amet facilisis sapien velit sed id suspendisse. Sed ac porta pellentesque magna. Varius nisl aliquet mauris tempor amet in. ',
        style: AppTextStyles.customTextRboto(
          fontSize: 14.sp,
          color: AppColors.white.withOpacity(.7),
          fontWeight: FontWeight.w400,
        ),
      ),
    ],
  );
}
