/// Enum com os 16 nutrientes essenciais para hidroponia.
enum Element {
  nNo3('N-NO3', 'Nitrate Nitrogen'),
  nNh4('N-NH4', 'Ammonium Nitrogen'),
  p('P', 'Phosphorus'),
  k('K', 'Potassium'),
  ca('Ca', 'Calcium'),
  mg('Mg', 'Magnesium'),
  s('S', 'Sulfur'),
  fe('Fe', 'Iron'),
  mn('Mn', 'Manganese'),
  zn('Zn', 'Zinc'),
  b('B', 'Boron'),
  cu('Cu', 'Copper'),
  si('Si', 'Silicon'),
  mo('Mo', 'Molybdenum'),
  na('Na', 'Sodium'),
  cl('Cl', 'Chlorine');

  final String symbol;
  final String displayName;

  const Element(this.symbol, this.displayName);

  /// Retorna todos os valores do enum.
  static List<Element> get all => values;
}
