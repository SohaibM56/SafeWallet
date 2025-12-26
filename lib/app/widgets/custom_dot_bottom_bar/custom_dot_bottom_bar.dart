import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class CustomDotBottomBar extends StatefulWidget {
  final Curve animationCurve;
  final Duration animationDuration;
  final Color backgroundColor;
  final Color indicatorColor;
  final double height;
  final double indicatorSize;
  final int selectedIndex;
  final List<Widget> items;
  final ValueChanged<int>? onTap;
  final ScrollController? scrollController;
  final double borderRadius;
  final bool hideOnScroll;

  const CustomDotBottomBar({
    super.key,
    required this.items,
    this.scrollController,
    this.hideOnScroll = false,
    this.animationCurve = Curves.easeOut,
    this.animationDuration = const Duration(milliseconds: 600),
    this.backgroundColor = Colors.black,
    this.indicatorColor = Colors.white,
    this.height = 75.0,
    this.indicatorSize = 5,
    this.selectedIndex = 0,
    this.onTap,
    this.borderRadius = 25,
  });

  @override
  State<CustomDotBottomBar> createState() => _CustomDotBottomBarState();
}

class _CustomDotBottomBarState extends State<CustomDotBottomBar>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late double _pos;

  late final AnimationController _sliderController = AnimationController(
    vsync: this,
    duration: widget.animationDuration,
    reverseDuration: widget.animationDuration,
  );

  @override
  void dispose() {
    _animationController.dispose();
    _sliderController.dispose();
    widget.scrollController?.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant CustomDotBottomBar oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.selectedIndex != widget.selectedIndex) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        _buttonTap(widget.selectedIndex);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _pos = widget.selectedIndex / widget.items.length;
    _animationController = AnimationController(
      vsync: this,
      value: _pos,
      lowerBound: 0,
      upperBound: widget.items.length.toDouble(),
    );
    _animationController.addListener(
          () => setState(() => _pos = _animationController.value),
    );

    widget.scrollController?.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _sliderController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, widget.height * _sliderController.value),
          child: SizedBox(
            height: widget.height,
            child: Stack(
              children: [
                Positioned.fill(
                  child: CustomPaint(
                    painter: CurvedNavPainter(
                      startingLoc: _pos,
                      itemsLength: widget.items.length,
                      color: widget.backgroundColor,
                      indicatorColor: widget.indicatorColor,
                      textDirection: Directionality.of(context),
                      borderRadius: widget.borderRadius,
                    ),
                    child: Container(),
                  ),
                ),
                Positioned(
                  left: 20,
                  right: 20,
                  bottom: 10,
                  child: SafeArea(
                    top: false,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        for (int i = 0; i < widget.items.length; i++)
                          Expanded(
                            child: GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () => _buttonTap(i),
                              child: widget.items[i],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _scrollListener() {
    if (_sliderController.isAnimating || widget.hideOnScroll == false) {
      return;
    }

    if (widget.scrollController?.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (_sliderController.isCompleted) {
        _sliderController.reverse();
      }
    } else if (widget.scrollController?.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (_sliderController.isCompleted || !_sliderController.isAnimating) {
        _sliderController.forward();
      }
    }
  }

  void _buttonTap(int index) {
    if (widget.onTap != null) {
      widget.onTap!(index);
    }
    _animationController.animateTo(
      index.toDouble(),
      duration: widget.animationDuration,
      curve: widget.animationCurve,
    );
  }
}

// CurvedNavPainter
class CurvedNavPainter extends CustomPainter {
  final Color color;
  late double loc;
  final TextDirection textDirection;
  final Color indicatorColor;
  final double borderRadius;
  final double horizontalMargin; // Added for edge safe space

  CurvedNavPainter({
    required double startingLoc,
    required int itemsLength,
    required this.color,
    required this.textDirection,
    required this.indicatorColor,
    this.borderRadius = 25,
    this.horizontalMargin = 20,    // Default margin, adjust to fit your padding
  }) {
    loc = 1.0 / itemsLength * (startingLoc + 0.5);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;

    const double curveDepth = 15.0;
    final double notchWidth = 46.0;
    const double pillWidth = 18.0;
    const double pillHeight = 10.0;
    const double pillRadius = 90.0;
    final double pillCenterY = height * 0.05; // Center above icon/label as needed

    // Calculate effective area (subtract horizontal margin from both sides)
    final double effectiveWidth = width - 2 * horizontalMargin;
    final double itemCenterX = horizontalMargin + effectiveWidth * loc;

    final paintBg = Paint()..color = color;

    final path = Path()
    // Top-left radius
      ..moveTo(0, borderRadius)
      ..quadraticBezierTo(0, 0, borderRadius, 0)
    // Start of notch
      ..lineTo(itemCenterX - notchWidth / 2, 0)
    // Left curve of notch
      ..cubicTo(
        itemCenterX - notchWidth * 0.30,
        0,
        itemCenterX - notchWidth * 0.38,
        curveDepth * 0.55,
        itemCenterX - notchWidth * 0.18,
        curveDepth,
      )
    // Bottom of notch
      ..cubicTo(
        itemCenterX - notchWidth * 0.10,
        curveDepth * 1.05,
        itemCenterX + notchWidth * 0.10,
        curveDepth * 1.05,
        itemCenterX + notchWidth * 0.18,
        curveDepth,
      )
    // Right curve of notch
      ..cubicTo(
        itemCenterX + notchWidth * 0.38,
        curveDepth * 0.55,
        itemCenterX + notchWidth * 0.30,
        0,
        itemCenterX + notchWidth / 2,
        0,
      )
    // Top-right radius
      ..lineTo(width - borderRadius, 0)
      ..quadraticBezierTo(width, 0, width, borderRadius)
    // Rectangle body
      ..lineTo(width, height)
      ..lineTo(0, height)
      ..close();

    canvas.drawPath(path, paintBg);


    // Pill indicator with horizontal padding
    final pillRect = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: Offset(itemCenterX, pillCenterY),
        width: pillWidth,
        height: pillHeight,
      ),
      const Radius.circular(pillRadius),
    );

    final pillPaint = Paint()
      ..color = indicatorColor
      ..style = PaintingStyle.fill;

    canvas.drawRRect(pillRect, pillPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
