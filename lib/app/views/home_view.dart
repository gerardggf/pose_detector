import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final CameraController _cameraController;

  @override
  void initState() {
    super.initState();
    _cameraController = CameraController(
      const CameraDescription(
        name: 'pose_detector',
        lensDirection: CameraLensDirection.back,
        sensorOrientation: 0,
      ),
      ResolutionPreset.medium,
    );
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pose detector'),
      ),
      body: CameraPreview(_cameraController),
    );
  }
}
