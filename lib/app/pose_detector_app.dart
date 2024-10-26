import 'package:flutter/material.dart';

import 'presentation/modules/home/home_view.dart';

class PoseDetectorApp extends StatelessWidget {
  const PoseDetectorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pose detector',
      home: HomeView(),
    );
  }
}
