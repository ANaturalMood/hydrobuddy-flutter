// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculation_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CalculationInputImpl _$$CalculationInputImplFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(r'_$CalculationInputImpl', json, ($checkedConvert) {
  final val = _$CalculationInputImpl(
    targets: $checkedConvert(
      'targets',
      (v) => (v as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
    ),
    substanceIds: $checkedConvert(
      'substanceIds',
      (v) => (v as List<dynamic>).map((e) => (e as num).toInt()).toList(),
    ),
    volume: $checkedConvert('volume', (v) => (v as num).toDouble()),
    volumeUnit: $checkedConvert(
      'volumeUnit',
      (v) => $enumDecodeNullable(_$VolumeUnitEnumMap, v) ?? VolumeUnit.liter,
    ),
    concUnit: $checkedConvert(
      'concUnit',
      (v) => $enumDecodeNullable(_$ConcUnitEnumMap, v) ?? ConcUnit.ppm,
    ),
    weightUnit: $checkedConvert(
      'weightUnit',
      (v) => $enumDecodeNullable(_$WeightUnitEnumMap, v) ?? WeightUnit.gram,
    ),
    calcMode: $checkedConvert(
      'calcMode',
      (v) =>
          $enumDecodeNullable(_$CalcModeEnumMap, v) ?? CalcMode.directAddition,
    ),
    degreeOfFreedom: $checkedConvert(
      'degreeOfFreedom',
      (v) => (v as num?)?.toInt(),
    ),
    dilutionFactor: $checkedConvert(
      'dilutionFactor',
      (v) => (v as num).toDouble(),
    ),
  );
  return val;
});

Map<String, dynamic> _$$CalculationInputImplToJson(
  _$CalculationInputImpl instance,
) => <String, dynamic>{
  'targets': instance.targets,
  'substanceIds': instance.substanceIds,
  'volume': instance.volume,
  'volumeUnit': _$VolumeUnitEnumMap[instance.volumeUnit]!,
  'concUnit': _$ConcUnitEnumMap[instance.concUnit]!,
  'weightUnit': _$WeightUnitEnumMap[instance.weightUnit]!,
  'calcMode': _$CalcModeEnumMap[instance.calcMode]!,
  'degreeOfFreedom': instance.degreeOfFreedom,
  'dilutionFactor': instance.dilutionFactor,
};

const _$VolumeUnitEnumMap = {
  VolumeUnit.liter: 'liter',
  VolumeUnit.gallon: 'gallon',
};

const _$ConcUnitEnumMap = {
  ConcUnit.ppm: 'ppm',
  ConcUnit.mM: 'mM',
  ConcUnit.mN: 'mN',
};

const _$WeightUnitEnumMap = {
  WeightUnit.gram: 'gram',
  WeightUnit.ounce: 'ounce',
};

const _$CalcModeEnumMap = {
  CalcMode.directAddition: 'directAddition',
  CalcMode.prepareStock: 'prepareStock',
};
