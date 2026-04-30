// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculation_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubstanceResultImpl _$$SubstanceResultImplFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(r'_$SubstanceResultImpl', json, ($checkedConvert) {
  final val = _$SubstanceResultImpl(
    substanceId: $checkedConvert('substanceId', (v) => (v as num).toInt()),
    weight: $checkedConvert('weight', (v) => (v as num).toDouble()),
    cost: $checkedConvert('cost', (v) => (v as num).toDouble()),
    elementContribution: $checkedConvert(
      'elementContribution',
      (v) =>
          (v as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
              $enumDecode(_$ElementEnumMap, k),
              (e as num).toDouble(),
            ),
          ) ??
          const {},
    ),
    concType: $checkedConvert('concType', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$$SubstanceResultImplToJson(
  _$SubstanceResultImpl instance,
) => <String, dynamic>{
  'substanceId': instance.substanceId,
  'weight': instance.weight,
  'cost': instance.cost,
  'elementContribution': instance.elementContribution.map(
    (k, e) => MapEntry(_$ElementEnumMap[k]!, e),
  ),
  'concType': instance.concType,
};

const _$ElementEnumMap = {
  Element.nNo3: 'nNo3',
  Element.nNh4: 'nNh4',
  Element.p: 'p',
  Element.k: 'k',
  Element.ca: 'ca',
  Element.mg: 'mg',
  Element.s: 's',
  Element.fe: 'fe',
  Element.mn: 'mn',
  Element.zn: 'zn',
  Element.b: 'b',
  Element.cu: 'cu',
  Element.si: 'si',
  Element.mo: 'mo',
  Element.na: 'na',
  Element.cl: 'cl',
};

_$CalculationResultImpl _$$CalculationResultImplFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(r'_$CalculationResultImpl', json, ($checkedConvert) {
  final val = _$CalculationResultImpl(
    substances: $checkedConvert(
      'substances',
      (v) => (v as List<dynamic>)
          .map((e) => SubstanceResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    achievedConcentrations: $checkedConvert(
      'achievedConcentrations',
      (v) => (v as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry($enumDecode(_$ElementEnumMap, k), (e as num).toDouble()),
      ),
    ),
    targetConcentrations: $checkedConvert(
      'targetConcentrations',
      (v) => (v as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry($enumDecode(_$ElementEnumMap, k), (e as num).toDouble()),
      ),
    ),
    totalCost: $checkedConvert('totalCost', (v) => (v as num).toDouble()),
    predictedEc: $checkedConvert('predictedEc', (v) => (v as num).toDouble()),
    error: $checkedConvert('error', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$$CalculationResultImplToJson(
  _$CalculationResultImpl instance,
) => <String, dynamic>{
  'substances': instance.substances,
  'achievedConcentrations': instance.achievedConcentrations.map(
    (k, e) => MapEntry(_$ElementEnumMap[k]!, e),
  ),
  'targetConcentrations': instance.targetConcentrations.map(
    (k, e) => MapEntry(_$ElementEnumMap[k]!, e),
  ),
  'totalCost': instance.totalCost,
  'predictedEc': instance.predictedEc,
  'error': instance.error,
};
