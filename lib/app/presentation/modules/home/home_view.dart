import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';
import 'package:pose_detector/app/presentation/modules/home/home_controller.dart';

import '../global/pose_painter.dart';

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
    _init();
  }

  Future<void> _init() async {
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

    //init camera
    await _cameraController.initialize();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async =>
          await _cameraController.startImageStream(_processCameraImage),
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
    final state = ref.watch(homeControllerProvider);
    final notifier = ref.read(homeControllerProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pose detector'),
      ),
      body: GestureDetector(
        onTap: () {
          notifier.updateCameraOn(!state.cameraOn);
        },
        child: state.cameraOn
            ? Stack(
                children: [
                  SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: CameraPreview(_cameraController),
                  ),
                  _buildPoseOverlay(),
                ],
              )
            : SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black,
                        width: 5,
                      ),
                    ),
                    child: const Icon(
                      Icons.play_arrow,
                      color: Colors.black,
                      size: 70,
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  Widget _buildPoseOverlay() {
    final state = ref.watch(homeControllerProvider);
    return CustomPaint(
      painter: PosePainter(state.posePoints),
    );
  }

  Future<void> _processCameraImage(CameraImage image) async {
    if (!_cameraController.value.isInitialized) return;

    final allBytes = WriteBuffer();
    for (final plane in image.planes) {
      allBytes.putUint8List(plane.bytes);
    }
    final bytes = allBytes.done().buffer.asUint8List();

    final metadata = InputImageMetadata(
      size: Size(
        image.width.toDouble(),
        image.height.toDouble(),
      ),
      rotation: InputImageRotation.rotation0deg,
      format: InputImageFormat.nv21,
      bytesPerRow: image.planes[0].bytesPerRow,
    );

    final inputImage = InputImage.fromBytes(
      bytes: bytes,
      metadata: metadata,
    );

    // Detectar poses
    try {
      final poses = await _poseDetector.processImage(inputImage);
      ref.read(homeControllerProvider.notifier).updatePosePoints(poses);
    } catch (e) {
      if (kDebugMode) {
        print('Error al detectar poses: $e');
      }
    }
  }
}
