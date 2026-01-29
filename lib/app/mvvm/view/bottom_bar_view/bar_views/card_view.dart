import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:safewallet/app/config/app_colors.dart';
import 'package:safewallet/app/config/app_text_style.dart';
import 'package:safewallet/app/config/padding_extensions.dart';
import 'package:safewallet/app/config/utils.dart';
import 'package:safewallet/app/widgets/sizedbox_extension.dart';

import '../../../../config/app_assets.dart';
import '../../../../widgets/common_app_bar.dart';
import '../../../../widgets/custom_sheets/recent_transations_sheet.dart';

class CardView extends StatefulWidget {
  const CardView({super.key});

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  bool showCardDetails = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonAppBar(),

              _buildCreditCardSection()
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 300.ms)
                  .slideY(begin: 0.3, curve: Curves.easeOutCubic),

              20.h.height,

              _buildCardStatusSection()
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 400.ms)
                  .slideY(begin: 0.3, curve: Curves.easeOutCubic),

              20.h.height,

              _buildActionButtons()
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 500.ms)
                  .slideY(begin: 0.3, curve: Curves.easeOutCubic),

              30.h.height,

              _buildSecurityFeatures()
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 600.ms)
                  .slideY(begin: 0.3, curve: Curves.easeOutCubic),

              20.h.height,

              _buildActionItem(title: "Request a physical Card", onTap: () {})
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 700.ms)
                  .slideY(begin: 0.3, curve: Curves.easeOutCubic),

              10.h.height,

              _buildActionItem(
                    title: "View Transactions",
                    onTap: () {
                      Utils.showBottomSheet(
                        context: context,
                        child: RecentTransactionsSheet(),
                      );
                    },
                  )
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 800.ms)
                  .slideY(begin: 0.3, curve: Curves.easeOutCubic),

              30.h.height,
            ],
          ).paddingHorizontal(20.w),
        ),
      ),
    );
  }

  Widget _buildCreditCardSection() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        // color: AppColors.primarySoft,
        border: Utils.greenBorder,
        // Border.all(
        //   color: AppColors.primary.withValues(alpha: 0.5.sp),
        //   width: 2.w,
        // ),
        image: DecorationImage(
          image: AssetImage(AppAssets.cardBg),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Credit",
                style: AppTextStyles.customText(
                  fontSize: 22,
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    showCardDetails = !showCardDetails;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1CE3A1).withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.visibility_outlined,
                        color: AppColors.white,
                        size: 18.sp,
                      ),
                      8.w.width,
                      Text(
                        "Show Details",
                        style: AppTextStyles.customText(
                          fontSize: 13,
                          color: AppColors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          60.h.height,

          // Card Number Section
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      showCardDetails ? "Nadeem Ahmed" : "Nadxxx xxxx",
                      style: AppTextStyles.customText(
                        fontSize: 18,
                        color: AppColors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    10.h.height,
                    Row(
                      children: [
                        Text(
                          showCardDetails
                              ? "4532 - 1234 - 5678 - 9012"
                              : "xxxx - xxxx - xxxx - x089",
                          style: AppTextStyles.customText(
                            fontSize: 16,
                            color: AppColors.white,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.5,
                          ),
                        ),
                        15.w.width,
                        GestureDetector(
                          onTap: () {
                            Clipboard.setData(
                              ClipboardData(text: "4532123456789012"),
                            );
                            Utils.showToast("Card number copied");
                          },
                          child: Icon(
                            Icons.content_copy_rounded,
                            color: AppColors.white,
                            size: 22.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCardStatusSection() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.darkGrey),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        children: [
          // Card Status Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Card Status",
                style: AppTextStyles.customText12(
                  color: Colors.white.withValues(alpha: 0.6),
                  fontWeight: FontWeight.w400,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: Color(0xff005430),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  "Active",
                  style: AppTextStyles.customText(
                    fontSize: 11,
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          15.h.height,
          // Monthly Limit
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Monthly Limit",
                style: AppTextStyles.customText12(
                  color: Colors.white.withValues(alpha: 0.6),
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "SAR 500,000",
                style: AppTextStyles.customText16(
                  color: AppColors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          15.h.height,
          // Spent This Month
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Spent this month",
                style: AppTextStyles.customText12(
                  color: Colors.white.withValues(alpha: 0.6),
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "SAR 45,230",
                style: AppTextStyles.customText16(
                  color: AppColors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          10.h.height,
          // Progress Bar
          LinearProgressIndicator(
            value: 0.09,
            minHeight: 8.0,
            backgroundColor: Color(0x1F1CE3A1),
            color: Color(0xff005430),
            borderRadius: BorderRadius.circular(10.r),
          ),
          8.h.height,
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "9% of limit used",
              style: AppTextStyles.customText(
                fontSize: 10,
                color: Colors.white.withValues(alpha: 0.5),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: _buildActionButton(
            icon: AppAssets.limitsIc,
            label: "Limits",
            onTap: () {
              // Handle limits
            },
          ),
        ),
        10.w.width,
        Expanded(
          child: _buildActionButton(
            icon: AppAssets.copyIc,
            label: "Copy",
            onTap: () {
              Clipboard.setData(ClipboardData(text: "4532123456789012"));
              Utils.showToast("Card details copied");
            },
          ),
        ),
        10.w.width,
        Expanded(
          child: _buildActionButton(
            icon: AppAssets.freezeIc,
            label: "Freeze",
            onTap: () {
              // Handle freeze
            },
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required String icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: BoxDecoration(
          color: AppColors.primarySoft,
          border: Utils.greenBorder,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          children: [
            // Icon(icon, color: AppColors.white, size: 24.sp),
            Image.asset(icon, color: AppColors.white, height: 22.sp),
            8.h.height,
            Text(
              label,
              style: AppTextStyles.customText12(
                color: AppColors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSecurityFeatures() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "SECURITY FEATURES",
          style: AppTextStyles.customText(
            fontSize: 14,
            color: Colors.white.withValues(alpha: 0.5),
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
        15.h.height,
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.darkGrey),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            children: [
              _buildSecurityItem(
                icon: AppAssets.protectedIc,
                title: "AML Protected",
                status: "Active",
                statusColor: Colors.white.withValues(alpha: 0.5),
                isFirst: true,
                isLast: false,
              ),
              Divider(
                color: AppColors.darkGrey,
                thickness: 1.h,
              ).paddingSymmetric(horizontal: 15.w),
              _buildSecurityItem(
                icon: AppAssets.dotLockIc,
                title: "Biometric Lock",
                status: "Enabled",
                statusColor: Colors.white.withValues(alpha: 0.5),
                isFirst: false,
                isLast: false,
              ),
              Divider(
                color: AppColors.darkGrey,
                thickness: 1.h,
              ).paddingSymmetric(horizontal: 15.w),
              _buildSecurityItem(
                icon: AppAssets.freezeIc,
                title: "Instant Freeze",
                status: "Ready",
                statusColor: Colors.white.withValues(alpha: 0.5),
                isFirst: false,
                isLast: false,
              ),
              Divider(
                color: AppColors.darkGrey,
                thickness: 1.h,
              ).paddingSymmetric(horizontal: 15.w),
              _buildSecurityItem(
                icon: AppAssets.globeIc,
                title: "Global Access",
                status: "KSA Region",
                statusColor: Colors.white.withValues(alpha: 0.5),
                isFirst: false,
                isLast: true,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSecurityItem({
    required String icon,
    required String title,
    required String status,
    required Color statusColor,
    bool isFirst = false,
    bool isLast = false,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
      child: Row(
        children: [
          Container(
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(
              color: const Color(0xFF414345),
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: Center(
              child: Image.asset(icon, color: AppColors.white, height: 22.sp),
            ),
          ),
          16.w.width,
          Expanded(
            child: Text(
              title,
              style: AppTextStyles.customText(
                fontSize: 16,
                color: AppColors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            status,
            style: AppTextStyles.customText(
              fontSize: 14,
              color: statusColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionItem({
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.darkGrey),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.customText(
                  fontSize: 16,
                  color: AppColors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: AppColors.white.withValues(alpha: 0.6),
              size: 24.sp,
            ),
          ],
        ),
      ),
    );
  }
}
