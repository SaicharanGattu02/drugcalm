

import 'package:flutter/material.dart';

import 'constants.dart';

class RoundedProgressPainter extends CustomPainter {
  final double progress;
  final Color bgcolor;
  final Color color;

  RoundedProgressPainter(this.progress, this.bgcolor,this.color);

  @override
  void paint(Canvas canvas, Size size) {
    print("Progress :${progress}");
    final Paint paintBackground = Paint()
      ..color = bgcolor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15
      ..strokeCap = StrokeCap.round;

    final Paint paintForeground = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15
      ..strokeCap = StrokeCap.round;

    final double radius = size.width / 2;

    // Draw background circle
    canvas.drawCircle(
      Offset(radius, radius),
      radius - paintBackground.strokeWidth / 2,
      paintBackground,
    );

    // Draw foreground arc
    final double sweepAngle = 2 * 3.141592653589793 * progress; // Full circle in radians
    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(radius, radius),
        radius: radius - paintForeground.strokeWidth / 2,
      ),
      -3.141592653589793 / 2, // Start angle (top)
      sweepAngle,
      false,
      paintForeground,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Repaint when progress changes
  }
}