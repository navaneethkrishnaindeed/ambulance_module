// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_validator_and_custom_keyboard_navigation_manager_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FormValidatorAndCustomKeyboardNavigationManagerEvent {
  BuildContext get context => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context) init,
    required TResult Function(
            bool isObsure,
            int limit,
            String label,
            ValueNotifier<dynamic> valueNotifier,
            BuildContext context,
            bool isFinite,
            bool? isPhone)
        navigateToNumPad,
    required TResult Function(
            String label,
            ValueNotifier<dynamic> valueNotifier,
            BuildContext context,
            bool isObscure)
        navigateToKeyBoard,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context)? init,
    TResult? Function(
            bool isObsure,
            int limit,
            String label,
            ValueNotifier<dynamic> valueNotifier,
            BuildContext context,
            bool isFinite,
            bool? isPhone)?
        navigateToNumPad,
    TResult? Function(String label, ValueNotifier<dynamic> valueNotifier,
            BuildContext context, bool isObscure)?
        navigateToKeyBoard,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context)? init,
    TResult Function(
            bool isObsure,
            int limit,
            String label,
            ValueNotifier<dynamic> valueNotifier,
            BuildContext context,
            bool isFinite,
            bool? isPhone)?
        navigateToNumPad,
    TResult Function(String label, ValueNotifier<dynamic> valueNotifier,
            BuildContext context, bool isObscure)?
        navigateToKeyBoard,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) init,
    required TResult Function(NumPadNavigationHandler value) navigateToNumPad,
    required TResult Function(KeyboardNavigationHandler value)
        navigateToKeyBoard,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? init,
    TResult? Function(NumPadNavigationHandler value)? navigateToNumPad,
    TResult? Function(KeyboardNavigationHandler value)? navigateToKeyBoard,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? init,
    TResult Function(NumPadNavigationHandler value)? navigateToNumPad,
    TResult Function(KeyboardNavigationHandler value)? navigateToKeyBoard,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FormValidatorAndCustomKeyboardNavigationManagerEventCopyWith<
          FormValidatorAndCustomKeyboardNavigationManagerEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormValidatorAndCustomKeyboardNavigationManagerEventCopyWith<
    $Res> {
  factory $FormValidatorAndCustomKeyboardNavigationManagerEventCopyWith(
          FormValidatorAndCustomKeyboardNavigationManagerEvent value,
          $Res Function(FormValidatorAndCustomKeyboardNavigationManagerEvent)
              then) =
      _$FormValidatorAndCustomKeyboardNavigationManagerEventCopyWithImpl<$Res,
          FormValidatorAndCustomKeyboardNavigationManagerEvent>;
  @useResult
  $Res call({BuildContext context});
}

