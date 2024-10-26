import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    @Default(false) bool cameraOn,
    @Default([]) List<Pose> posePoints,
  }) = _HomeState;
}
