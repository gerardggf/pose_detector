// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeState {
  bool get cameraOn => throw _privateConstructorUsedError;
  List<Pose> get posePoints => throw _privateConstructorUsedError;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call({bool cameraOn, List<Pose> posePoints});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cameraOn = null,
    Object? posePoints = null,
  }) {
    return _then(_value.copyWith(
      cameraOn: null == cameraOn
          ? _value.cameraOn
          : cameraOn // ignore: cast_nullable_to_non_nullable
              as bool,
      posePoints: null == posePoints
          ? _value.posePoints
          : posePoints // ignore: cast_nullable_to_non_nullable
              as List<Pose>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool cameraOn, List<Pose> posePoints});
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cameraOn = null,
    Object? posePoints = null,
  }) {
    return _then(_$HomeStateImpl(
      cameraOn: null == cameraOn
          ? _value.cameraOn
          : cameraOn // ignore: cast_nullable_to_non_nullable
              as bool,
      posePoints: null == posePoints
          ? _value._posePoints
          : posePoints // ignore: cast_nullable_to_non_nullable
              as List<Pose>,
    ));
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  _$HomeStateImpl(
      {this.cameraOn = false, final List<Pose> posePoints = const []})
      : _posePoints = posePoints;

  @override
  @JsonKey()
  final bool cameraOn;
  final List<Pose> _posePoints;
  @override
  @JsonKey()
  List<Pose> get posePoints {
    if (_posePoints is EqualUnmodifiableListView) return _posePoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posePoints);
  }

  @override
  String toString() {
    return 'HomeState(cameraOn: $cameraOn, posePoints: $posePoints)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.cameraOn, cameraOn) ||
                other.cameraOn == cameraOn) &&
            const DeepCollectionEquality()
                .equals(other._posePoints, _posePoints));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, cameraOn, const DeepCollectionEquality().hash(_posePoints));

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  factory _HomeState({final bool cameraOn, final List<Pose> posePoints}) =
      _$HomeStateImpl;

  @override
  bool get cameraOn;
  @override
  List<Pose> get posePoints;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
