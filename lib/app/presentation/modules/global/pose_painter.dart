import 'package:flutter/material.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';

class PosePainter extends CustomPainter {
  final List<Pose> poses;

  PosePainter(this.poses);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;

    for (final pose in poses) {
      for (final landmark in pose.landmarks.values) {
        final point = Offset(
          landmark.x * size.width,
          landmark.y * size.height,
        );
        canvas.drawCircle(point, 5, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
