import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:safewallet/app/config/app_assets.dart';
import 'package:safewallet/app/widgets/custom_back_button.dart';
import 'package:safewallet/app/widgets/sizedbox_extension.dart';

import '../../../../config/app_colors.dart';
import '../../../../config/app_text_style.dart';

class AllActivityView extends StatefulWidget {
  const AllActivityView({super.key});

  @override
  State<AllActivityView> createState() => _AllActivityViewState();
}

class _AllActivityViewState extends State<AllActivityView> {
  final List<Map<String, dynamic>> transactions = [
    {
      "title": "Incoming Transfer",
      "subtitle": "tb1qxy2k...Owlh",
      "isRecived": true,
    },
    {
      "title": "Outgoing Transfer",
      "subtitle": "tb1qxy2k...Owlh",
      "isRecived": false,
    },
    {
      "title": "Incoming Transfer",
      "subtitle": "tb1qxy2k...Owlh",
      "isRecived": true,
    },
    {
      "title": "Outgoing Transfer",
      "subtitle": "tb1qxy2k...Owlh",
      "isRecived": false,
    },
    {
      "title": "Incoming Transfer",
      "subtitle": "tb1qxy2k...Owlh",
      "isRecived": true,
    },
    {
      "title": "Outgoing Transfer",
      "subtitle": "tb1qxy2k...Owlh",
      "isRecived": false,
    },
    {
      "title": "Incoming Transfer",
      "subtitle": "tb1qxy2k...Owlh",
      "isRecived": true,
    },
    {
      "title": "Outgoing Transfer",
      "subtitle": "tb1qxy2k...Owlh",
      "isRecived": false,
    },
    {
      "title": "Incoming Transfer",
      "subtitle": "tb1qxy2k...Owlh",
      "isRecived": true,
    },
    {
      "title": "Outgoing Transfer",
      "subtitle": "tb1qxy2k...Owlh",
      "isRecived": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: SizedBox(
          height: Get.height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back Button
                CustomBackButton()
                    .animate()
                    .fadeIn(duration: 400.ms)
                    .slideX(begin: -0.3, curve: Curves.easeOut),

                30.h.height,

                Text(
                      "All Activity",
                      style: AppTextStyles.customText24(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                    .animate()
                    .fadeIn(duration: 600.ms, delay: 100.ms)
                    .slideY(begin: -0.2, curve: Curves.easeOut),

                30.h.height,

                ListView.builder(
                      itemCount: transactions.length,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (context, index) {
                        final tx = transactions[index];
                        return _homeCardWidget(
                          cardTitle: tx['title'],
                          cardSubtitle: tx['subtitle'],
                          isIncomming: tx['isRecived'],
                        );
                      },
                    )
                    .animate()
                    .fadeIn(duration: 600.ms, delay: 150.ms)
                    .slideY(begin: -0.2, curve: Curves.easeOut),
              ],
            ),
          ),
        ).paddingSymmetric(horizontal: 24.w),
      ),
    );
  }

  Widget _homeCardWidget({
    required String cardTitle,
    required String cardSubtitle,
    required bool isIncomming,
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
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Icon
            Container(
              height: 50.w,
              width: 50.w,
              decoration: BoxDecoration(
                color: isIncomming == true
                    ? AppColors.primary.withValues(alpha: 0.5)
                    : AppColors.red.withValues(alpha: 0.2),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: isIncomming == true
                    ? Icon(Icons.add, size: 35, color: AppColors.green)
                    : ImageIcon(
                        AssetImage(AppAssets.redArrow),
                        size: 35,
                        color: AppColors.red,
                      ),
              ),
            ),

            5.w.width,

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
                  "${isIncomming == true ? '+' : '-'}75.8 BTC",
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.customText16(
                    color: isIncomming == true
                        ? AppColors.softgreen
                        : AppColors.red,
                    fontWeight: FontWeight.w600,
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
