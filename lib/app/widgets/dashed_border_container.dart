import 'dart:ui';

import 'package:flutter/material.dart';

class DashedBorderContainer extends StatelessWidget {
  final Widget child;
  final bool isSelected;
  final Color borderColor;
  final double borderRadius;
  final double dashWidth;
  final double dashSpace;
  final double strokeWidth;

  const DashedBorderContainer({
    super.key,
    required this.child,
    required this.isSelected,
    required this.borderColor,
    this.borderRadius = 8,
    this.dashWidth = 5,
    this.dashSpace = 3,
    this.strokeWidth = 1.5,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DashedBorderPainter(
        color: borderColor,
        isSelected: isSelected,
        dashWidth: dashWidth,
        dashSpace: dashSpace,
        strokeWidth: strokeWidth,
        borderRadius: borderRadius,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: child,
      ),
    );
  }
}

class _DashedBorderPainter extends CustomPainter {
  final Color color;
  final bool isSelected;
  final double dashWidth;
  final double dashSpace;
  final double strokeWidth;
  final double borderRadius;

  _DashedBorderPainter({
    required this.color,
    required this.isSelected,
    required this.dashWidth,
    required this.dashSpace,
    required this.strokeWidth,
    required this.borderRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final RRect rRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(borderRadius),
    );

    final Path path = Path()..addRRect(rRect);

    if (isSelected) {
      // Draw solid border
      canvas.drawPath(path, paint);
    } else {
      // Draw dashed border
      final PathMetrics pathMetrics = path.computeMetrics();
      for (final PathMetric pathMetric in pathMetrics) {
        double distance = 0.0;
        while (distance < pathMetric.length) {
          final Path extractPath =
          pathMetric.extractPath(distance, distance + dashWidth);
          canvas.drawPath(extractPath, paint);
          distance += dashWidth + dashSpace;
        }
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
