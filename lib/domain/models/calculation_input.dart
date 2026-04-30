import 'package:freezed_annotation/freezed_annotation.dart';
import 'element.dart';

part 'calculation_input.freezed.dart';
part 'calculation_input.g.dart';

enum VolumeUnit { liter, gallon }

enum ConcUnit { ppm, mM, mN }

enum WeightUnit { gram, ounce }

enum CalcMode { directAddition, prepareStock }

enum SolutionMode { directAddition, prepareStock }

enum EcModel { lmcv2, empirical }

enum SiSource { si, sio2 }

@freezed
class CalculationInput with _$CalculationInput {
  const factory CalculationInput({
    required Map<Element, double> targets,
    required List<int> substanceIds,
    required double volume,
    @Default(VolumeUnit.liter) VolumeUnit volumeUnit,
    @Default(ConcUnit.ppm) ConcUnit concUnit,
    @Default(WeightUnit.gram) WeightUnit weightUnit,
    @Default(CalcMode.directAddition) CalcMode calcMode,
    Element? degreeOfFreedom,
    required double dilutionFactor,
  }) = _CalculationInput;

  factory CalculationInput.fromJson(Map<String, dynamic> json) =>
      _$CalculationInputFromJson(json);
}
