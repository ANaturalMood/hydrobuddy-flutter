import 'package:freezed_annotation/freezed_annotation.dart';

part 'formulation.freezed.dart';
part 'formulation.g.dart';

@freezed
class Formulation with _$Formulation {
  const factory Formulation({
    required int id,
    required String name,
    String? description,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(0.0) double nNo3,
    @Default(0.0) double nNh4,
    @Default(0.0) double p,
    @Default(0.0) double k,
    @Default(0.0) double ca,
    @Default(0.0) double mg,
    @Default(0.0) double s,
    @Default(0.0) double fe,
    @Default(0.0) double mn,
    @Default(0.0) double zn,
    @Default(0.0) double b,
    @Default(0.0) double cu,
    @Default(0.0) double si,
    @Default(0.0) double mo,
    @Default(0.0) double na,
    @Default(0.0) double cl,
    required String volumeUnit,
    required String concUnit,
  }) = _Formulation;

  factory Formulation.fromJson(Map<String, dynamic> json) =>
      _$FormulationFromJson(json);
}
