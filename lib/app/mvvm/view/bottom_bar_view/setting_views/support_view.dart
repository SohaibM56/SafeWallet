import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:safewallet/app/config/app_colors.dart';
import 'package:safewallet/app/widgets/sizedbox_extension.dart';

import '../../../../config/app_text_style.dart';
import '../../../../widgets/custom_app_bar.dart';

class SupportView extends StatelessWidget {
  const SupportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: CustomAppBar(
        title: 'Help & Support',
        titleColor: Colors.white,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lorem ipsum',
            style: AppTextStyles.customText16(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),

          5.h.height,

          Text(
            textAlign: TextAlign.justify,
            'Dolor sit amet consectetur. Quam bibendum sit nec egestas facilisis molestie nisi sit sed. Lobortis neque neque amet facilisis sapien velit sed id suspendisse. Sed ac porta pellentesque magna. Varius nisl aliquet mauris tempor amet in. dolor sit amet consectetur. Quam bibendum sit nec egestas facilisis molestie nisi sit sed. Lobortis neque neque amet facilisis sapien velit sed id suspendisse. Sed ac porta pellentesque magna. Varius nisl aliquet mauris tempor amet in. dolor sit amet consectetur. Quam bibendum sit nec egestas facilisis molestie nisi sit sed. Lobortis neque neque amet facilisis sapien velit sed id suspendisse. Sed ac porta pellentesque magna. Varius nisl aliquet mauris tempor amet in. dolor sit amet consectetur. Quam bibendum sit nec egestas facilisis molestie nisi sit sed. Lobortis neque neque amet facilisis sapien velit sed id suspendisse. Sed ac porta pellentesque magna. Varius nisl aliquet mauris tempor amet in. ',
            style: AppTextStyles.customText14(
              color: Colors.white.withValues(alpha: 0.5),
              fontWeight: FontWeight.w400,
            ),
          ),

          10.h.height,

          Text(
            'Lorem ipsum',
            style: AppTextStyles.customText16(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),

          5.h.height,

          Text(
            textAlign: TextAlign.justify,
            'Dolor sit amet consectetur. Quam bibendum sit nec egestas facilisis molestie nisi sit sed. Lobortis neque neque amet facilisis sapien velit sed id suspendisse. Sed ac porta pellentesque magna. Varius nisl aliquet mauris tempor amet in. dolor sit amet consectetur. Quam bibendum sit nec egestas facilisis molestie nisi sit sed. Lobortis neque neque amet facilisis sapien velit sed id suspendisse. Sed ac porta pellentesque magna. Varius nisl aliquet mauris tempor amet in. dolor sit amet consectetur. Quam bibendum sit nec egestas facilisis molestie nisi sit sed. Lobortis neque neque amet facilisis sapien velit sed id suspendisse. Sed ac porta pellentesque magna. Varius nisl aliquet mauris tempor amet in. dolor sit amet consectetur. Quam bibendum sit nec egestas facilisis molestie nisi sit sed. Lobortis neque neque amet facilisis sapien velit sed id suspendisse. Sed ac porta pellentesque magna. Varius nisl aliquet mauris tempor amet in. ',
            style: AppTextStyles.customText14(
              color: Colors.white.withValues(alpha: 0.5),
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ).paddingSymmetric(horizontal: 20.w, vertical: 10.h).animate()
          .fadeIn(duration: 600.ms, delay: 300.ms)
          .scale(
        begin: const Offset(0.7, 0.7),
        curve: Curves.easeOutBack,
      ),
    );
  }
}