/// @nodoc
class _$FormValidatorAndCustomKeyboardNavigationManagerEventCopyWithImpl<$Res,
        $Val extends FormValidatorAndCustomKeyboardNavigationManagerEvent>
    implements
        $FormValidatorAndCustomKeyboardNavigationManagerEventCopyWith<$Res> {
  _$FormValidatorAndCustomKeyboardNavigationManagerEventCopyWithImpl(
      this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
  }) {
    return _then(_value.copyWith(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StartedCopyWith<$Res>
    implements
        $FormValidatorAndCustomKeyboardNavigationManagerEventCopyWith<$Res> {
  factory _$$StartedCopyWith(_$Started value, $Res Function(_$Started) then) =
      __$$StartedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BuildContext context});
}

/// @nodoc
class __$$StartedCopyWithImpl<$Res>
    extends _$FormValidatorAndCustomKeyboardNavigationManagerEventCopyWithImpl<
        $Res, _$Started> implements _$$StartedCopyWith<$Res> {
  __$$StartedCopyWithImpl(_$Started _value, $Res Function(_$Started) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
  }) {
    return _then(_$Started(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$Started implements Started {
  const _$Started({required this.context});

  @override
  final BuildContext context;

  @override
  String toString() {
    return 'FormValidatorAndCustomKeyboardNavigationManagerEvent.init(context: $context)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Started &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StartedCopyWith<_$Started> get copyWith =>
      __$$StartedCopyWithImpl<_$Started>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context) init,
    required TResult Function(
            bool isObsure,
            int limit,
            String label,
            ValueNotifier<dynamic> valueNotifier,
            BuildContext context,
            bool isFinite,
            bool? isPhone)
        navigateToNumPad,
    required TResult Function(
            String label,
            ValueNotifier<dynamic> valueNotifier,
            BuildContext context,
            bool isObscure)
        navigateToKeyBoard,
  }) {
    return init(context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context)? init,
    TResult? Function(
            bool isObsure,
            int limit,
            String label,
            ValueNotifier<dynamic> valueNotifier,
            BuildContext context,
            bool isFinite,
            bool? isPhone)?
        navigateToNumPad,
    TResult? Function(String label, ValueNotifier<dynamic> valueNotifier,
            BuildContext context, bool isObscure)?
        navigateToKeyBoard,
  }) {
    return init?.call(context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context)? init,
    TResult Function(
            bool isObsure,
            int limit,
            String label,
            ValueNotifier<dynamic> valueNotifier,
            BuildContext context,
            bool isFinite,
            bool? isPhone)?
        navigateToNumPad,
    TResult Function(String label, ValueNotifier<dynamic> valueNotifier,
            BuildContext context, bool isObscure)?
        navigateToKeyBoard,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) init,
    required TResult Function(NumPadNavigationHandler value) navigateToNumPad,
    required TResult Function(KeyboardNavigationHandler value)
        navigateToKeyBoard,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? init,
    TResult? Function(NumPadNavigationHandler value)? navigateToNumPad,
    TResult? Function(KeyboardNavigationHandler value)? navigateToKeyBoard,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? init,
    TResult Function(NumPadNavigationHandler value)? navigateToNumPad,
    TResult Function(KeyboardNavigationHandler value)? navigateToKeyBoard,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class Started
    implements FormValidatorAndCustomKeyboardNavigationManagerEvent {
  const factory Started({required final BuildContext context}) = _$Started;

  @override
  BuildContext get context;
  @override
  @JsonKey(ignore: true)
  _$$StartedCopyWith<_$Started> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NumPadNavigationHandlerCopyWith<$Res>
    implements
        $FormValidatorAndCustomKeyboardNavigationManagerEventCopyWith<$Res> {
  factory _$$NumPadNavigationHandlerCopyWith(_$NumPadNavigationHandler value,
          $Res Function(_$NumPadNavigationHandler) then) =
      __$$NumPadNavigationHandlerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isObsure,
      int limit,
      String label,
      ValueNotifier<dynamic> valueNotifier,
      BuildContext context,
      bool isFinite,
      bool? isPhone});
}

/// @nodoc
class __$$NumPadNavigationHandlerCopyWithImpl<$Res>
    extends _$FormValidatorAndCustomKeyboardNavigationManagerEventCopyWithImpl<
        $Res, _$NumPadNavigationHandler>
    implements _$$NumPadNavigationHandlerCopyWith<$Res> {
  __$$NumPadNavigationHandlerCopyWithImpl(_$NumPadNavigationHandler _value,
      $Res Function(_$NumPadNavigationHandler) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isObsure = null,
    Object? limit = null,
    Object? label = null,
    Object? valueNotifier = null,
    Object? context = null,
    Object? isFinite = null,
    Object? isPhone = freezed,
  }) {
    return _then(_$NumPadNavigationHandler(
      isObsure: null == isObsure
          ? _value.isObsure
          : isObsure // ignore: cast_nullable_to_non_nullable
              as bool,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      valueNotifier: null == valueNotifier
          ? _value.valueNotifier
          : valueNotifier // ignore: cast_nullable_to_non_nullable
              as ValueNotifier<dynamic>,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      isFinite: null == isFinite
          ? _value.isFinite
          : isFinite // ignore: cast_nullable_to_non_nullable
              as bool,
      isPhone: freezed == isPhone
          ? _value.isPhone
          : isPhone // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$NumPadNavigationHandler implements NumPadNavigationHandler {
  const _$NumPadNavigationHandler(
      {required this.isObsure,
      required this.limit,
      required this.label,
      required this.valueNotifier,
      required this.context,
      required this.isFinite,
      this.isPhone});

  @override
  final bool isObsure;
  @override
  final int limit;
  @override
  final String label;
  @override
  final ValueNotifier<dynamic> valueNotifier;
  @override
  final BuildContext context;
  @override
  final bool isFinite;
  @override
  final bool? isPhone;

  @override
  String toString() {
    return 'FormValidatorAndCustomKeyboardNavigationManagerEvent.navigateToNumPad(isObsure: $isObsure, limit: $limit, label: $label, valueNotifier: $valueNotifier, context: $context, isFinite: $isFinite, isPhone: $isPhone)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NumPadNavigationHandler &&
            (identical(other.isObsure, isObsure) ||
                other.isObsure == isObsure) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.valueNotifier, valueNotifier) ||
                other.valueNotifier == valueNotifier) &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.isFinite, isFinite) ||
                other.isFinite == isFinite) &&
            (identical(other.isPhone, isPhone) || other.isPhone == isPhone));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isObsure, limit, label,
      valueNotifier, context, isFinite, isPhone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NumPadNavigationHandlerCopyWith<_$NumPadNavigationHandler> get copyWith =>
      __$$NumPadNavigationHandlerCopyWithImpl<_$NumPadNavigationHandler>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context) init,
    required TResult Function(
            bool isObsure,
            int limit,
            String label,
            ValueNotifier<dynamic> valueNotifier,
            BuildContext context,
            bool isFinite,
            bool? isPhone)
        navigateToNumPad,
    required TResult Function(
            String label,
            ValueNotifier<dynamic> valueNotifier,
            BuildContext context,
            bool isObscure)
        navigateToKeyBoard,
  }) {
    return navigateToNumPad(
        isObsure, limit, label, valueNotifier, context, isFinite, isPhone);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context)? init,
    TResult? Function(
            bool isObsure,
            int limit,
            String label,
            ValueNotifier<dynamic> valueNotifier,
            BuildContext context,
            bool isFinite,
            bool? isPhone)?
        navigateToNumPad,
    TResult? Function(String label, ValueNotifier<dynamic> valueNotifier,
            BuildContext context, bool isObscure)?
        navigateToKeyBoard,
  }) {
    return navigateToNumPad?.call(
        isObsure, limit, label, valueNotifier, context, isFinite, isPhone);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context)? init,
    TResult Function(
            bool isObsure,
            int limit,
            String label,
            ValueNotifier<dynamic> valueNotifier,
            BuildContext context,
            bool isFinite,
            bool? isPhone)?
        navigateToNumPad,
    TResult Function(String label, ValueNotifier<dynamic> valueNotifier,
            BuildContext context, bool isObscure)?
        navigateToKeyBoard,
    required TResult orElse(),
  }) {
    if (navigateToNumPad != null) {
      return navigateToNumPad(
          isObsure, limit, label, valueNotifier, context, isFinite, isPhone);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) init,
    required TResult Function(NumPadNavigationHandler value) navigateToNumPad,
    required TResult Function(KeyboardNavigationHandler value)
        navigateToKeyBoard,
  }) {
    return navigateToNumPad(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? init,
    TResult? Function(NumPadNavigationHandler value)? navigateToNumPad,
    TResult? Function(KeyboardNavigationHandler value)? navigateToKeyBoard,
  }) {
    return navigateToNumPad?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? init,
    TResult Function(NumPadNavigationHandler value)? navigateToNumPad,
    TResult Function(KeyboardNavigationHandler value)? navigateToKeyBoard,
    required TResult orElse(),
  }) {
    if (navigateToNumPad != null) {
      return navigateToNumPad(this);
    }
    return orElse();
  }
}

