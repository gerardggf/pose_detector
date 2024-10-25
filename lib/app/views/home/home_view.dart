import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';
import 'package:pose_detector/app/views/home/home_controller.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  late final CameraController _cameraController;
  late final PoseDetector _poseDetector;

  //TODO: WIP

  @override
  void initState() {
    super.initState();
    //camera init
    _cameraController = CameraController(
      const CameraDescription(
        name: 'pose_detector',
        lensDirection: CameraLensDirection.back,
        sensorOrientation: 0,
      ),
      ResolutionPreset.medium,
    );
    //pose detector init
    _poseDetector = PoseDetector(
      options: PoseDetectorOptions(
        mode: PoseDetectionMode.stream,
      ),
    );
  }

  @override
  void dispose() {
    _cameraController.dispose();
    _poseDetector.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pose detector'),
      ),
      body: Stack(
        children: [
          CameraPreview(_cameraController),
          _buildPoseOverlay(),
        ],
      ),
    );
  }

  Widget _buildPoseOverlay() {
    final state = ref.watch(homeControllerProvider);
    return CustomPaint(
      painter: PosePainter(state),
    );
  }
}

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
