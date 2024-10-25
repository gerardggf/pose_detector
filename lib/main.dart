import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/views/home/home_view.dart';

void main() {
  runApp(
    const ProviderScope(
      child: PoseDetectorApp(),
    ),
  );
}

class PoseDetectorApp extends StatelessWidget {
  const PoseDetectorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Pose detector',
      home: HomeView(),
    );
  }
}
