import 'package:flutter/material.dart';
import 'package:safewallet/app/config/app_colors.dart';

class FaceHolePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint overlayPaint = Paint()
      ..color = AppColors.white.withOpacity(0.7);

    final Path fullPath = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height));

    /// 🔵 BIGGER CIRCLE
    final double radius = size.width * 0.45;

    /// 📍 Proper Figma-aligned position
    final Offset center = Offset(size.width / 2, radius + size.width * 0.1);

    final Path holePath = Path()
      ..addOval(Rect.fromCircle(center: center, radius: radius));

    final Path finalPath = Path.combine(
      PathOperation.difference,
      fullPath,
      holePath,
    );

    canvas.drawPath(finalPath, overlayPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
