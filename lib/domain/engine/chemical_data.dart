class ChemicalData {
  static const Map<String, double> molarMass = {
    'N': 14.007,
    'P': 30.974,
    'K': 39.098,
    'Ca': 40.078,
    'Mg': 24.305,
    'S': 32.065,
    'Fe': 55.845,
    'Mn': 54.938,
    'Zn': 65.38,
    'B': 10.811,
    'Cu': 63.546,
    'Si': 28.086,
    'Mo': 95.95,
    'Na': 22.990,
    'Cl': 35.453,
  };

  static const Map<String, int> ionicCharge = {
    'N-NO3': 1,
    'N-NH4': 1,
    'P': 1,
    'K': 1,
    'Ca': 2,
    'Mg': 2,
    'S': 2,
    'Fe': 2,
    'Mn': 2,
    'Zn': 2,
    'B': 1,
    'Cu': 2,
    'Si': 1,
    'Mo': 2,
    'Na': 1,
    'Cl': 1,
  };

  static const Map<String, double> compoundMolarMass = {
    'KNO3': 101.103,
    'Ca(NO3)2': 164.088,
    'NH4NO3': 80.043,
    'NH4H2PO4': 115.026,
    'KH2PO4': 136.086,
    'K2SO4': 174.259,
    'MgSO4': 120.366,
    'MgSO4·7H2O': 246.475,
    'CaCl2': 110.984,
    'NaCl': 58.443,
    'H3BO3': 61.833,
    'C10H12N2NaFeO8': 367.05,
    'MnSO4·H2O': 169.016,
    'ZnSO4·7H2O': 287.540,
    'CuSO4·5H2O': 249.685,
    'Na2MoO4·2H2O': 241.948,
    'Na2SiO3': 122.063,
  };

  static double getMolarMass(String symbol) => molarMass[symbol] ?? 0.0;

  static int getIonicCharge(String symbol) => ionicCharge[symbol] ?? 1;
}
