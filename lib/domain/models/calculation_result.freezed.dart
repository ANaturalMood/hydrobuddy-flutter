// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calculation_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SubstanceResult _$SubstanceResultFromJson(Map<String, dynamic> json) {
  return _SubstanceResult.fromJson(json);
}

/// @nodoc
mixin _$SubstanceResult {
  int get substanceId => throw _privateConstructorUsedError;
  double get weight => throw _privateConstructorUsedError;
  double get cost => throw _privateConstructorUsedError;
  Map<Element, double> get elementContribution =>
      throw _privateConstructorUsedError;
  String? get concType => throw _privateConstructorUsedError;

  /// Serializes this SubstanceResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubstanceResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubstanceResultCopyWith<SubstanceResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubstanceResultCopyWith<$Res> {
  factory $SubstanceResultCopyWith(
    SubstanceResult value,
    $Res Function(SubstanceResult) then,
  ) = _$SubstanceResultCopyWithImpl<$Res, SubstanceResult>;
  @useResult
  $Res call({
    int substanceId,
    double weight,
    double cost,
    Map<Element, double> elementContribution,
    String? concType,
  });
}

/// @nodoc
class _$SubstanceResultCopyWithImpl<$Res, $Val extends SubstanceResult>
    implements $SubstanceResultCopyWith<$Res> {
  _$SubstanceResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubstanceResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? substanceId = null,
    Object? weight = null,
    Object? cost = null,
    Object? elementContribution = null,
    Object? concType = freezed,
  }) {
    return _then(
      _value.copyWith(
            substanceId: null == substanceId
                ? _value.substanceId
                : substanceId // ignore: cast_nullable_to_non_nullable
                      as int,
            weight: null == weight
                ? _value.weight
                : weight // ignore: cast_nullable_to_non_nullable
                      as double,
            cost: null == cost
                ? _value.cost
                : cost // ignore: cast_nullable_to_non_nullable
                      as double,
            elementContribution: null == elementContribution
                ? _value.elementContribution
                : elementContribution // ignore: cast_nullable_to_non_nullable
                      as Map<Element, double>,
            concType: freezed == concType
                ? _value.concType
                : concType // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SubstanceResultImplCopyWith<$Res>
    implements $SubstanceResultCopyWith<$Res> {
  factory _$$SubstanceResultImplCopyWith(
    _$SubstanceResultImpl value,
    $Res Function(_$SubstanceResultImpl) then,
  ) = __$$SubstanceResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int substanceId,
    double weight,
    double cost,
    Map<Element, double> elementContribution,
    String? concType,
  });
}

/// @nodoc
class __$$SubstanceResultImplCopyWithImpl<$Res>
    extends _$SubstanceResultCopyWithImpl<$Res, _$SubstanceResultImpl>
    implements _$$SubstanceResultImplCopyWith<$Res> {
  __$$SubstanceResultImplCopyWithImpl(
    _$SubstanceResultImpl _value,
    $Res Function(_$SubstanceResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SubstanceResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? substanceId = null,
    Object? weight = null,
    Object? cost = null,
    Object? elementContribution = null,
    Object? concType = freezed,
  }) {
    return _then(
      _$SubstanceResultImpl(
        substanceId: null == substanceId
            ? _value.substanceId
            : substanceId // ignore: cast_nullable_to_non_nullable
                  as int,
        weight: null == weight
            ? _value.weight
            : weight // ignore: cast_nullable_to_non_nullable
                  as double,
        cost: null == cost
            ? _value.cost
            : cost // ignore: cast_nullable_to_non_nullable
                  as double,
        elementContribution: null == elementContribution
            ? _value._elementContribution
            : elementContribution // ignore: cast_nullable_to_non_nullable
                  as Map<Element, double>,
        concType: freezed == concType
            ? _value.concType
            : concType // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SubstanceResultImpl implements _SubstanceResult {
  const _$SubstanceResultImpl({
    required this.substanceId,
    required this.weight,
    required this.cost,
    final Map<Element, double> elementContribution = const {},
    this.concType,
  }) : _elementContribution = elementContribution;

  factory _$SubstanceResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubstanceResultImplFromJson(json);

  @override
  final int substanceId;
  @override
  final double weight;
  @override
  final double cost;
  final Map<Element, double> _elementContribution;
  @override
  @JsonKey()
  Map<Element, double> get elementContribution {
    if (_elementContribution is EqualUnmodifiableMapView)
      return _elementContribution;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_elementContribution);
  }

  @override
  final String? concType;

  @override
  String toString() {
    return 'SubstanceResult(substanceId: $substanceId, weight: $weight, cost: $cost, elementContribution: $elementContribution, concType: $concType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubstanceResultImpl &&
            (identical(other.substanceId, substanceId) ||
                other.substanceId == substanceId) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            const DeepCollectionEquality().equals(
              other._elementContribution,
              _elementContribution,
            ) &&
            (identical(other.concType, concType) ||
                other.concType == concType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    substanceId,
    weight,
    cost,
    const DeepCollectionEquality().hash(_elementContribution),
    concType,
  );

  /// Create a copy of SubstanceResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubstanceResultImplCopyWith<_$SubstanceResultImpl> get copyWith =>
      __$$SubstanceResultImplCopyWithImpl<_$SubstanceResultImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SubstanceResultImplToJson(this);
  }
}

abstract class _SubstanceResult implements SubstanceResult {
  const factory _SubstanceResult({
    required final int substanceId,
    required final double weight,
    required final double cost,
    final Map<Element, double> elementContribution,
    final String? concType,
  }) = _$SubstanceResultImpl;

  factory _SubstanceResult.fromJson(Map<String, dynamic> json) =
      _$SubstanceResultImpl.fromJson;

  @override
  int get substanceId;
  @override
  double get weight;
  @override
  double get cost;
  @override
  Map<Element, double> get elementContribution;
  @override
  String? get concType;

  /// Create a copy of SubstanceResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubstanceResultImplCopyWith<_$SubstanceResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CalculationResult _$CalculationResultFromJson(Map<String, dynamic> json) {
  return _CalculationResult.fromJson(json);
}

/// @nodoc
mixin _$CalculationResult {
  List<SubstanceResult> get substances => throw _privateConstructorUsedError;
  Map<Element, double> get achievedConcentrations =>
      throw _privateConstructorUsedError;
  Map<Element, double> get targetConcentrations =>
      throw _privateConstructorUsedError;
  double get totalCost => throw _privateConstructorUsedError;
  double get predictedEc => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  Map<Element, double> get grossErrors => throw _privateConstructorUsedError;
  Map<Element, double> get instrumentalErrors =>
      throw _privateConstructorUsedError;
  List<String> get warnings => throw _privateConstructorUsedError;

  /// Serializes this CalculationResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CalculationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CalculationResultCopyWith<CalculationResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalculationResultCopyWith<$Res> {
  factory $CalculationResultCopyWith(
    CalculationResult value,
    $Res Function(CalculationResult) then,
  ) = _$CalculationResultCopyWithImpl<$Res, CalculationResult>;
  @useResult
  $Res call({
    List<SubstanceResult> substances,
    Map<Element, double> achievedConcentrations,
    Map<Element, double> targetConcentrations,
    double totalCost,
    double predictedEc,
    String? error,
    Map<Element, double> grossErrors,
    Map<Element, double> instrumentalErrors,
    List<String> warnings,
  });
}

/// @nodoc
class _$CalculationResultCopyWithImpl<$Res, $Val extends CalculationResult>
    implements $CalculationResultCopyWith<$Res> {
  _$CalculationResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CalculationResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? substances = null,
    Object? achievedConcentrations = null,
    Object? targetConcentrations = null,
    Object? totalCost = null,
    Object? predictedEc = null,
    Object? error = freezed,
    Object? grossErrors = null,
    Object? instrumentalErrors = null,
    Object? warnings = null,
  }) {
    return _then(
      _value.copyWith(
            substances: null == substances
                ? _value.substances
                : substances // ignore: cast_nullable_to_non_nullable
                      as List<SubstanceResult>,
            achievedConcentrations: null == achievedConcentrations
                ? _value.achievedConcentrations
                : achievedConcentrations // ignore: cast_nullable_to_non_nullable
                      as Map<Element, double>,
            targetConcentrations: null == targetConcentrations
                ? _value.targetConcentrations
                : targetConcentrations // ignore: cast_nullable_to_non_nullable
                      as Map<Element, double>,
            totalCost: null == totalCost
                ? _value.totalCost
                : totalCost // ignore: cast_nullable_to_non_nullable
                      as double,
            predictedEc: null == predictedEc
                ? _value.predictedEc
                : predictedEc // ignore: cast_nullable_to_non_nullable
                      as double,
            error: freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as String?,
            grossErrors: null == grossErrors
                ? _value.grossErrors
                : grossErrors // ignore: cast_nullable_to_non_nullable
                      as Map<Element, double>,
            instrumentalErrors: null == instrumentalErrors
                ? _value.instrumentalErrors
                : instrumentalErrors // ignore: cast_nullable_to_non_nullable
                      as Map<Element, double>,
            warnings: null == warnings
                ? _value.warnings
                : warnings // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CalculationResultImplCopyWith<$Res>
    implements $CalculationResultCopyWith<$Res> {
  factory _$$CalculationResultImplCopyWith(
    _$CalculationResultImpl value,
    $Res Function(_$CalculationResultImpl) then,
  ) = __$$CalculationResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<SubstanceResult> substances,
    Map<Element, double> achievedConcentrations,
    Map<Element, double> targetConcentrations,
    double totalCost,
    double predictedEc,
    String? error,
    Map<Element, double> grossErrors,
    Map<Element, double> instrumentalErrors,
    List<String> warnings,
  });
}

/// @nodoc
class __$$CalculationResultImplCopyWithImpl<$Res>
    extends _$CalculationResultCopyWithImpl<$Res, _$CalculationResultImpl>
    implements _$$CalculationResultImplCopyWith<$Res> {
  __$$CalculationResultImplCopyWithImpl(
    _$CalculationResultImpl _value,
    $Res Function(_$CalculationResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CalculationResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? substances = null,
    Object? achievedConcentrations = null,
    Object? targetConcentrations = null,
    Object? totalCost = null,
    Object? predictedEc = null,
    Object? error = freezed,
    Object? grossErrors = null,
    Object? instrumentalErrors = null,
    Object? warnings = null,
  }) {
    return _then(
      _$CalculationResultImpl(
        substances: null == substances
            ? _value._substances
            : substances // ignore: cast_nullable_to_non_nullable
                  as List<SubstanceResult>,
        achievedConcentrations: null == achievedConcentrations
            ? _value._achievedConcentrations
            : achievedConcentrations // ignore: cast_nullable_to_non_nullable
                  as Map<Element, double>,
        targetConcentrations: null == targetConcentrations
            ? _value._targetConcentrations
            : targetConcentrations // ignore: cast_nullable_to_non_nullable
                  as Map<Element, double>,
        totalCost: null == totalCost
            ? _value.totalCost
            : totalCost // ignore: cast_nullable_to_non_nullable
                  as double,
        predictedEc: null == predictedEc
            ? _value.predictedEc
            : predictedEc // ignore: cast_nullable_to_non_nullable
                  as double,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String?,
        grossErrors: null == grossErrors
            ? _value._grossErrors
            : grossErrors // ignore: cast_nullable_to_non_nullable
                  as Map<Element, double>,
        instrumentalErrors: null == instrumentalErrors
            ? _value._instrumentalErrors
            : instrumentalErrors // ignore: cast_nullable_to_non_nullable
                  as Map<Element, double>,
        warnings: null == warnings
            ? _value._warnings
            : warnings // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CalculationResultImpl implements _CalculationResult {
  const _$CalculationResultImpl({
    required final List<SubstanceResult> substances,
    required final Map<Element, double> achievedConcentrations,
    required final Map<Element, double> targetConcentrations,
    required this.totalCost,
    required this.predictedEc,
    this.error,
    final Map<Element, double> grossErrors = const {},
    final Map<Element, double> instrumentalErrors = const {},
    final List<String> warnings = const [],
  }) : _substances = substances,
       _achievedConcentrations = achievedConcentrations,
       _targetConcentrations = targetConcentrations,
       _grossErrors = grossErrors,
       _instrumentalErrors = instrumentalErrors,
       _warnings = warnings;

  factory _$CalculationResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$CalculationResultImplFromJson(json);

  final List<SubstanceResult> _substances;
  @override
  List<SubstanceResult> get substances {
    if (_substances is EqualUnmodifiableListView) return _substances;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_substances);
  }

  final Map<Element, double> _achievedConcentrations;
  @override
  Map<Element, double> get achievedConcentrations {
    if (_achievedConcentrations is EqualUnmodifiableMapView)
      return _achievedConcentrations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_achievedConcentrations);
  }

  final Map<Element, double> _targetConcentrations;
  @override
  Map<Element, double> get targetConcentrations {
    if (_targetConcentrations is EqualUnmodifiableMapView)
      return _targetConcentrations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_targetConcentrations);
  }

  @override
  final double totalCost;
  @override
  final double predictedEc;
  @override
  final String? error;
  final Map<Element, double> _grossErrors;
  @override
  @JsonKey()
  Map<Element, double> get grossErrors {
    if (_grossErrors is EqualUnmodifiableMapView) return _grossErrors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_grossErrors);
  }

  final Map<Element, double> _instrumentalErrors;
  @override
  @JsonKey()
  Map<Element, double> get instrumentalErrors {
    if (_instrumentalErrors is EqualUnmodifiableMapView)
      return _instrumentalErrors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_instrumentalErrors);
  }

  final List<String> _warnings;
  @override
  @JsonKey()
  List<String> get warnings {
    if (_warnings is EqualUnmodifiableListView) return _warnings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_warnings);
  }

  @override
  String toString() {
    return 'CalculationResult(substances: $substances, achievedConcentrations: $achievedConcentrations, targetConcentrations: $targetConcentrations, totalCost: $totalCost, predictedEc: $predictedEc, error: $error, grossErrors: $grossErrors, instrumentalErrors: $instrumentalErrors, warnings: $warnings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalculationResultImpl &&
            const DeepCollectionEquality().equals(
              other._substances,
              _substances,
            ) &&
            const DeepCollectionEquality().equals(
              other._achievedConcentrations,
              _achievedConcentrations,
            ) &&
            const DeepCollectionEquality().equals(
              other._targetConcentrations,
              _targetConcentrations,
            ) &&
            (identical(other.totalCost, totalCost) ||
                other.totalCost == totalCost) &&
            (identical(other.predictedEc, predictedEc) ||
                other.predictedEc == predictedEc) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(
              other._grossErrors,
              _grossErrors,
            ) &&
            const DeepCollectionEquality().equals(
              other._instrumentalErrors,
              _instrumentalErrors,
            ) &&
            const DeepCollectionEquality().equals(other._warnings, _warnings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_substances),
    const DeepCollectionEquality().hash(_achievedConcentrations),
    const DeepCollectionEquality().hash(_targetConcentrations),
    totalCost,
    predictedEc,
    error,
    const DeepCollectionEquality().hash(_grossErrors),
    const DeepCollectionEquality().hash(_instrumentalErrors),
    const DeepCollectionEquality().hash(_warnings),
  );

  /// Create a copy of CalculationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CalculationResultImplCopyWith<_$CalculationResultImpl> get copyWith =>
      __$$CalculationResultImplCopyWithImpl<_$CalculationResultImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CalculationResultImplToJson(this);
  }
}

abstract class _CalculationResult implements CalculationResult {
  const factory _CalculationResult({
    required final List<SubstanceResult> substances,
    required final Map<Element, double> achievedConcentrations,
    required final Map<Element, double> targetConcentrations,
    required final double totalCost,
    required final double predictedEc,
    final String? error,
    final Map<Element, double> grossErrors,
    final Map<Element, double> instrumentalErrors,
    final List<String> warnings,
  }) = _$CalculationResultImpl;

  factory _CalculationResult.fromJson(Map<String, dynamic> json) =
      _$CalculationResultImpl.fromJson;

  @override
  List<SubstanceResult> get substances;
  @override
  Map<Element, double> get achievedConcentrations;
  @override
  Map<Element, double> get targetConcentrations;
  @override
  double get totalCost;
  @override
  double get predictedEc;
  @override
  String? get error;
  @override
  Map<Element, double> get grossErrors;
  @override
  Map<Element, double> get instrumentalErrors;
  @override
  List<String> get warnings;

  /// Create a copy of CalculationResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CalculationResultImplCopyWith<_$CalculationResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