abstract class NumPadNavigationHandler
    implements FormValidatorAndCustomKeyboardNavigationManagerEvent {
  const factory NumPadNavigationHandler(
      {required final bool isObsure,
      required final int limit,
      required final String label,
      required final ValueNotifier<dynamic> valueNotifier,
      required final BuildContext context,
      required final bool isFinite,
      final bool? isPhone}) = _$NumPadNavigationHandler;

  bool get isObsure;
  int get limit;
  String get label;
  ValueNotifier<dynamic> get valueNotifier;
  @override
  BuildContext get context;
  bool get isFinite;
  bool? get isPhone;
  @override
  @JsonKey(ignore: true)
  _$$NumPadNavigationHandlerCopyWith<_$NumPadNavigationHandler> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$KeyboardNavigationHandlerCopyWith<$Res>
    implements
        $FormValidatorAndCustomKeyboardNavigationManagerEventCopyWith<$Res> {
  factory _$$KeyboardNavigationHandlerCopyWith(
          _$KeyboardNavigationHandler value,
          $Res Function(_$KeyboardNavigationHandler) then) =
      __$$KeyboardNavigationHandlerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String label,
      ValueNotifier<dynamic> valueNotifier,
      BuildContext context,
      bool isObscure});
}

/// @nodoc
class __$$KeyboardNavigationHandlerCopyWithImpl<$Res>
    extends _$FormValidatorAndCustomKeyboardNavigationManagerEventCopyWithImpl<
        $Res, _$KeyboardNavigationHandler>
    implements _$$KeyboardNavigationHandlerCopyWith<$Res> {
  __$$KeyboardNavigationHandlerCopyWithImpl(_$KeyboardNavigationHandler _value,
      $Res Function(_$KeyboardNavigationHandler) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? valueNotifier = null,
    Object? context = null,
    Object? isObscure = null,
  }) {
    return _then(_$KeyboardNavigationHandler(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      valueNotifier: null == valueNotifier
          ? _value.valueNotifier
          : valueNotifier // ignore: cast_nullable_to_non_nullable
              as ValueNotifier<dynamic>,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      isObscure: null == isObscure
          ? _value.isObscure
          : isObscure // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$KeyboardNavigationHandler implements KeyboardNavigationHandler {
  const _$KeyboardNavigationHandler(
      {required this.label,
      required this.valueNotifier,
      required this.context,
      required this.isObscure});

  @override
  final String label;
  @override
  final ValueNotifier<dynamic> valueNotifier;
  @override
  final BuildContext context;
  @override
  final bool isObscure;

  @override
  String toString() {
    return 'FormValidatorAndCustomKeyboardNavigationManagerEvent.navigateToKeyBoard(label: $label, valueNotifier: $valueNotifier, context: $context, isObscure: $isObscure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KeyboardNavigationHandler &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.valueNotifier, valueNotifier) ||
                other.valueNotifier == valueNotifier) &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.isObscure, isObscure) ||
                other.isObscure == isObscure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, label, valueNotifier, context, isObscure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KeyboardNavigationHandlerCopyWith<_$KeyboardNavigationHandler>
      get copyWith => __$$KeyboardNavigationHandlerCopyWithImpl<
          _$KeyboardNavigationHandler>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context) init,
    required TResult Function(
            bool isObsure,
            int limit,
            String label,
            ValueNotifier<dynamic> valueNotifier,
            BuildContext context,
            bool isFinite,
            bool? isPhone)
        navigateToNumPad,
    required TResult Function(
            String label,
            ValueNotifier<dynamic> valueNotifier,
            BuildContext context,
            bool isObscure)
        navigateToKeyBoard,
  }) {
    return navigateToKeyBoard(label, valueNotifier, context, isObscure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context)? init,
    TResult? Function(
            bool isObsure,
            int limit,
            String label,
            ValueNotifier<dynamic> valueNotifier,
            BuildContext context,
            bool isFinite,
            bool? isPhone)?
        navigateToNumPad,
    TResult? Function(String label, ValueNotifier<dynamic> valueNotifier,
            BuildContext context, bool isObscure)?
        navigateToKeyBoard,
  }) {
    return navigateToKeyBoard?.call(label, valueNotifier, context, isObscure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context)? init,
    TResult Function(
            bool isObsure,
            int limit,
            String label,
            ValueNotifier<dynamic> valueNotifier,
            BuildContext context,
            bool isFinite,
            bool? isPhone)?
        navigateToNumPad,
    TResult Function(String label, ValueNotifier<dynamic> valueNotifier,
            BuildContext context, bool isObscure)?
        navigateToKeyBoard,
    required TResult orElse(),
  }) {
    if (navigateToKeyBoard != null) {
      return navigateToKeyBoard(label, valueNotifier, context, isObscure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) init,
    required TResult Function(NumPadNavigationHandler value) navigateToNumPad,
    required TResult Function(KeyboardNavigationHandler value)
        navigateToKeyBoard,
  }) {
    return navigateToKeyBoard(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? init,
    TResult? Function(NumPadNavigationHandler value)? navigateToNumPad,
    TResult? Function(KeyboardNavigationHandler value)? navigateToKeyBoard,
  }) {
    return navigateToKeyBoard?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? init,
    TResult Function(NumPadNavigationHandler value)? navigateToNumPad,
    TResult Function(KeyboardNavigationHandler value)? navigateToKeyBoard,
    required TResult orElse(),
  }) {
    if (navigateToKeyBoard != null) {
      return navigateToKeyBoard(this);
    }
    return orElse();
  }
}

