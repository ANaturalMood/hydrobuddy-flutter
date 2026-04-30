import 'package:freezed_annotation/freezed_annotation.dart';
import 'element.dart';

part 'substance.freezed.dart';
part 'substance.g.dart';

@freezed
class Substance with _$Substance {
  const factory Substance({
    required int id,
    required String name,
    String? formula,
    String? source,
    @Default(1.0) double purity,
    @Default(0.0) double cost,
    @Default(false) bool isLiquid,
    @Default(1.0) double density,
    String? concType,
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
  }) = _Substance;

  const Substance._();

  factory Substance.fromJson(Map<String, dynamic> json) =>
      _$SubstanceFromJson(json);

  double getN(Element element) {
    switch (element) {
      case Element.nNo3:
        return nNo3;
      case Element.nNh4:
        return nNh4;
      case Element.p:
        return p;
      case Element.k:
        return k;
      case Element.ca:
        return ca;
      case Element.mg:
        return mg;
      case Element.s:
        return s;
      case Element.fe:
        return fe;
      case Element.mn:
        return mn;
      case Element.zn:
        return zn;
      case Element.b:
        return b;
      case Element.cu:
        return cu;
      case Element.si:
        return si;
      case Element.mo:
        return mo;
      case Element.na:
        return na;
      case Element.cl:
        return cl;
    }
  }
}
