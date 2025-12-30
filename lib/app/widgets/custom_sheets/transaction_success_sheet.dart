import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:safewallet/app/config/app_text_style.dart';
import 'package:safewallet/app/config/padding_extensions.dart';
import 'package:safewallet/app/config/utils.dart';
import 'package:safewallet/app/widgets/custom_sheets/bank_alert_sheet.dart';
import 'package:safewallet/app/widgets/sizedbox_extension.dart';

import '../../config/app_assets.dart';
import '../../config/app_colors.dart';

class TransactionSuccessSheet extends StatelessWidget {
  const TransactionSuccessSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Transaction successful",
                        style: AppTextStyles.customText18(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      5.h.height,
                      Text(
                        "Ref#FT25347089BRM5P7",
                        style: AppTextStyles.customText(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey,
                        ),
                      ),
                    ],
                  ),
                ),

                InkWell(
                  onTap: () {
                    Get.back();
                    Utils.showBottomSheet(context: context, child: BankAlertSheet());
                  },
                  child: Icon(Icons.close, color: AppColors.black, size: 22.sp),
                ),
              ],
            ).paddingRight(5.w),

            30.h.height,
            _buildTile("From", "879 NAFATH"),
            10.h.height,

            SvgPicture.asset(AppAssets.transferIcon),

            10.h.height,

            _buildTile("To", "879 SAMA"),

            20.h.height,

            DottedLinePainter(),

            20.h.height,

            _buildTile("Platform Fee", "USD 120.00"),

            20.h.height,

            _buildTile("Conversion Fee", "USD 80.00"),

            20.h.height,

            DottedLinePainter(),

            20.h.height,

            _buildTile("Total", "USD 200.00"),

            10.h.height,
          ],
        ).paddingAll(20.sp),
      ),
    );
  }

  Widget _buildTile(String title, String value){
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyles.customText(
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.grey,
            ),
          ),
          Text(
            value,
            style: AppTextStyles.customText18(
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
        ],
      );
  }

}

class DottedLinePainter extends StatelessWidget {
  const DottedLinePainter({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DottedLinePainter(),
      child: SizedBox(
        height: 1.h,
        width: double.infinity,
      ),
    );
  }
}

class _DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey[400]!
      ..strokeWidth = 1.0
      ..strokeCap = StrokeCap.round;

    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, size.height / 2),
        Offset(startX + 8, size.height / 2),
        paint,
      );
      startX += 12; // 8 (dash) + 4 (space)
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
