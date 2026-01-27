import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:safewallet/app/config/app_colors.dart';
import 'package:safewallet/app/config/app_text_style.dart';
import 'package:safewallet/app/config/padding_extensions.dart';
import 'package:safewallet/app/widgets/sizedbox_extension.dart';

class RecentTransactionsSheet extends StatelessWidget {
  const RecentTransactionsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = [
      {
        "name": "Amazon.sa",
        "icon": Icons.add,
        "date": "2024-01-15 14:32:18 UTC",
        "amount": "+75.8 SAR",
        "usdAmount": "\$34.74",
        "isPositive": true,
      },
      {
        "name": "Jarir Bookstore",
        "icon": Icons.arrow_outward,
        "date": "2024-01-15 14:32:18 UTC",
        "amount": "+75.8 SAR",
        "usdAmount": "\$34.74",
        "isPositive": true,
      },
      {
        "name": "Salary Deposit",
        "icon": Icons.arrow_outward,
        "date": "2024-01-15 14:32:18 UTC",
        "amount": "+75.8 SAR",
        "usdAmount": "\$34.74",
        "isPositive": true,
      },
      {
        "name": "STC Pay",
        "icon": Icons.arrow_outward,
        "date": "2024-01-15 14:32:18 UTC",
        "amount": "+75.8 SAR",
        "usdAmount": "\$34.74",
        "isPositive": true,
      },
    ];

    return SafeArea(
      top: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recent Transactions",
                  style: AppTextStyles.customText(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    padding: EdgeInsets.all(4.w),
                    child: Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 28.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Transactions List
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              final transaction = transactions[index];
              return _buildTransactionItem(
                name: transaction["name"] as String,
                icon: transaction["icon"] as IconData,
                date: transaction["date"] as String,
                amount: transaction["amount"] as String,
                usdAmount: transaction["usdAmount"] as String,
                isPositive: transaction["isPositive"] as bool,
                isLast: index == transactions.length - 1,
              );
            },
          ),

          30.h.height,
        ],
      ),
    );
  }

  Widget _buildTransactionItem({
    required String name,
    required IconData icon,
    required String date,
    required String amount,
    required String usdAmount,
    required bool isPositive,
    bool isLast = false,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: isLast ? 0 : 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          // Icon Circle
          Container(
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(
              color: const Color(0xFFB8F4E4),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.black,
              size: 22.sp,
            ),
          ),

          14.w.width,

          // Transaction Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: AppTextStyles.customText(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                4.h.height,
                Text(
                  date,
                  style: AppTextStyles.customText(
                    fontSize: 13,
                    color: Colors.grey[600]!,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),

          // Amount Details
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: AppTextStyles.customText(
                  fontSize: 17,
                  color: const Color(0xFF1CE3A1),
                  fontWeight: FontWeight.w700,
                ),
              ),
              4.h.height,
              Text(
                usdAmount,
                style: AppTextStyles.customText(
                  fontSize: 13,
                  color: Colors.grey[600]!,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}