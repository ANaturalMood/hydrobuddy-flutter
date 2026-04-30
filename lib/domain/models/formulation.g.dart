// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'formulation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FormulationImpl _$$FormulationImplFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(r'_$FormulationImpl', json, ($checkedConvert) {
  final val = _$FormulationImpl(
    id: $checkedConvert('id', (v) => (v as num).toInt()),
    name: $checkedConvert('name', (v) => v as String),
    description: $checkedConvert('description', (v) => v as String?),
    createdAt: $checkedConvert('createdAt', (v) => DateTime.parse(v as String)),
    updatedAt: $checkedConvert('updatedAt', (v) => DateTime.parse(v as String)),
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
    volumeUnit: $checkedConvert('volumeUnit', (v) => v as String),
    concUnit: $checkedConvert('concUnit', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$$FormulationImplToJson(_$FormulationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
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
      'volumeUnit': instance.volumeUnit,
      'concUnit': instance.concUnit,
    };
