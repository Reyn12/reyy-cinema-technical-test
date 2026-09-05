import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:reyy_cinema/resources/resources.dart';

class TicketDetailDivider extends StatelessWidget {
  const TicketDetailDivider({
    super.key,
    this.color,
    required this.backgroundColor,
    this.height = 28,
    this.notchRadius = 10,
    this.dashWidth = 5,
    this.dashGap = 4,
    this.parentBorderWidth = 0,
  });

  final Color? color;
  final Color backgroundColor;
  final double height;
  final double notchRadius;
  final double dashWidth;
  final double dashGap;
  final double parentBorderWidth;

  @override
  Widget build(BuildContext context) {
    final lineColor = color ?? AppColors.neutral50;

    return SizedBox(
      height: height,
      width: double.infinity,
      child: CustomPaint(
        painter: _TicketDividerPainter(
          color: lineColor,
          backgroundColor: backgroundColor,
          notchRadius: notchRadius,
          dashWidth: dashWidth,
          dashGap: dashGap,
          parentBorderWidth: parentBorderWidth,
        ),
      ),
    );
  }
}

class _TicketDividerPainter extends CustomPainter {
  _TicketDividerPainter({
    required this.color,
    required this.backgroundColor,
    required this.notchRadius,
    required this.dashWidth,
    required this.dashGap,
    required this.parentBorderWidth,
  });

  final Color color;
  final Color backgroundColor;
  final double notchRadius;
  final double dashWidth;
  final double dashGap;
  final double parentBorderWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final centerY = size.height / 2;
    final leftNotchCenter = -parentBorderWidth;
    final rightNotchCenter = size.width + parentBorderWidth;
    final dashStartX = notchRadius + 4;
    final dashEndX = size.width - notchRadius - 4;

    final linePaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2
      ..strokeCap = StrokeCap.round;

    final fillPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;

    final leftPath = Path()
      ..moveTo(leftNotchCenter, centerY)
      ..arcTo(
        Rect.fromCircle(
          center: Offset(leftNotchCenter, centerY),
          radius: notchRadius,
        ),
        -math.pi / 2,
        math.pi,
        false,
      )
      ..close();
    canvas.drawPath(leftPath, fillPaint);

    final rightPath = Path()
      ..moveTo(rightNotchCenter, centerY)
      ..arcTo(
        Rect.fromCircle(
          center: Offset(rightNotchCenter, centerY),
          radius: notchRadius,
        ),
        math.pi / 2,
        math.pi,
        false,
      )
      ..close();
    canvas.drawPath(rightPath, fillPaint);

    double x = dashStartX;
    while (x < dashEndX) {
      final dashEnd = (x + dashWidth).clamp(0.0, dashEndX);
      if (dashEnd > x) {
        canvas.drawLine(
          Offset(x, centerY),
          Offset(dashEnd, centerY),
          linePaint,
        );
      }
      x += dashWidth + dashGap;
    }
  }

  @override
  bool shouldRepaint(covariant _TicketDividerPainter oldDelegate) =>
      color != oldDelegate.color ||
      backgroundColor != oldDelegate.backgroundColor ||
      notchRadius != oldDelegate.notchRadius ||
      dashWidth != oldDelegate.dashWidth ||
      dashGap != oldDelegate.dashGap ||
      parentBorderWidth != oldDelegate.parentBorderWidth;
}