abstract class KeyboardNavigationHandler
    implements FormValidatorAndCustomKeyboardNavigationManagerEvent {
  const factory KeyboardNavigationHandler(
      {required final String label,
      required final ValueNotifier<dynamic> valueNotifier,
      required final BuildContext context,
      required final bool isObscure}) = _$KeyboardNavigationHandler;

  String get label;
  ValueNotifier<dynamic> get valueNotifier;
  @override
  BuildContext get context;
  bool get isObscure;
  @override
  @JsonKey(ignore: true)
  _$$KeyboardNavigationHandlerCopyWith<_$KeyboardNavigationHandler>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FormValidatorAndCustomKeyboardNavigationManagerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormValidatorAndCustomKeyboardNavigationManagerStateCopyWith<
    $Res> {
  factory $FormValidatorAndCustomKeyboardNavigationManagerStateCopyWith(
          FormValidatorAndCustomKeyboardNavigationManagerState value,
          $Res Function(FormValidatorAndCustomKeyboardNavigationManagerState)
              then) =
      _$FormValidatorAndCustomKeyboardNavigationManagerStateCopyWithImpl<$Res,
          FormValidatorAndCustomKeyboardNavigationManagerState>;
}

/// @nodoc
class _$FormValidatorAndCustomKeyboardNavigationManagerStateCopyWithImpl<$Res,
        $Val extends FormValidatorAndCustomKeyboardNavigationManagerState>
    implements
        $FormValidatorAndCustomKeyboardNavigationManagerStateCopyWith<$Res> {
  _$FormValidatorAndCustomKeyboardNavigationManagerStateCopyWithImpl(
      this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$FormValidatorAndCustomKeyboardNavigationManagerStateCopyWithImpl<
        $Res, _$_Initial> implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'FormValidatorAndCustomKeyboardNavigationManagerState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
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
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial
    implements FormValidatorAndCustomKeyboardNavigationManagerState {
  const factory _Initial() = _$_Initial;
}
