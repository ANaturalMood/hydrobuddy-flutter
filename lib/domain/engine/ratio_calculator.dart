import 'package:hydrobuddy/domain/models/element.dart';

class RatioCalculator {
  static Map<String, double> npk(Map<Element, double> ppm) {
    final n = (ppm[Element.nNo3] ?? 0.0) + (ppm[Element.nNh4] ?? 0.0);
    final p = ppm[Element.p] ?? 0.0;
    final k = ppm[Element.k] ?? 0.0;

    if (p <= 0 && k <= 0 && n <= 0) return {'N': 0, 'P': 0, 'K': 0};

    final minVal = [n, p, k].where((v) => v > 0).reduce((a, b) => a < b ? a : b);
    return {
      'N': minVal > 0 ? n / minVal : 0,
      'P': minVal > 0 ? p / minVal : 0,
      'K': minVal > 0 ? k / minVal : 0,
    };
  }

  static double caToMg(Map<Element, double> ppm) {
    final ca = ppm[Element.ca] ?? 0.0;
    final mg = ppm[Element.mg] ?? 0.0;
    return mg > 0 ? ca / mg : double.infinity;
  }

  static Map<String, double> kCaMg(Map<Element, double> ppm) {
    final k = ppm[Element.k] ?? 0.0;
    final ca = ppm[Element.ca] ?? 0.0;
    final mg = ppm[Element.mg] ?? 0.0;
    final minVal = [k, ca, mg].where((v) => v > 0).reduce((a, b) => a < b ? a : b);
    return {
      'K': minVal > 0 ? k / minVal : 0,
      'Ca': minVal > 0 ? ca / minVal : 0,
      'Mg': minVal > 0 ? mg / minVal : 0,
    };
  }

  static double nToS(Map<Element, double> ppm) {
    final n = (ppm[Element.nNo3] ?? 0.0) + (ppm[Element.nNh4] ?? 0.0);
    final s = ppm[Element.s] ?? 0.0;
    return s > 0 ? n / s : double.infinity;
  }

  static Map<String, double> all(Map<Element, double> ppm) {
    return {
      ...npk(ppm).map((k, v) => MapEntry('NPK_$k', v)),
      'Ca:Mg': caToMg(ppm),
      'N:S': nToS(ppm),
    };
  }
}
