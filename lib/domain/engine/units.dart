class UnitConverter {
  static double literToGallon(double liters) => liters * 0.264172;
  static double gallonToLiter(double gallons) => gallons / 0.264172;
  static double literToCubicMeter(double liters) => liters / 1000;

  static double ppmFromWeight(double weightGrams, double elementPercent, double volumeLiters) {
    return (weightGrams * (elementPercent / 100.0) * 1000.0) / volumeLiters;
  }

  static double ppmToMm(double ppm, double molarMass) => ppm / molarMass;
  static double mmToPpm(double mm, double molarMass) => mm * molarMass;

  static double mmToMn(double mm, int charge) => mm * charge;
  static double mnToMm(double mn, int charge) => mn / charge;

  static double gramToOunce(double grams) => grams * 0.035274;
  static double ounceToGram(double ounces) => ounces / 0.035274;

  static double k2oToK(double k2o) => k2o * 0.8301;
  static double p2o5ToP(double p2o5) => p2o5 * 0.4364;
  static double kToK2o(double k) => k / 0.8301;
  static double pToP2o5(double p) => p / 0.4364;

  static double siToSio2(double si) => si / 0.4684;
  static double sio2ToSi(double sio2) => sio2 * 0.4684;
}
