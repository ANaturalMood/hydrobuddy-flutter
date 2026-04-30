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
}
