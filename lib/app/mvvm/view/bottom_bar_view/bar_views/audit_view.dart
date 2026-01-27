import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safewallet/app/config/app_assets.dart';
import 'package:safewallet/app/config/app_colors.dart';
import 'package:safewallet/app/config/app_text_style.dart';
import 'package:safewallet/app/config/padding_extensions.dart';
import 'package:safewallet/app/widgets/data_show_widget.dart';
import 'package:safewallet/app/widgets/sizedbox_extension.dart';

class AuditView extends StatefulWidget {
  const AuditView({super.key});

  @override
  State<AuditView> createState() => _AuditViewState();
}

class _AuditViewState extends State<AuditView> {
  final List<Map<String, dynamic>> transactions = [
    {
      "title": "Incoming Transfer",
      "subtitle": "2024-01-15 14:32:18 UTC",
      "hash": "3e2d1c0b9a8f7e6d5c4b3a2f1e0d9c8b7a6f",
      "status": "Passed",
      "amount": "+75.8 SAR",
      "usd": "\$34.74",
    },
    {
      "title": "Outgoing Transfer",
      "subtitle": "2024-01-15 14:32:18 UTC",
      "hash": "3e2d1c0b9a8f7e6d5c4b3a2f1e0d9c8b7a6f",
      "status": "Pending",
      "amount": "-23.8 SAR",
      "usd": "\$34.74",
    },
    {
      "title": "Card Issuance Request",
      "subtitle": "2024-01-15 14:32:18 UTC",
      "hash": "3e2d1c0b9a8f7e6d5c4b3a2f1e0d9c8b7a6f",
      "status": "Rejected",
      "amount": "-23.8 SAR",
      "usd": "\$34.74",
    },
  ];
  Color _statusColor(String status) {
    switch (status) {
      case 'Passed':
        return AppColors.primary;
      case 'Pending':
        return AppColors.orange;
      case 'Rejected':
        return AppColors.red;
      default:
        return AppColors.white;
    }
  }

  Color _iconBgColor(String status) {
    switch (status) {
      case 'Rejected':
        return AppColors.red.withValues(alpha: 0.5);
      default:
        return AppColors.primary.withValues(alpha: 0.5);
    }
  }

  Widget _statusIcon(String status) {
    switch (status) {
      case 'Passed':
        return ImageIcon(
          AssetImage(AppAssets.passedIc),
          size: 25,
          color: AppColors.softgreen,
        );

      case 'Pending':
        return ImageIcon(
          AssetImage(AppAssets.pendingIc),
          size: 25,
          color: AppColors.softgreen,
        );

      case 'Rejected':
        return ImageIcon(
          AssetImage(AppAssets.rejectedIc),
          size: 25,
          color: AppColors.red,
        );

      default:
        return ImageIcon(
          AssetImage(AppAssets.passedIc),
          size: 25,
          color: AppColors.softgreen,
        );
    }
  }

  Color _textColor(String status) {
    switch (status) {
      case 'Rejected':
        return AppColors.red;

      default:
        return AppColors.softgreen;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CommonAppBar(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent Activity",
                    style: AppTextStyles.customText20(
                      color: AppColors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ).animate().fadeIn(duration: 600.ms, delay: 400.ms),
                  Row(
                    children: [
                      // Icon(Icons.unlock),
                      Text(
                        "Immutable Record",
                        style: AppTextStyles.customText14(
                          color: AppColors.white.withValues(alpha: 0.5),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ).animate().fadeIn(duration: 600.ms, delay: 400.ms),
                ],
              ),
              15.h.height,
              ListView.builder(
                    itemCount: transactions.length,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) {
                      final tx = transactions[index];
                      return _homeCardWidget(
                        cardTitle: tx['title'],
                        cardSubtitle: tx['subtitle'],
                        hashKey: tx['hash'],
                        amount: tx['amount'],
                        usd: tx['usd'],
                        status: tx['status'],
                      ).paddingBottom(10.h);
                    },
                  )
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 150.ms)
                  .slideY(begin: -0.2, curve: Curves.easeOut),
            ],
          ).paddingHorizontal(20.w),
        ),
      ),
    );
  }

  Widget _homeCardWidget({
    required String cardTitle,
    required String cardSubtitle,
    required String hashKey,
    required String status,
    required String amount,
    required String usd,
  }) {
    return Container(
      width: double.infinity,
      // margin: EdgeInsets.only(bottom: 10.h),
      // height: 85.h,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: AppColors.darkGrey),
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// STATUS ICON
              Container(
                height: 50.w,
                width: 50.w,
                decoration: BoxDecoration(
                  color: _iconBgColor(status),
                  shape: BoxShape.circle,
                ),
                child: Center(child: _statusIcon(status)),
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
                      style: AppTextStyles.customText16(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ).animate().fadeIn(duration: 600.ms, delay: 400.ms),

                    4.h.height,

                    Text(
                      cardSubtitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.customText10(
                        color: Colors.white.withValues(alpha: 0.6),
                      ),
                    ).animate().fadeIn(duration: 600.ms, delay: 500.ms),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    amount,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.customText16(
                      color: _textColor(status),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    usd,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.customText12(
                      color: AppColors.darkGrey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Divider(
            color: AppColors.grey,
          ).animate().fadeIn(duration: 600.ms, delay: 500.ms),
          Row(
            children: [
              Expanded(
                child: Text(
                  hashKey,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.customText10(
                    color: Colors.white.withValues(alpha: 0.6),
                  ),
                ).animate().fadeIn(duration: 600.ms, delay: 500.ms),
              ),
              20.h.height,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 7.h),
                decoration: BoxDecoration(
                  color: _statusColor(status),
                  borderRadius: BorderRadius.all(Radius.circular(55.r)),
                ),
                child: Center(
                  child: Text(
                    status,
                    style: AppTextStyles.customText12(
                      color: AppColors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ).paddingFromAll(12.sp),
    );
  }
}
