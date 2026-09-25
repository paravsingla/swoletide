import 'dart:math';
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class ProgressRing extends StatelessWidget{
  final double progress;
  final double size;
  final double strokeWidth;
  final Color color;
  final Widget? child;

  const ProgressRing({
    super.key,
    required this.progress,
    this.size = 220,
    this.strokeWidth = 14,
    this.color = AppColors.primary,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(size, size),
            painter: _RingPainter(progress: progress.clamp(0.0, 1.0), color: color, strokeWidth: strokeWidth),
          ),
          ?child,
        ],
      ),
    );
  }
}


class _RingPainter extends CustomPainter {
  final double progress;
  final double strokeWidth;
  final Color color;

  _RingPainter({
    required this.progress,
    required this.strokeWidth,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    final trackPaint = Paint()
      ..color = AppColors.ringTrack
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final progressPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, trackPaint);

    const startAngle = -pi / 2;
    final sweepAngle = 2 * pi * progress;


    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _RingPainter oldDelegate){
    return oldDelegate.progress != progress ||
      oldDelegate.color != color || 
      oldDelegate.strokeWidth != strokeWidth;
  }
}