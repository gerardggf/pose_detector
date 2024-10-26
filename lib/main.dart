import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/pose_detector_app.dart';

void main() {
  runApp(
    const ProviderScope(
      child: PoseDetectorApp(),
    ),
  );
}
