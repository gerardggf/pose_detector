import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';

final homeControllerProvider =
    StateNotifierProvider<HomeController, List<Pose>>(
  (ref) => HomeController(
    [],
  ),
);

class HomeController extends StateNotifier<List<Pose>> {
  HomeController(super.state);

  void updatePosePoints(List<Pose> posePoints) {
    state = posePoints;
  }
}
