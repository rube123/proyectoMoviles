import 'package:flutter/material.dart';
import 'dart:math' as math;

class AttributePainter extends CustomPainter {
  final double progressPercent;
  final double strokeWidth, filledStrokeWidth;
  final Paint bgPaint;
  final Paint strokeBgPaint;
  final Paint strokeFilledPaint;

  AttributePainter({
    required this.progressPercent,
    this.strokeWidth = 4.0,
    this.filledStrokeWidth = 8.0,
  }) : bgPaint = Paint()..color = Colors.white.withOpacity(0.25),
       strokeBgPaint = Paint()..color = Color(0xffD264C9),
       strokeFilledPaint =
           Paint()
             ..color = Colors.white
             ..style = PaintingStyle.stroke
             ..strokeWidth = filledStrokeWidth
             ..strokeCap = StrokeCap.round;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    canvas.drawCircle(center, radius, bgPaint);
    canvas.drawCircle(center, radius - strokeWidth, strokeBgPaint);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - (strokeWidth / 2)),
      -math.pi / 2,
      (progressPercent / 100) * math.pi * 2,
      false,
      strokeFilledPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
