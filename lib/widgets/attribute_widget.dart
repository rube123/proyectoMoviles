import 'package:flutter/material.dart';
import 'attribute_painter.dart';

class AttributeWidget extends StatelessWidget {
  final double size;
  final double progress;
  final Widget child;

  const AttributeWidget({
    Key? key,
    required this.progress,
    this.size = 82,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: AttributePainter(progressPercent: progress),
      size: Size(size, size),
      child: Center(
        child: Container(
          padding: EdgeInsets.all(size / 3.8),
          width: size,
          height: size,
          child: child,
        ),
      ),
    );
  }
}
