import 'package:freezed_annotation/freezed_annotation.dart';

part 'calculation_result.freezed.dart';
part 'calculation_result.g.dart';

@freezed
class SubstanceResult with _$SubstanceResult {
  const factory SubstanceResult({
    required int substanceId,
    required double weight,
    required double cost,
    @Default({}) Map<String, double> elementContribution,
  }) = _SubstanceResult;

  factory SubstanceResult.fromJson(Map<String, dynamic> json) =>
      _$SubstanceResultFromJson(json);
}

@freezed
class CalculationResult with _$CalculationResult {
  const factory CalculationResult({
    required List<SubstanceResult> substances,
    required Map<String, double> achievedConcentrations,
    required Map<String, double> targetConcentrations,
    required double totalCost,
    required double predictedEc,
    String? error,
  }) = _CalculationResult;

  factory CalculationResult.fromJson(Map<String, dynamic> json) =>
      _$CalculationResultFromJson(json);
}
