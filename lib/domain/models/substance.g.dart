// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'substance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubstanceImpl _$$SubstanceImplFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(r'_$SubstanceImpl', json, ($checkedConvert) {
  final val = _$SubstanceImpl(
    id: $checkedConvert('id', (v) => (v as num).toInt()),
    name: $checkedConvert('name', (v) => v as String),
    formula: $checkedConvert('formula', (v) => v as String?),
    source: $checkedConvert('source', (v) => v as String?),
    purity: $checkedConvert('purity', (v) => (v as num?)?.toDouble() ?? 1.0),
    cost: $checkedConvert('cost', (v) => (v as num?)?.toDouble() ?? 0.0),
    isLiquid: $checkedConvert('isLiquid', (v) => v as bool? ?? false),
    density: $checkedConvert('density', (v) => (v as num?)?.toDouble() ?? 1.0),
    concType: $checkedConvert('concType', (v) => v as String?),
    nNo3: $checkedConvert('nNo3', (v) => (v as num?)?.toDouble() ?? 0.0),
    nNh4: $checkedConvert('nNh4', (v) => (v as num?)?.toDouble() ?? 0.0),
    p: $checkedConvert('p', (v) => (v as num?)?.toDouble() ?? 0.0),
    k: $checkedConvert('k', (v) => (v as num?)?.toDouble() ?? 0.0),
    ca: $checkedConvert('ca', (v) => (v as num?)?.toDouble() ?? 0.0),
    mg: $checkedConvert('mg', (v) => (v as num?)?.toDouble() ?? 0.0),
    s: $checkedConvert('s', (v) => (v as num?)?.toDouble() ?? 0.0),
    fe: $checkedConvert('fe', (v) => (v as num?)?.toDouble() ?? 0.0),
    mn: $checkedConvert('mn', (v) => (v as num?)?.toDouble() ?? 0.0),
    zn: $checkedConvert('zn', (v) => (v as num?)?.toDouble() ?? 0.0),
    b: $checkedConvert('b', (v) => (v as num?)?.toDouble() ?? 0.0),
    cu: $checkedConvert('cu', (v) => (v as num?)?.toDouble() ?? 0.0),
    si: $checkedConvert('si', (v) => (v as num?)?.toDouble() ?? 0.0),
    mo: $checkedConvert('mo', (v) => (v as num?)?.toDouble() ?? 0.0),
    na: $checkedConvert('na', (v) => (v as num?)?.toDouble() ?? 0.0),
    cl: $checkedConvert('cl', (v) => (v as num?)?.toDouble() ?? 0.0),
  );
  return val;
});

Map<String, dynamic> _$$SubstanceImplToJson(_$SubstanceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'formula': instance.formula,
      'source': instance.source,
      'purity': instance.purity,
      'cost': instance.cost,
      'isLiquid': instance.isLiquid,
      'density': instance.density,
      'concType': instance.concType,
      'nNo3': instance.nNo3,
      'nNh4': instance.nNh4,
      'p': instance.p,
      'k': instance.k,
      'ca': instance.ca,
      'mg': instance.mg,
      's': instance.s,
      'fe': instance.fe,
      'mn': instance.mn,
      'zn': instance.zn,
      'b': instance.b,
      'cu': instance.cu,
      'si': instance.si,
      'mo': instance.mo,
      'na': instance.na,
      'cl': instance.cl,
    };
