// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'commits_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CommitsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Commits> receivedCommits) loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Commits> receivedCommits)? loaded,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Commits> receivedCommits)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CommitsInitial value) initial,
    required TResult Function(CommitsLoading value) loading,
    required TResult Function(CommitsLoaded value) loaded,
    required TResult Function(CommitsError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CommitsInitial value)? initial,
    TResult? Function(CommitsLoading value)? loading,
    TResult? Function(CommitsLoaded value)? loaded,
    TResult? Function(CommitsError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CommitsInitial value)? initial,
    TResult Function(CommitsLoading value)? loading,
    TResult Function(CommitsLoaded value)? loaded,
    TResult Function(CommitsError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommitsStateCopyWith<$Res> {
  factory $CommitsStateCopyWith(
          CommitsState value, $Res Function(CommitsState) then) =
      _$CommitsStateCopyWithImpl<$Res, CommitsState>;
}

/// @nodoc
class _$CommitsStateCopyWithImpl<$Res, $Val extends CommitsState>
    implements $CommitsStateCopyWith<$Res> {
  _$CommitsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CommitsInitialCopyWith<$Res> {
  factory _$$CommitsInitialCopyWith(
          _$CommitsInitial value, $Res Function(_$CommitsInitial) then) =
      __$$CommitsInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CommitsInitialCopyWithImpl<$Res>
    extends _$CommitsStateCopyWithImpl<$Res, _$CommitsInitial>
    implements _$$CommitsInitialCopyWith<$Res> {
  __$$CommitsInitialCopyWithImpl(
      _$CommitsInitial _value, $Res Function(_$CommitsInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CommitsInitial implements CommitsInitial {
  const _$CommitsInitial();

  @override
  String toString() {
    return 'CommitsState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CommitsInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Commits> receivedCommits) loaded,
    required TResult Function() error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Commits> receivedCommits)? loaded,
    TResult? Function()? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Commits> receivedCommits)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CommitsInitial value) initial,
    required TResult Function(CommitsLoading value) loading,
    required TResult Function(CommitsLoaded value) loaded,
    required TResult Function(CommitsError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CommitsInitial value)? initial,
    TResult? Function(CommitsLoading value)? loading,
    TResult? Function(CommitsLoaded value)? loaded,
    TResult? Function(CommitsError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CommitsInitial value)? initial,
    TResult Function(CommitsLoading value)? loading,
    TResult Function(CommitsLoaded value)? loaded,
    TResult Function(CommitsError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class CommitsInitial implements CommitsState {
  const factory CommitsInitial() = _$CommitsInitial;
}

/// @nodoc
abstract class _$$CommitsLoadingCopyWith<$Res> {
  factory _$$CommitsLoadingCopyWith(
          _$CommitsLoading value, $Res Function(_$CommitsLoading) then) =
      __$$CommitsLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CommitsLoadingCopyWithImpl<$Res>
    extends _$CommitsStateCopyWithImpl<$Res, _$CommitsLoading>
    implements _$$CommitsLoadingCopyWith<$Res> {
  __$$CommitsLoadingCopyWithImpl(
      _$CommitsLoading _value, $Res Function(_$CommitsLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CommitsLoading implements CommitsLoading {
  const _$CommitsLoading();

  @override
  String toString() {
    return 'CommitsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CommitsLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Commits> receivedCommits) loaded,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Commits> receivedCommits)? loaded,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Commits> receivedCommits)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CommitsInitial value) initial,
    required TResult Function(CommitsLoading value) loading,
    required TResult Function(CommitsLoaded value) loaded,
    required TResult Function(CommitsError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CommitsInitial value)? initial,
    TResult? Function(CommitsLoading value)? loading,
    TResult? Function(CommitsLoaded value)? loaded,
    TResult? Function(CommitsError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CommitsInitial value)? initial,
    TResult Function(CommitsLoading value)? loading,
    TResult Function(CommitsLoaded value)? loaded,
    TResult Function(CommitsError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CommitsLoading implements CommitsState {
  const factory CommitsLoading() = _$CommitsLoading;
}

/// @nodoc
abstract class _$$CommitsLoadedCopyWith<$Res> {
  factory _$$CommitsLoadedCopyWith(
          _$CommitsLoaded value, $Res Function(_$CommitsLoaded) then) =
      __$$CommitsLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Commits> receivedCommits});
}

/// @nodoc
class __$$CommitsLoadedCopyWithImpl<$Res>
    extends _$CommitsStateCopyWithImpl<$Res, _$CommitsLoaded>
    implements _$$CommitsLoadedCopyWith<$Res> {
  __$$CommitsLoadedCopyWithImpl(
      _$CommitsLoaded _value, $Res Function(_$CommitsLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? receivedCommits = null,
  }) {
    return _then(_$CommitsLoaded(
      null == receivedCommits
          ? _value._receivedCommits
          : receivedCommits // ignore: cast_nullable_to_non_nullable
              as List<Commits>,
    ));
  }
}

/// @nodoc

class _$CommitsLoaded implements CommitsLoaded {
  const _$CommitsLoaded(final List<Commits> receivedCommits)
      : _receivedCommits = receivedCommits;

  final List<Commits> _receivedCommits;
  @override
  List<Commits> get receivedCommits {
    if (_receivedCommits is EqualUnmodifiableListView) return _receivedCommits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_receivedCommits);
  }

  @override
  String toString() {
    return 'CommitsState.loaded(receivedCommits: $receivedCommits)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommitsLoaded &&
            const DeepCollectionEquality()
                .equals(other._receivedCommits, _receivedCommits));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_receivedCommits));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommitsLoadedCopyWith<_$CommitsLoaded> get copyWith =>
      __$$CommitsLoadedCopyWithImpl<_$CommitsLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Commits> receivedCommits) loaded,
    required TResult Function() error,
  }) {
    return loaded(receivedCommits);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Commits> receivedCommits)? loaded,
    TResult? Function()? error,
  }) {
    return loaded?.call(receivedCommits);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Commits> receivedCommits)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(receivedCommits);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CommitsInitial value) initial,
    required TResult Function(CommitsLoading value) loading,
    required TResult Function(CommitsLoaded value) loaded,
    required TResult Function(CommitsError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CommitsInitial value)? initial,
    TResult? Function(CommitsLoading value)? loading,
    TResult? Function(CommitsLoaded value)? loaded,
    TResult? Function(CommitsError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CommitsInitial value)? initial,
    TResult Function(CommitsLoading value)? loading,
    TResult Function(CommitsLoaded value)? loaded,
    TResult Function(CommitsError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class CommitsLoaded implements CommitsState {
  const factory CommitsLoaded(final List<Commits> receivedCommits) =
      _$CommitsLoaded;

  List<Commits> get receivedCommits;
  @JsonKey(ignore: true)
  _$$CommitsLoadedCopyWith<_$CommitsLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CommitsErrorCopyWith<$Res> {
  factory _$$CommitsErrorCopyWith(
          _$CommitsError value, $Res Function(_$CommitsError) then) =
      __$$CommitsErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CommitsErrorCopyWithImpl<$Res>
    extends _$CommitsStateCopyWithImpl<$Res, _$CommitsError>
    implements _$$CommitsErrorCopyWith<$Res> {
  __$$CommitsErrorCopyWithImpl(
      _$CommitsError _value, $Res Function(_$CommitsError) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CommitsError implements CommitsError {
  const _$CommitsError();

  @override
  String toString() {
    return 'CommitsState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CommitsError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Commits> receivedCommits) loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Commits> receivedCommits)? loaded,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Commits> receivedCommits)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CommitsInitial value) initial,
    required TResult Function(CommitsLoading value) loading,
    required TResult Function(CommitsLoaded value) loaded,
    required TResult Function(CommitsError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CommitsInitial value)? initial,
    TResult? Function(CommitsLoading value)? loading,
    TResult? Function(CommitsLoaded value)? loaded,
    TResult? Function(CommitsError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CommitsInitial value)? initial,
    TResult Function(CommitsLoading value)? loading,
    TResult Function(CommitsLoaded value)? loaded,
    TResult Function(CommitsError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class CommitsError implements CommitsState {
  const factory CommitsError() = _$CommitsError;
}
