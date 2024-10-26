import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';
import 'package:pose_detector/app/presentation/modules/home/state/home_state.dart';

final homeControllerProvider = StateNotifierProvider<HomeController, HomeState>(
  (ref) => HomeController(
    HomeState(),
  ),
);

class HomeController extends StateNotifier<HomeState> {
  HomeController(super.state);

  void updatePosePoints(List<Pose> posePoints) {
    state = state.copyWith(posePoints: posePoints);
  }

  void updateCameraOn(bool cameraOn) {
    state = state.copyWith(cameraOn: cameraOn);
  }
}
