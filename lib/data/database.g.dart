// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $SubstancesTable extends Substances
    with TableInfo<$SubstancesTable, Substance> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SubstancesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _formulaMeta = const VerificationMeta(
    'formula',
  );
  @override
  late final GeneratedColumn<String> formula = GeneratedColumn<String>(
    'formula',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _purityMeta = const VerificationMeta('purity');
  @override
  late final GeneratedColumn<double> purity = GeneratedColumn<double>(
    'purity',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(1.0),
  );
  static const VerificationMeta _costMeta = const VerificationMeta('cost');
  @override
  late final GeneratedColumn<double> cost = GeneratedColumn<double>(
    'cost',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _is_liquidMeta = const VerificationMeta(
    'is_liquid',
  );
  @override
  late final GeneratedColumn<bool> is_liquid = GeneratedColumn<bool>(
    'is_liquid',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_liquid" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _densityMeta = const VerificationMeta(
    'density',
  );
  @override
  late final GeneratedColumn<double> density = GeneratedColumn<double>(
    'density',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(1.0),
  );
  static const VerificationMeta _conc_typeMeta = const VerificationMeta(
    'conc_type',
  );
  @override
  late final GeneratedColumn<String> conc_type = GeneratedColumn<String>(
    'conc_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _n_no3Meta = const VerificationMeta('n_no3');
  @override
  late final GeneratedColumn<double> n_no3 = GeneratedColumn<double>(
    'n_no3',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _n_nh4Meta = const VerificationMeta('n_nh4');
  @override
  late final GeneratedColumn<double> n_nh4 = GeneratedColumn<double>(
    'n_nh4',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _pMeta = const VerificationMeta('p');
  @override
  late final GeneratedColumn<double> p = GeneratedColumn<double>(
    'p',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _kMeta = const VerificationMeta('k');
  @override
  late final GeneratedColumn<double> k = GeneratedColumn<double>(
    'k',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _caMeta = const VerificationMeta('ca');
  @override
  late final GeneratedColumn<double> ca = GeneratedColumn<double>(
    'ca',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _mgMeta = const VerificationMeta('mg');
  @override
  late final GeneratedColumn<double> mg = GeneratedColumn<double>(
    'mg',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _sMeta = const VerificationMeta('s');
  @override
  late final GeneratedColumn<double> s = GeneratedColumn<double>(
    's',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _feMeta = const VerificationMeta('fe');
  @override
  late final GeneratedColumn<double> fe = GeneratedColumn<double>(
    'fe',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _mnMeta = const VerificationMeta('mn');
  @override
  late final GeneratedColumn<double> mn = GeneratedColumn<double>(
    'mn',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _znMeta = const VerificationMeta('zn');
  @override
  late final GeneratedColumn<double> zn = GeneratedColumn<double>(
    'zn',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _bMeta = const VerificationMeta('b');
  @override
  late final GeneratedColumn<double> b = GeneratedColumn<double>(
    'b',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _cuMeta = const VerificationMeta('cu');
  @override
  late final GeneratedColumn<double> cu = GeneratedColumn<double>(
    'cu',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _siMeta = const VerificationMeta('si');
  @override
  late final GeneratedColumn<double> si = GeneratedColumn<double>(
    'si',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _moMeta = const VerificationMeta('mo');
  @override
  late final GeneratedColumn<double> mo = GeneratedColumn<double>(
    'mo',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _naMeta = const VerificationMeta('na');
  @override
  late final GeneratedColumn<double> na = GeneratedColumn<double>(
    'na',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _clMeta = const VerificationMeta('cl');
  @override
  late final GeneratedColumn<double> cl = GeneratedColumn<double>(
    'cl',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    formula,
    source,
    purity,
    cost,
    is_liquid,
    density,
    conc_type,
    n_no3,
    n_nh4,
    p,
    k,
    ca,
    mg,
    s,
    fe,
    mn,
    zn,
    b,
    cu,
    si,
    mo,
    na,
    cl,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'substances';
  @override
  VerificationContext validateIntegrity(
    Insertable<Substance> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('formula')) {
      context.handle(
        _formulaMeta,
        formula.isAcceptableOrUnknown(data['formula']!, _formulaMeta),
      );
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    }
    if (data.containsKey('purity')) {
      context.handle(
        _purityMeta,
        purity.isAcceptableOrUnknown(data['purity']!, _purityMeta),
      );
    }
    if (data.containsKey('cost')) {
      context.handle(
        _costMeta,
        cost.isAcceptableOrUnknown(data['cost']!, _costMeta),
      );
    }
    if (data.containsKey('is_liquid')) {
      context.handle(
        _is_liquidMeta,
        is_liquid.isAcceptableOrUnknown(data['is_liquid']!, _is_liquidMeta),
      );
    }
    if (data.containsKey('density')) {
      context.handle(
        _densityMeta,
        density.isAcceptableOrUnknown(data['density']!, _densityMeta),
      );
    }
    if (data.containsKey('conc_type')) {
      context.handle(
        _conc_typeMeta,
        conc_type.isAcceptableOrUnknown(data['conc_type']!, _conc_typeMeta),
      );
    }
    if (data.containsKey('n_no3')) {
      context.handle(
        _n_no3Meta,
        n_no3.isAcceptableOrUnknown(data['n_no3']!, _n_no3Meta),
      );
    }
    if (data.containsKey('n_nh4')) {
      context.handle(
        _n_nh4Meta,
        n_nh4.isAcceptableOrUnknown(data['n_nh4']!, _n_nh4Meta),
      );
    }
    if (data.containsKey('p')) {
      context.handle(_pMeta, p.isAcceptableOrUnknown(data['p']!, _pMeta));
    }
    if (data.containsKey('k')) {
      context.handle(_kMeta, k.isAcceptableOrUnknown(data['k']!, _kMeta));
    }
    if (data.containsKey('ca')) {
      context.handle(_caMeta, ca.isAcceptableOrUnknown(data['ca']!, _caMeta));
    }
    if (data.containsKey('mg')) {
      context.handle(_mgMeta, mg.isAcceptableOrUnknown(data['mg']!, _mgMeta));
    }
    if (data.containsKey('s')) {
      context.handle(_sMeta, s.isAcceptableOrUnknown(data['s']!, _sMeta));
    }
    if (data.containsKey('fe')) {
      context.handle(_feMeta, fe.isAcceptableOrUnknown(data['fe']!, _feMeta));
    }
    if (data.containsKey('mn')) {
      context.handle(_mnMeta, mn.isAcceptableOrUnknown(data['mn']!, _mnMeta));
    }
    if (data.containsKey('zn')) {
      context.handle(_znMeta, zn.isAcceptableOrUnknown(data['zn']!, _znMeta));
    }
    if (data.containsKey('b')) {
      context.handle(_bMeta, b.isAcceptableOrUnknown(data['b']!, _bMeta));
    }
    if (data.containsKey('cu')) {
      context.handle(_cuMeta, cu.isAcceptableOrUnknown(data['cu']!, _cuMeta));
    }
    if (data.containsKey('si')) {
      context.handle(_siMeta, si.isAcceptableOrUnknown(data['si']!, _siMeta));
    }
    if (data.containsKey('mo')) {
      context.handle(_moMeta, mo.isAcceptableOrUnknown(data['mo']!, _moMeta));
    }
    if (data.containsKey('na')) {
      context.handle(_naMeta, na.isAcceptableOrUnknown(data['na']!, _naMeta));
    }
    if (data.containsKey('cl')) {
      context.handle(_clMeta, cl.isAcceptableOrUnknown(data['cl']!, _clMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Substance map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Substance(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      formula: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}formula'],
      ),
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      ),
      purity: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}purity'],
      )!,
      cost: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}cost'],
      )!,
      is_liquid: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_liquid'],
      )!,
      density: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}density'],
      )!,
      conc_type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}conc_type'],
      ),
      n_no3: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}n_no3'],
      )!,
      n_nh4: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}n_nh4'],
      )!,
      p: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}p'],
      )!,
      k: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}k'],
      )!,
      ca: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}ca'],
      )!,
      mg: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}mg'],
      )!,
      s: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}s'],
      )!,
      fe: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}fe'],
      )!,
      mn: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}mn'],
      )!,
      zn: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}zn'],
      )!,
      b: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}b'],
      )!,
      cu: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}cu'],
      )!,
      si: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}si'],
      )!,
      mo: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}mo'],
      )!,
      na: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}na'],
      )!,
      cl: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}cl'],
      )!,
    );
  }

  @override
  $SubstancesTable createAlias(String alias) {
    return $SubstancesTable(attachedDatabase, alias);
  }
}

class Substance extends DataClass implements Insertable<Substance> {
  final int id;
  final String name;
  final String? formula;
  final String? source;
  final double purity;
  final double cost;
  final bool is_liquid;
  final double density;
  final String? conc_type;
  final double n_no3;
  final double n_nh4;
  final double p;
  final double k;
  final double ca;
  final double mg;
  final double s;
  final double fe;
  final double mn;
  final double zn;
  final double b;
  final double cu;
  final double si;
  final double mo;
  final double na;
  final double cl;
  const Substance({
    required this.id,
    required this.name,
    this.formula,
    this.source,
    required this.purity,
    required this.cost,
    required this.is_liquid,
    required this.density,
    this.conc_type,
    required this.n_no3,
    required this.n_nh4,
    required this.p,
    required this.k,
    required this.ca,
    required this.mg,
    required this.s,
    required this.fe,
    required this.mn,
    required this.zn,
    required this.b,
    required this.cu,
    required this.si,
    required this.mo,
    required this.na,
    required this.cl,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || formula != null) {
      map['formula'] = Variable<String>(formula);
    }
    if (!nullToAbsent || source != null) {
      map['source'] = Variable<String>(source);
    }
    map['purity'] = Variable<double>(purity);
    map['cost'] = Variable<double>(cost);
    map['is_liquid'] = Variable<bool>(is_liquid);
    map['density'] = Variable<double>(density);
    if (!nullToAbsent || conc_type != null) {
      map['conc_type'] = Variable<String>(conc_type);
    }
    map['n_no3'] = Variable<double>(n_no3);
    map['n_nh4'] = Variable<double>(n_nh4);
    map['p'] = Variable<double>(p);
    map['k'] = Variable<double>(k);
    map['ca'] = Variable<double>(ca);
    map['mg'] = Variable<double>(mg);
    map['s'] = Variable<double>(s);
    map['fe'] = Variable<double>(fe);
    map['mn'] = Variable<double>(mn);
    map['zn'] = Variable<double>(zn);
    map['b'] = Variable<double>(b);
    map['cu'] = Variable<double>(cu);
    map['si'] = Variable<double>(si);
    map['mo'] = Variable<double>(mo);
    map['na'] = Variable<double>(na);
    map['cl'] = Variable<double>(cl);
    return map;
  }

  SubstancesCompanion toCompanion(bool nullToAbsent) {
    return SubstancesCompanion(
      id: Value(id),
      name: Value(name),
      formula: formula == null && nullToAbsent
          ? const Value.absent()
          : Value(formula),
      source: source == null && nullToAbsent
          ? const Value.absent()
          : Value(source),
      purity: Value(purity),
      cost: Value(cost),
      is_liquid: Value(is_liquid),
      density: Value(density),
      conc_type: conc_type == null && nullToAbsent
          ? const Value.absent()
          : Value(conc_type),
      n_no3: Value(n_no3),
      n_nh4: Value(n_nh4),
      p: Value(p),
      k: Value(k),
      ca: Value(ca),
      mg: Value(mg),
      s: Value(s),
      fe: Value(fe),
      mn: Value(mn),
      zn: Value(zn),
      b: Value(b),
      cu: Value(cu),
      si: Value(si),
      mo: Value(mo),
      na: Value(na),
      cl: Value(cl),
    );
  }

  factory Substance.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Substance(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      formula: serializer.fromJson<String?>(json['formula']),
      source: serializer.fromJson<String?>(json['source']),
      purity: serializer.fromJson<double>(json['purity']),
      cost: serializer.fromJson<double>(json['cost']),
      is_liquid: serializer.fromJson<bool>(json['is_liquid']),
      density: serializer.fromJson<double>(json['density']),
      conc_type: serializer.fromJson<String?>(json['conc_type']),
      n_no3: serializer.fromJson<double>(json['n_no3']),
      n_nh4: serializer.fromJson<double>(json['n_nh4']),
      p: serializer.fromJson<double>(json['p']),
      k: serializer.fromJson<double>(json['k']),
      ca: serializer.fromJson<double>(json['ca']),
      mg: serializer.fromJson<double>(json['mg']),
      s: serializer.fromJson<double>(json['s']),
      fe: serializer.fromJson<double>(json['fe']),
      mn: serializer.fromJson<double>(json['mn']),
      zn: serializer.fromJson<double>(json['zn']),
      b: serializer.fromJson<double>(json['b']),
      cu: serializer.fromJson<double>(json['cu']),
      si: serializer.fromJson<double>(json['si']),
      mo: serializer.fromJson<double>(json['mo']),
      na: serializer.fromJson<double>(json['na']),
      cl: serializer.fromJson<double>(json['cl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'formula': serializer.toJson<String?>(formula),
      'source': serializer.toJson<String?>(source),
      'purity': serializer.toJson<double>(purity),
      'cost': serializer.toJson<double>(cost),
      'is_liquid': serializer.toJson<bool>(is_liquid),
      'density': serializer.toJson<double>(density),
      'conc_type': serializer.toJson<String?>(conc_type),
      'n_no3': serializer.toJson<double>(n_no3),
      'n_nh4': serializer.toJson<double>(n_nh4),
      'p': serializer.toJson<double>(p),
      'k': serializer.toJson<double>(k),
      'ca': serializer.toJson<double>(ca),
      'mg': serializer.toJson<double>(mg),
      's': serializer.toJson<double>(s),
      'fe': serializer.toJson<double>(fe),
      'mn': serializer.toJson<double>(mn),
      'zn': serializer.toJson<double>(zn),
      'b': serializer.toJson<double>(b),
      'cu': serializer.toJson<double>(cu),
      'si': serializer.toJson<double>(si),
      'mo': serializer.toJson<double>(mo),
      'na': serializer.toJson<double>(na),
      'cl': serializer.toJson<double>(cl),
    };
  }

  Substance copyWith({
    int? id,
    String? name,
    Value<String?> formula = const Value.absent(),
    Value<String?> source = const Value.absent(),
    double? purity,
    double? cost,
    bool? is_liquid,
    double? density,
    Value<String?> conc_type = const Value.absent(),
    double? n_no3,
    double? n_nh4,
    double? p,
    double? k,
    double? ca,
    double? mg,
    double? s,
    double? fe,
    double? mn,
    double? zn,
    double? b,
    double? cu,
    double? si,
    double? mo,
    double? na,
    double? cl,
  }) => Substance(
    id: id ?? this.id,
    name: name ?? this.name,
    formula: formula.present ? formula.value : this.formula,
    source: source.present ? source.value : this.source,
    purity: purity ?? this.purity,
    cost: cost ?? this.cost,
    is_liquid: is_liquid ?? this.is_liquid,
    density: density ?? this.density,
    conc_type: conc_type.present ? conc_type.value : this.conc_type,
    n_no3: n_no3 ?? this.n_no3,
    n_nh4: n_nh4 ?? this.n_nh4,
    p: p ?? this.p,
    k: k ?? this.k,
    ca: ca ?? this.ca,
    mg: mg ?? this.mg,
    s: s ?? this.s,
    fe: fe ?? this.fe,
    mn: mn ?? this.mn,
    zn: zn ?? this.zn,
    b: b ?? this.b,
    cu: cu ?? this.cu,
    si: si ?? this.si,
    mo: mo ?? this.mo,
    na: na ?? this.na,
    cl: cl ?? this.cl,
  );
  Substance copyWithCompanion(SubstancesCompanion data) {
    return Substance(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      formula: data.formula.present ? data.formula.value : this.formula,
      source: data.source.present ? data.source.value : this.source,
      purity: data.purity.present ? data.purity.value : this.purity,
      cost: data.cost.present ? data.cost.value : this.cost,
      is_liquid: data.is_liquid.present ? data.is_liquid.value : this.is_liquid,
      density: data.density.present ? data.density.value : this.density,
      conc_type: data.conc_type.present ? data.conc_type.value : this.conc_type,
      n_no3: data.n_no3.present ? data.n_no3.value : this.n_no3,
      n_nh4: data.n_nh4.present ? data.n_nh4.value : this.n_nh4,
      p: data.p.present ? data.p.value : this.p,
      k: data.k.present ? data.k.value : this.k,
      ca: data.ca.present ? data.ca.value : this.ca,
      mg: data.mg.present ? data.mg.value : this.mg,
      s: data.s.present ? data.s.value : this.s,
      fe: data.fe.present ? data.fe.value : this.fe,
      mn: data.mn.present ? data.mn.value : this.mn,
      zn: data.zn.present ? data.zn.value : this.zn,
      b: data.b.present ? data.b.value : this.b,
      cu: data.cu.present ? data.cu.value : this.cu,
      si: data.si.present ? data.si.value : this.si,
      mo: data.mo.present ? data.mo.value : this.mo,
      na: data.na.present ? data.na.value : this.na,
      cl: data.cl.present ? data.cl.value : this.cl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Substance(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('formula: $formula, ')
          ..write('source: $source, ')
          ..write('purity: $purity, ')
          ..write('cost: $cost, ')
          ..write('is_liquid: $is_liquid, ')
          ..write('density: $density, ')
          ..write('conc_type: $conc_type, ')
          ..write('n_no3: $n_no3, ')
          ..write('n_nh4: $n_nh4, ')
          ..write('p: $p, ')
          ..write('k: $k, ')
          ..write('ca: $ca, ')
          ..write('mg: $mg, ')
          ..write('s: $s, ')
          ..write('fe: $fe, ')
          ..write('mn: $mn, ')
          ..write('zn: $zn, ')
          ..write('b: $b, ')
          ..write('cu: $cu, ')
          ..write('si: $si, ')
          ..write('mo: $mo, ')
          ..write('na: $na, ')
          ..write('cl: $cl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    name,
    formula,
    source,
    purity,
    cost,
    is_liquid,
    density,
    conc_type,
    n_no3,
    n_nh4,
    p,
    k,
    ca,
    mg,
    s,
    fe,
    mn,
    zn,
    b,
    cu,
    si,
    mo,
    na,
    cl,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Substance &&
          other.id == this.id &&
          other.name == this.name &&
          other.formula == this.formula &&
          other.source == this.source &&
          other.purity == this.purity &&
          other.cost == this.cost &&
          other.is_liquid == this.is_liquid &&
          other.density == this.density &&
          other.conc_type == this.conc_type &&
          other.n_no3 == this.n_no3 &&
          other.n_nh4 == this.n_nh4 &&
          other.p == this.p &&
          other.k == this.k &&
          other.ca == this.ca &&
          other.mg == this.mg &&
          other.s == this.s &&
          other.fe == this.fe &&
          other.mn == this.mn &&
          other.zn == this.zn &&
          other.b == this.b &&
          other.cu == this.cu &&
          other.si == this.si &&
          other.mo == this.mo &&
          other.na == this.na &&
          other.cl == this.cl);
}

class SubstancesCompanion extends UpdateCompanion<Substance> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> formula;
  final Value<String?> source;
  final Value<double> purity;
  final Value<double> cost;
  final Value<bool> is_liquid;
  final Value<double> density;
  final Value<String?> conc_type;
  final Value<double> n_no3;
  final Value<double> n_nh4;
  final Value<double> p;
  final Value<double> k;
  final Value<double> ca;
  final Value<double> mg;
  final Value<double> s;
  final Value<double> fe;
  final Value<double> mn;
  final Value<double> zn;
  final Value<double> b;
  final Value<double> cu;
  final Value<double> si;
  final Value<double> mo;
  final Value<double> na;
  final Value<double> cl;
  const SubstancesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.formula = const Value.absent(),
    this.source = const Value.absent(),
    this.purity = const Value.absent(),
    this.cost = const Value.absent(),
    this.is_liquid = const Value.absent(),
    this.density = const Value.absent(),
    this.conc_type = const Value.absent(),
    this.n_no3 = const Value.absent(),
    this.n_nh4 = const Value.absent(),
    this.p = const Value.absent(),
    this.k = const Value.absent(),
    this.ca = const Value.absent(),
    this.mg = const Value.absent(),
    this.s = const Value.absent(),
    this.fe = const Value.absent(),
    this.mn = const Value.absent(),
    this.zn = const Value.absent(),
    this.b = const Value.absent(),
    this.cu = const Value.absent(),
    this.si = const Value.absent(),
    this.mo = const Value.absent(),
    this.na = const Value.absent(),
    this.cl = const Value.absent(),
  });
  SubstancesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.formula = const Value.absent(),
    this.source = const Value.absent(),
    this.purity = const Value.absent(),
    this.cost = const Value.absent(),
    this.is_liquid = const Value.absent(),
    this.density = const Value.absent(),
    this.conc_type = const Value.absent(),
    this.n_no3 = const Value.absent(),
    this.n_nh4 = const Value.absent(),
    this.p = const Value.absent(),
    this.k = const Value.absent(),
    this.ca = const Value.absent(),
    this.mg = const Value.absent(),
    this.s = const Value.absent(),
    this.fe = const Value.absent(),
    this.mn = const Value.absent(),
    this.zn = const Value.absent(),
    this.b = const Value.absent(),
    this.cu = const Value.absent(),
    this.si = const Value.absent(),
    this.mo = const Value.absent(),
    this.na = const Value.absent(),
    this.cl = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Substance> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? formula,
    Expression<String>? source,
    Expression<double>? purity,
    Expression<double>? cost,
    Expression<bool>? is_liquid,
    Expression<double>? density,
    Expression<String>? conc_type,
    Expression<double>? n_no3,
    Expression<double>? n_nh4,
    Expression<double>? p,
    Expression<double>? k,
    Expression<double>? ca,
    Expression<double>? mg,
    Expression<double>? s,
    Expression<double>? fe,
    Expression<double>? mn,
    Expression<double>? zn,
    Expression<double>? b,
    Expression<double>? cu,
    Expression<double>? si,
    Expression<double>? mo,
    Expression<double>? na,
    Expression<double>? cl,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (formula != null) 'formula': formula,
      if (source != null) 'source': source,
      if (purity != null) 'purity': purity,
      if (cost != null) 'cost': cost,
      if (is_liquid != null) 'is_liquid': is_liquid,
      if (density != null) 'density': density,
      if (conc_type != null) 'conc_type': conc_type,
      if (n_no3 != null) 'n_no3': n_no3,
      if (n_nh4 != null) 'n_nh4': n_nh4,
      if (p != null) 'p': p,
      if (k != null) 'k': k,
      if (ca != null) 'ca': ca,
      if (mg != null) 'mg': mg,
      if (s != null) 's': s,
      if (fe != null) 'fe': fe,
      if (mn != null) 'mn': mn,
      if (zn != null) 'zn': zn,
      if (b != null) 'b': b,
      if (cu != null) 'cu': cu,
      if (si != null) 'si': si,
      if (mo != null) 'mo': mo,
      if (na != null) 'na': na,
      if (cl != null) 'cl': cl,
    });
  }

  SubstancesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? formula,
    Value<String?>? source,
    Value<double>? purity,
    Value<double>? cost,
    Value<bool>? is_liquid,
    Value<double>? density,
    Value<String?>? conc_type,
    Value<double>? n_no3,
    Value<double>? n_nh4,
    Value<double>? p,
    Value<double>? k,
    Value<double>? ca,
    Value<double>? mg,
    Value<double>? s,
    Value<double>? fe,
    Value<double>? mn,
    Value<double>? zn,
    Value<double>? b,
    Value<double>? cu,
    Value<double>? si,
    Value<double>? mo,
    Value<double>? na,
    Value<double>? cl,
  }) {
    return SubstancesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      formula: formula ?? this.formula,
      source: source ?? this.source,
      purity: purity ?? this.purity,
      cost: cost ?? this.cost,
      is_liquid: is_liquid ?? this.is_liquid,
      density: density ?? this.density,
      conc_type: conc_type ?? this.conc_type,
      n_no3: n_no3 ?? this.n_no3,
      n_nh4: n_nh4 ?? this.n_nh4,
      p: p ?? this.p,
      k: k ?? this.k,
      ca: ca ?? this.ca,
      mg: mg ?? this.mg,
      s: s ?? this.s,
      fe: fe ?? this.fe,
      mn: mn ?? this.mn,
      zn: zn ?? this.zn,
      b: b ?? this.b,
      cu: cu ?? this.cu,
      si: si ?? this.si,
      mo: mo ?? this.mo,
      na: na ?? this.na,
      cl: cl ?? this.cl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (formula.present) {
      map['formula'] = Variable<String>(formula.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (purity.present) {
      map['purity'] = Variable<double>(purity.value);
    }
    if (cost.present) {
      map['cost'] = Variable<double>(cost.value);
    }
    if (is_liquid.present) {
      map['is_liquid'] = Variable<bool>(is_liquid.value);
    }
    if (density.present) {
      map['density'] = Variable<double>(density.value);
    }
    if (conc_type.present) {
      map['conc_type'] = Variable<String>(conc_type.value);
    }
    if (n_no3.present) {
      map['n_no3'] = Variable<double>(n_no3.value);
    }
    if (n_nh4.present) {
      map['n_nh4'] = Variable<double>(n_nh4.value);
    }
    if (p.present) {
      map['p'] = Variable<double>(p.value);
    }
    if (k.present) {
      map['k'] = Variable<double>(k.value);
    }
    if (ca.present) {
      map['ca'] = Variable<double>(ca.value);
    }
    if (mg.present) {
      map['mg'] = Variable<double>(mg.value);
    }
    if (s.present) {
      map['s'] = Variable<double>(s.value);
    }
    if (fe.present) {
      map['fe'] = Variable<double>(fe.value);
    }
    if (mn.present) {
      map['mn'] = Variable<double>(mn.value);
    }
    if (zn.present) {
      map['zn'] = Variable<double>(zn.value);
    }
    if (b.present) {
      map['b'] = Variable<double>(b.value);
    }
    if (cu.present) {
      map['cu'] = Variable<double>(cu.value);
    }
    if (si.present) {
      map['si'] = Variable<double>(si.value);
    }
    if (mo.present) {
      map['mo'] = Variable<double>(mo.value);
    }
    if (na.present) {
      map['na'] = Variable<double>(na.value);
    }
    if (cl.present) {
      map['cl'] = Variable<double>(cl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SubstancesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('formula: $formula, ')
          ..write('source: $source, ')
          ..write('purity: $purity, ')
          ..write('cost: $cost, ')
          ..write('is_liquid: $is_liquid, ')
          ..write('density: $density, ')
          ..write('conc_type: $conc_type, ')
          ..write('n_no3: $n_no3, ')
          ..write('n_nh4: $n_nh4, ')
          ..write('p: $p, ')
          ..write('k: $k, ')
          ..write('ca: $ca, ')
          ..write('mg: $mg, ')
          ..write('s: $s, ')
          ..write('fe: $fe, ')
          ..write('mn: $mn, ')
          ..write('zn: $zn, ')
          ..write('b: $b, ')
          ..write('cu: $cu, ')
          ..write('si: $si, ')
          ..write('mo: $mo, ')
          ..write('na: $na, ')
          ..write('cl: $cl')
          ..write(')'))
        .toString();
  }
}

class $FormulationsTable extends Formulations
    with TableInfo<$FormulationsTable, Formulation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FormulationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitsMeta = const VerificationMeta('units');
  @override
  late final GeneratedColumn<String> units = GeneratedColumn<String>(
    'units',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('ppm'),
  );
  static const VerificationMeta _created_atMeta = const VerificationMeta(
    'created_at',
  );
  @override
  late final GeneratedColumn<String> created_at = GeneratedColumn<String>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updated_atMeta = const VerificationMeta(
    'updated_at',
  );
  @override
  late final GeneratedColumn<String> updated_at = GeneratedColumn<String>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _n_no3Meta = const VerificationMeta('n_no3');
  @override
  late final GeneratedColumn<double> n_no3 = GeneratedColumn<double>(
    'n_no3',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _n_nh4Meta = const VerificationMeta('n_nh4');
  @override
  late final GeneratedColumn<double> n_nh4 = GeneratedColumn<double>(
    'n_nh4',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _pMeta = const VerificationMeta('p');
  @override
  late final GeneratedColumn<double> p = GeneratedColumn<double>(
    'p',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _kMeta = const VerificationMeta('k');
  @override
  late final GeneratedColumn<double> k = GeneratedColumn<double>(
    'k',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _caMeta = const VerificationMeta('ca');
  @override
  late final GeneratedColumn<double> ca = GeneratedColumn<double>(
    'ca',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _mgMeta = const VerificationMeta('mg');
  @override
  late final GeneratedColumn<double> mg = GeneratedColumn<double>(
    'mg',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _sMeta = const VerificationMeta('s');
  @override
  late final GeneratedColumn<double> s = GeneratedColumn<double>(
    's',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _feMeta = const VerificationMeta('fe');
  @override
  late final GeneratedColumn<double> fe = GeneratedColumn<double>(
    'fe',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _mnMeta = const VerificationMeta('mn');
  @override
  late final GeneratedColumn<double> mn = GeneratedColumn<double>(
    'mn',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _znMeta = const VerificationMeta('zn');
  @override
  late final GeneratedColumn<double> zn = GeneratedColumn<double>(
    'zn',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _bMeta = const VerificationMeta('b');
  @override
  late final GeneratedColumn<double> b = GeneratedColumn<double>(
    'b',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _cuMeta = const VerificationMeta('cu');
  @override
  late final GeneratedColumn<double> cu = GeneratedColumn<double>(
    'cu',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _siMeta = const VerificationMeta('si');
  @override
  late final GeneratedColumn<double> si = GeneratedColumn<double>(
    'si',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _moMeta = const VerificationMeta('mo');
  @override
  late final GeneratedColumn<double> mo = GeneratedColumn<double>(
    'mo',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _naMeta = const VerificationMeta('na');
  @override
  late final GeneratedColumn<double> na = GeneratedColumn<double>(
    'na',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _clMeta = const VerificationMeta('cl');
  @override
  late final GeneratedColumn<double> cl = GeneratedColumn<double>(
    'cl',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    units,
    created_at,
    updated_at,
    n_no3,
    n_nh4,
    p,
    k,
    ca,
    mg,
    s,
    fe,
    mn,
    zn,
    b,
    cu,
    si,
    mo,
    na,
    cl,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'formulations';
  @override
  VerificationContext validateIntegrity(
    Insertable<Formulation> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('units')) {
      context.handle(
        _unitsMeta,
        units.isAcceptableOrUnknown(data['units']!, _unitsMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _created_atMeta,
        created_at.isAcceptableOrUnknown(data['created_at']!, _created_atMeta),
      );
    } else if (isInserting) {
      context.missing(_created_atMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updated_atMeta,
        updated_at.isAcceptableOrUnknown(data['updated_at']!, _updated_atMeta),
      );
    } else if (isInserting) {
      context.missing(_updated_atMeta);
    }
    if (data.containsKey('n_no3')) {
      context.handle(
        _n_no3Meta,
        n_no3.isAcceptableOrUnknown(data['n_no3']!, _n_no3Meta),
      );
    }
    if (data.containsKey('n_nh4')) {
      context.handle(
        _n_nh4Meta,
        n_nh4.isAcceptableOrUnknown(data['n_nh4']!, _n_nh4Meta),
      );
    }
    if (data.containsKey('p')) {
      context.handle(_pMeta, p.isAcceptableOrUnknown(data['p']!, _pMeta));
    }
    if (data.containsKey('k')) {
      context.handle(_kMeta, k.isAcceptableOrUnknown(data['k']!, _kMeta));
    }
    if (data.containsKey('ca')) {
      context.handle(_caMeta, ca.isAcceptableOrUnknown(data['ca']!, _caMeta));
    }
    if (data.containsKey('mg')) {
      context.handle(_mgMeta, mg.isAcceptableOrUnknown(data['mg']!, _mgMeta));
    }
    if (data.containsKey('s')) {
      context.handle(_sMeta, s.isAcceptableOrUnknown(data['s']!, _sMeta));
    }
    if (data.containsKey('fe')) {
      context.handle(_feMeta, fe.isAcceptableOrUnknown(data['fe']!, _feMeta));
    }
    if (data.containsKey('mn')) {
      context.handle(_mnMeta, mn.isAcceptableOrUnknown(data['mn']!, _mnMeta));
    }
    if (data.containsKey('zn')) {
      context.handle(_znMeta, zn.isAcceptableOrUnknown(data['zn']!, _znMeta));
    }
    if (data.containsKey('b')) {
      context.handle(_bMeta, b.isAcceptableOrUnknown(data['b']!, _bMeta));
    }
    if (data.containsKey('cu')) {
      context.handle(_cuMeta, cu.isAcceptableOrUnknown(data['cu']!, _cuMeta));
    }
    if (data.containsKey('si')) {
      context.handle(_siMeta, si.isAcceptableOrUnknown(data['si']!, _siMeta));
    }
    if (data.containsKey('mo')) {
      context.handle(_moMeta, mo.isAcceptableOrUnknown(data['mo']!, _moMeta));
    }
    if (data.containsKey('na')) {
      context.handle(_naMeta, na.isAcceptableOrUnknown(data['na']!, _naMeta));
    }
    if (data.containsKey('cl')) {
      context.handle(_clMeta, cl.isAcceptableOrUnknown(data['cl']!, _clMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Formulation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Formulation(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      units: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}units'],
      )!,
      created_at: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at'],
      )!,
      updated_at: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_at'],
      )!,
      n_no3: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}n_no3'],
      )!,
      n_nh4: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}n_nh4'],
      )!,
      p: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}p'],
      )!,
      k: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}k'],
      )!,
      ca: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}ca'],
      )!,
      mg: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}mg'],
      )!,
      s: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}s'],
      )!,
      fe: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}fe'],
      )!,
      mn: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}mn'],
      )!,
      zn: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}zn'],
      )!,
      b: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}b'],
      )!,
      cu: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}cu'],
      )!,
      si: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}si'],
      )!,
      mo: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}mo'],
      )!,
      na: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}na'],
      )!,
      cl: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}cl'],
      )!,
    );
  }

  @override
  $FormulationsTable createAlias(String alias) {
    return $FormulationsTable(attachedDatabase, alias);
  }
}

class Formulation extends DataClass implements Insertable<Formulation> {
  final int id;
  final String name;
  final String units;
  final String created_at;
  final String updated_at;
  final double n_no3;
  final double n_nh4;
  final double p;
  final double k;
  final double ca;
  final double mg;
  final double s;
  final double fe;
  final double mn;
  final double zn;
  final double b;
  final double cu;
  final double si;
  final double mo;
  final double na;
  final double cl;
  const Formulation({
    required this.id,
    required this.name,
    required this.units,
    required this.created_at,
    required this.updated_at,
    required this.n_no3,
    required this.n_nh4,
    required this.p,
    required this.k,
    required this.ca,
    required this.mg,
    required this.s,
    required this.fe,
    required this.mn,
    required this.zn,
    required this.b,
    required this.cu,
    required this.si,
    required this.mo,
    required this.na,
    required this.cl,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['units'] = Variable<String>(units);
    map['created_at'] = Variable<String>(created_at);
    map['updated_at'] = Variable<String>(updated_at);
    map['n_no3'] = Variable<double>(n_no3);
    map['n_nh4'] = Variable<double>(n_nh4);
    map['p'] = Variable<double>(p);
    map['k'] = Variable<double>(k);
    map['ca'] = Variable<double>(ca);
    map['mg'] = Variable<double>(mg);
    map['s'] = Variable<double>(s);
    map['fe'] = Variable<double>(fe);
    map['mn'] = Variable<double>(mn);
    map['zn'] = Variable<double>(zn);
    map['b'] = Variable<double>(b);
    map['cu'] = Variable<double>(cu);
    map['si'] = Variable<double>(si);
    map['mo'] = Variable<double>(mo);
    map['na'] = Variable<double>(na);
    map['cl'] = Variable<double>(cl);
    return map;
  }

  FormulationsCompanion toCompanion(bool nullToAbsent) {
    return FormulationsCompanion(
      id: Value(id),
      name: Value(name),
      units: Value(units),
      created_at: Value(created_at),
      updated_at: Value(updated_at),
      n_no3: Value(n_no3),
      n_nh4: Value(n_nh4),
      p: Value(p),
      k: Value(k),
      ca: Value(ca),
      mg: Value(mg),
      s: Value(s),
      fe: Value(fe),
      mn: Value(mn),
      zn: Value(zn),
      b: Value(b),
      cu: Value(cu),
      si: Value(si),
      mo: Value(mo),
      na: Value(na),
      cl: Value(cl),
    );
  }

  factory Formulation.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Formulation(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      units: serializer.fromJson<String>(json['units']),
      created_at: serializer.fromJson<String>(json['created_at']),
      updated_at: serializer.fromJson<String>(json['updated_at']),
      n_no3: serializer.fromJson<double>(json['n_no3']),
      n_nh4: serializer.fromJson<double>(json['n_nh4']),
      p: serializer.fromJson<double>(json['p']),
      k: serializer.fromJson<double>(json['k']),
      ca: serializer.fromJson<double>(json['ca']),
      mg: serializer.fromJson<double>(json['mg']),
      s: serializer.fromJson<double>(json['s']),
      fe: serializer.fromJson<double>(json['fe']),
      mn: serializer.fromJson<double>(json['mn']),
      zn: serializer.fromJson<double>(json['zn']),
      b: serializer.fromJson<double>(json['b']),
      cu: serializer.fromJson<double>(json['cu']),
      si: serializer.fromJson<double>(json['si']),
      mo: serializer.fromJson<double>(json['mo']),
      na: serializer.fromJson<double>(json['na']),
      cl: serializer.fromJson<double>(json['cl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'units': serializer.toJson<String>(units),
      'created_at': serializer.toJson<String>(created_at),
      'updated_at': serializer.toJson<String>(updated_at),
      'n_no3': serializer.toJson<double>(n_no3),
      'n_nh4': serializer.toJson<double>(n_nh4),
      'p': serializer.toJson<double>(p),
      'k': serializer.toJson<double>(k),
      'ca': serializer.toJson<double>(ca),
      'mg': serializer.toJson<double>(mg),
      's': serializer.toJson<double>(s),
      'fe': serializer.toJson<double>(fe),
      'mn': serializer.toJson<double>(mn),
      'zn': serializer.toJson<double>(zn),
      'b': serializer.toJson<double>(b),
      'cu': serializer.toJson<double>(cu),
      'si': serializer.toJson<double>(si),
      'mo': serializer.toJson<double>(mo),
      'na': serializer.toJson<double>(na),
      'cl': serializer.toJson<double>(cl),
    };
  }

  Formulation copyWith({
    int? id,
    String? name,
    String? units,
    String? created_at,
    String? updated_at,
    double? n_no3,
    double? n_nh4,
    double? p,
    double? k,
    double? ca,
    double? mg,
    double? s,
    double? fe,
    double? mn,
    double? zn,
    double? b,
    double? cu,
    double? si,
    double? mo,
    double? na,
    double? cl,
  }) => Formulation(
    id: id ?? this.id,
    name: name ?? this.name,
    units: units ?? this.units,
    created_at: created_at ?? this.created_at,
    updated_at: updated_at ?? this.updated_at,
    n_no3: n_no3 ?? this.n_no3,
    n_nh4: n_nh4 ?? this.n_nh4,
    p: p ?? this.p,
    k: k ?? this.k,
    ca: ca ?? this.ca,
    mg: mg ?? this.mg,
    s: s ?? this.s,
    fe: fe ?? this.fe,
    mn: mn ?? this.mn,
    zn: zn ?? this.zn,
    b: b ?? this.b,
    cu: cu ?? this.cu,
    si: si ?? this.si,
    mo: mo ?? this.mo,
    na: na ?? this.na,
    cl: cl ?? this.cl,
  );
  Formulation copyWithCompanion(FormulationsCompanion data) {
    return Formulation(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      units: data.units.present ? data.units.value : this.units,
      created_at: data.created_at.present
          ? data.created_at.value
          : this.created_at,
      updated_at: data.updated_at.present
          ? data.updated_at.value
          : this.updated_at,
      n_no3: data.n_no3.present ? data.n_no3.value : this.n_no3,
      n_nh4: data.n_nh4.present ? data.n_nh4.value : this.n_nh4,
      p: data.p.present ? data.p.value : this.p,
      k: data.k.present ? data.k.value : this.k,
      ca: data.ca.present ? data.ca.value : this.ca,
      mg: data.mg.present ? data.mg.value : this.mg,
      s: data.s.present ? data.s.value : this.s,
      fe: data.fe.present ? data.fe.value : this.fe,
      mn: data.mn.present ? data.mn.value : this.mn,
      zn: data.zn.present ? data.zn.value : this.zn,
      b: data.b.present ? data.b.value : this.b,
      cu: data.cu.present ? data.cu.value : this.cu,
      si: data.si.present ? data.si.value : this.si,
      mo: data.mo.present ? data.mo.value : this.mo,
      na: data.na.present ? data.na.value : this.na,
      cl: data.cl.present ? data.cl.value : this.cl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Formulation(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('units: $units, ')
          ..write('created_at: $created_at, ')
          ..write('updated_at: $updated_at, ')
          ..write('n_no3: $n_no3, ')
          ..write('n_nh4: $n_nh4, ')
          ..write('p: $p, ')
          ..write('k: $k, ')
          ..write('ca: $ca, ')
          ..write('mg: $mg, ')
          ..write('s: $s, ')
          ..write('fe: $fe, ')
          ..write('mn: $mn, ')
          ..write('zn: $zn, ')
          ..write('b: $b, ')
          ..write('cu: $cu, ')
          ..write('si: $si, ')
          ..write('mo: $mo, ')
          ..write('na: $na, ')
          ..write('cl: $cl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    name,
    units,
    created_at,
    updated_at,
    n_no3,
    n_nh4,
    p,
    k,
    ca,
    mg,
    s,
    fe,
    mn,
    zn,
    b,
    cu,
    si,
    mo,
    na,
    cl,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Formulation &&
          other.id == this.id &&
          other.name == this.name &&
          other.units == this.units &&
          other.created_at == this.created_at &&
          other.updated_at == this.updated_at &&
          other.n_no3 == this.n_no3 &&
          other.n_nh4 == this.n_nh4 &&
          other.p == this.p &&
          other.k == this.k &&
          other.ca == this.ca &&
          other.mg == this.mg &&
          other.s == this.s &&
          other.fe == this.fe &&
          other.mn == this.mn &&
          other.zn == this.zn &&
          other.b == this.b &&
          other.cu == this.cu &&
          other.si == this.si &&
          other.mo == this.mo &&
          other.na == this.na &&
          other.cl == this.cl);
}

class FormulationsCompanion extends UpdateCompanion<Formulation> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> units;
  final Value<String> created_at;
  final Value<String> updated_at;
  final Value<double> n_no3;
  final Value<double> n_nh4;
  final Value<double> p;
  final Value<double> k;
  final Value<double> ca;
  final Value<double> mg;
  final Value<double> s;
  final Value<double> fe;
  final Value<double> mn;
  final Value<double> zn;
  final Value<double> b;
  final Value<double> cu;
  final Value<double> si;
  final Value<double> mo;
  final Value<double> na;
  final Value<double> cl;
  const FormulationsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.units = const Value.absent(),
    this.created_at = const Value.absent(),
    this.updated_at = const Value.absent(),
    this.n_no3 = const Value.absent(),
    this.n_nh4 = const Value.absent(),
    this.p = const Value.absent(),
    this.k = const Value.absent(),
    this.ca = const Value.absent(),
    this.mg = const Value.absent(),
    this.s = const Value.absent(),
    this.fe = const Value.absent(),
    this.mn = const Value.absent(),
    this.zn = const Value.absent(),
    this.b = const Value.absent(),
    this.cu = const Value.absent(),
    this.si = const Value.absent(),
    this.mo = const Value.absent(),
    this.na = const Value.absent(),
    this.cl = const Value.absent(),
  });
  FormulationsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.units = const Value.absent(),
    required String created_at,
    required String updated_at,
    this.n_no3 = const Value.absent(),
    this.n_nh4 = const Value.absent(),
    this.p = const Value.absent(),
    this.k = const Value.absent(),
    this.ca = const Value.absent(),
    this.mg = const Value.absent(),
    this.s = const Value.absent(),
    this.fe = const Value.absent(),
    this.mn = const Value.absent(),
    this.zn = const Value.absent(),
    this.b = const Value.absent(),
    this.cu = const Value.absent(),
    this.si = const Value.absent(),
    this.mo = const Value.absent(),
    this.na = const Value.absent(),
    this.cl = const Value.absent(),
  }) : name = Value(name),
       created_at = Value(created_at),
       updated_at = Value(updated_at);
  static Insertable<Formulation> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? units,
    Expression<String>? created_at,
    Expression<String>? updated_at,
    Expression<double>? n_no3,
    Expression<double>? n_nh4,
    Expression<double>? p,
    Expression<double>? k,
    Expression<double>? ca,
    Expression<double>? mg,
    Expression<double>? s,
    Expression<double>? fe,
    Expression<double>? mn,
    Expression<double>? zn,
    Expression<double>? b,
    Expression<double>? cu,
    Expression<double>? si,
    Expression<double>? mo,
    Expression<double>? na,
    Expression<double>? cl,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (units != null) 'units': units,
      if (created_at != null) 'created_at': created_at,
      if (updated_at != null) 'updated_at': updated_at,
      if (n_no3 != null) 'n_no3': n_no3,
      if (n_nh4 != null) 'n_nh4': n_nh4,
      if (p != null) 'p': p,
      if (k != null) 'k': k,
      if (ca != null) 'ca': ca,
      if (mg != null) 'mg': mg,
      if (s != null) 's': s,
      if (fe != null) 'fe': fe,
      if (mn != null) 'mn': mn,
      if (zn != null) 'zn': zn,
      if (b != null) 'b': b,
      if (cu != null) 'cu': cu,
      if (si != null) 'si': si,
      if (mo != null) 'mo': mo,
      if (na != null) 'na': na,
      if (cl != null) 'cl': cl,
    });
  }

  FormulationsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? units,
    Value<String>? created_at,
    Value<String>? updated_at,
    Value<double>? n_no3,
    Value<double>? n_nh4,
    Value<double>? p,
    Value<double>? k,
    Value<double>? ca,
    Value<double>? mg,
    Value<double>? s,
    Value<double>? fe,
    Value<double>? mn,
    Value<double>? zn,
    Value<double>? b,
    Value<double>? cu,
    Value<double>? si,
    Value<double>? mo,
    Value<double>? na,
    Value<double>? cl,
  }) {
    return FormulationsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      units: units ?? this.units,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      n_no3: n_no3 ?? this.n_no3,
      n_nh4: n_nh4 ?? this.n_nh4,
      p: p ?? this.p,
      k: k ?? this.k,
      ca: ca ?? this.ca,
      mg: mg ?? this.mg,
      s: s ?? this.s,
      fe: fe ?? this.fe,
      mn: mn ?? this.mn,
      zn: zn ?? this.zn,
      b: b ?? this.b,
      cu: cu ?? this.cu,
      si: si ?? this.si,
      mo: mo ?? this.mo,
      na: na ?? this.na,
      cl: cl ?? this.cl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (units.present) {
      map['units'] = Variable<String>(units.value);
    }
    if (created_at.present) {
      map['created_at'] = Variable<String>(created_at.value);
    }
    if (updated_at.present) {
      map['updated_at'] = Variable<String>(updated_at.value);
    }
    if (n_no3.present) {
      map['n_no3'] = Variable<double>(n_no3.value);
    }
    if (n_nh4.present) {
      map['n_nh4'] = Variable<double>(n_nh4.value);
    }
    if (p.present) {
      map['p'] = Variable<double>(p.value);
    }
    if (k.present) {
      map['k'] = Variable<double>(k.value);
    }
    if (ca.present) {
      map['ca'] = Variable<double>(ca.value);
    }
    if (mg.present) {
      map['mg'] = Variable<double>(mg.value);
    }
    if (s.present) {
      map['s'] = Variable<double>(s.value);
    }
    if (fe.present) {
      map['fe'] = Variable<double>(fe.value);
    }
    if (mn.present) {
      map['mn'] = Variable<double>(mn.value);
    }
    if (zn.present) {
      map['zn'] = Variable<double>(zn.value);
    }
    if (b.present) {
      map['b'] = Variable<double>(b.value);
    }
    if (cu.present) {
      map['cu'] = Variable<double>(cu.value);
    }
    if (si.present) {
      map['si'] = Variable<double>(si.value);
    }
    if (mo.present) {
      map['mo'] = Variable<double>(mo.value);
    }
    if (na.present) {
      map['na'] = Variable<double>(na.value);
    }
    if (cl.present) {
      map['cl'] = Variable<double>(cl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FormulationsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('units: $units, ')
          ..write('created_at: $created_at, ')
          ..write('updated_at: $updated_at, ')
          ..write('n_no3: $n_no3, ')
          ..write('n_nh4: $n_nh4, ')
          ..write('p: $p, ')
          ..write('k: $k, ')
          ..write('ca: $ca, ')
          ..write('mg: $mg, ')
          ..write('s: $s, ')
          ..write('fe: $fe, ')
          ..write('mn: $mn, ')
          ..write('zn: $zn, ')
          ..write('b: $b, ')
          ..write('cu: $cu, ')
          ..write('si: $si, ')
          ..write('mo: $mo, ')
          ..write('na: $na, ')
          ..write('cl: $cl')
          ..write(')'))
        .toString();
  }
}

class $FormulationSnapshotsTable extends FormulationSnapshots
    with TableInfo<$FormulationSnapshotsTable, FormulationSnapshot> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FormulationSnapshotsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _formulation_idMeta = const VerificationMeta(
    'formulation_id',
  );
  @override
  late final GeneratedColumn<int> formulation_id = GeneratedColumn<int>(
    'formulation_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES formulations (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _created_atMeta = const VerificationMeta(
    'created_at',
  );
  @override
  late final GeneratedColumn<String> created_at = GeneratedColumn<String>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _snapshot_dataMeta = const VerificationMeta(
    'snapshot_data',
  );
  @override
  late final GeneratedColumn<String> snapshot_data = GeneratedColumn<String>(
    'snapshot_data',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _trigger_typeMeta = const VerificationMeta(
    'trigger_type',
  );
  @override
  late final GeneratedColumn<String> trigger_type = GeneratedColumn<String>(
    'trigger_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _parent_snapshot_idMeta =
      const VerificationMeta('parent_snapshot_id');
  @override
  late final GeneratedColumn<int> parent_snapshot_id = GeneratedColumn<int>(
    'parent_snapshot_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    formulation_id,
    version,
    created_at,
    note,
    snapshot_data,
    trigger_type,
    parent_snapshot_id,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'formulation_snapshots';
  @override
  VerificationContext validateIntegrity(
    Insertable<FormulationSnapshot> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('formulation_id')) {
      context.handle(
        _formulation_idMeta,
        formulation_id.isAcceptableOrUnknown(
          data['formulation_id']!,
          _formulation_idMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_formulation_idMeta);
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    } else if (isInserting) {
      context.missing(_versionMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _created_atMeta,
        created_at.isAcceptableOrUnknown(data['created_at']!, _created_atMeta),
      );
    } else if (isInserting) {
      context.missing(_created_atMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    if (data.containsKey('snapshot_data')) {
      context.handle(
        _snapshot_dataMeta,
        snapshot_data.isAcceptableOrUnknown(
          data['snapshot_data']!,
          _snapshot_dataMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_snapshot_dataMeta);
    }
    if (data.containsKey('trigger_type')) {
      context.handle(
        _trigger_typeMeta,
        trigger_type.isAcceptableOrUnknown(
          data['trigger_type']!,
          _trigger_typeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_trigger_typeMeta);
    }
    if (data.containsKey('parent_snapshot_id')) {
      context.handle(
        _parent_snapshot_idMeta,
        parent_snapshot_id.isAcceptableOrUnknown(
          data['parent_snapshot_id']!,
          _parent_snapshot_idMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FormulationSnapshot map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FormulationSnapshot(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      formulation_id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}formulation_id'],
      )!,
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      created_at: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
      snapshot_data: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}snapshot_data'],
      )!,
      trigger_type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}trigger_type'],
      )!,
      parent_snapshot_id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}parent_snapshot_id'],
      ),
    );
  }

  @override
  $FormulationSnapshotsTable createAlias(String alias) {
    return $FormulationSnapshotsTable(attachedDatabase, alias);
  }
}

class FormulationSnapshot extends DataClass
    implements Insertable<FormulationSnapshot> {
  final int id;
  final int formulation_id;
  final int version;
  final String created_at;
  final String? note;
  final String snapshot_data;
  final String trigger_type;
  final int? parent_snapshot_id;
  const FormulationSnapshot({
    required this.id,
    required this.formulation_id,
    required this.version,
    required this.created_at,
    this.note,
    required this.snapshot_data,
    required this.trigger_type,
    this.parent_snapshot_id,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['formulation_id'] = Variable<int>(formulation_id);
    map['version'] = Variable<int>(version);
    map['created_at'] = Variable<String>(created_at);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['snapshot_data'] = Variable<String>(snapshot_data);
    map['trigger_type'] = Variable<String>(trigger_type);
    if (!nullToAbsent || parent_snapshot_id != null) {
      map['parent_snapshot_id'] = Variable<int>(parent_snapshot_id);
    }
    return map;
  }

  FormulationSnapshotsCompanion toCompanion(bool nullToAbsent) {
    return FormulationSnapshotsCompanion(
      id: Value(id),
      formulation_id: Value(formulation_id),
      version: Value(version),
      created_at: Value(created_at),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      snapshot_data: Value(snapshot_data),
      trigger_type: Value(trigger_type),
      parent_snapshot_id: parent_snapshot_id == null && nullToAbsent
          ? const Value.absent()
          : Value(parent_snapshot_id),
    );
  }

  factory FormulationSnapshot.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FormulationSnapshot(
      id: serializer.fromJson<int>(json['id']),
      formulation_id: serializer.fromJson<int>(json['formulation_id']),
      version: serializer.fromJson<int>(json['version']),
      created_at: serializer.fromJson<String>(json['created_at']),
      note: serializer.fromJson<String?>(json['note']),
      snapshot_data: serializer.fromJson<String>(json['snapshot_data']),
      trigger_type: serializer.fromJson<String>(json['trigger_type']),
      parent_snapshot_id: serializer.fromJson<int?>(json['parent_snapshot_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'formulation_id': serializer.toJson<int>(formulation_id),
      'version': serializer.toJson<int>(version),
      'created_at': serializer.toJson<String>(created_at),
      'note': serializer.toJson<String?>(note),
      'snapshot_data': serializer.toJson<String>(snapshot_data),
      'trigger_type': serializer.toJson<String>(trigger_type),
      'parent_snapshot_id': serializer.toJson<int?>(parent_snapshot_id),
    };
  }

  FormulationSnapshot copyWith({
    int? id,
    int? formulation_id,
    int? version,
    String? created_at,
    Value<String?> note = const Value.absent(),
    String? snapshot_data,
    String? trigger_type,
    Value<int?> parent_snapshot_id = const Value.absent(),
  }) => FormulationSnapshot(
    id: id ?? this.id,
    formulation_id: formulation_id ?? this.formulation_id,
    version: version ?? this.version,
    created_at: created_at ?? this.created_at,
    note: note.present ? note.value : this.note,
    snapshot_data: snapshot_data ?? this.snapshot_data,
    trigger_type: trigger_type ?? this.trigger_type,
    parent_snapshot_id: parent_snapshot_id.present
        ? parent_snapshot_id.value
        : this.parent_snapshot_id,
  );
  FormulationSnapshot copyWithCompanion(FormulationSnapshotsCompanion data) {
    return FormulationSnapshot(
      id: data.id.present ? data.id.value : this.id,
      formulation_id: data.formulation_id.present
          ? data.formulation_id.value
          : this.formulation_id,
      version: data.version.present ? data.version.value : this.version,
      created_at: data.created_at.present
          ? data.created_at.value
          : this.created_at,
      note: data.note.present ? data.note.value : this.note,
      snapshot_data: data.snapshot_data.present
          ? data.snapshot_data.value
          : this.snapshot_data,
      trigger_type: data.trigger_type.present
          ? data.trigger_type.value
          : this.trigger_type,
      parent_snapshot_id: data.parent_snapshot_id.present
          ? data.parent_snapshot_id.value
          : this.parent_snapshot_id,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FormulationSnapshot(')
          ..write('id: $id, ')
          ..write('formulation_id: $formulation_id, ')
          ..write('version: $version, ')
          ..write('created_at: $created_at, ')
          ..write('note: $note, ')
          ..write('snapshot_data: $snapshot_data, ')
          ..write('trigger_type: $trigger_type, ')
          ..write('parent_snapshot_id: $parent_snapshot_id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    formulation_id,
    version,
    created_at,
    note,
    snapshot_data,
    trigger_type,
    parent_snapshot_id,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FormulationSnapshot &&
          other.id == this.id &&
          other.formulation_id == this.formulation_id &&
          other.version == this.version &&
          other.created_at == this.created_at &&
          other.note == this.note &&
          other.snapshot_data == this.snapshot_data &&
          other.trigger_type == this.trigger_type &&
          other.parent_snapshot_id == this.parent_snapshot_id);
}

class FormulationSnapshotsCompanion
    extends UpdateCompanion<FormulationSnapshot> {
  final Value<int> id;
  final Value<int> formulation_id;
  final Value<int> version;
  final Value<String> created_at;
  final Value<String?> note;
  final Value<String> snapshot_data;
  final Value<String> trigger_type;
  final Value<int?> parent_snapshot_id;
  const FormulationSnapshotsCompanion({
    this.id = const Value.absent(),
    this.formulation_id = const Value.absent(),
    this.version = const Value.absent(),
    this.created_at = const Value.absent(),
    this.note = const Value.absent(),
    this.snapshot_data = const Value.absent(),
    this.trigger_type = const Value.absent(),
    this.parent_snapshot_id = const Value.absent(),
  });
  FormulationSnapshotsCompanion.insert({
    this.id = const Value.absent(),
    required int formulation_id,
    required int version,
    required String created_at,
    this.note = const Value.absent(),
    required String snapshot_data,
    required String trigger_type,
    this.parent_snapshot_id = const Value.absent(),
  }) : formulation_id = Value(formulation_id),
       version = Value(version),
       created_at = Value(created_at),
       snapshot_data = Value(snapshot_data),
       trigger_type = Value(trigger_type);
  static Insertable<FormulationSnapshot> custom({
    Expression<int>? id,
    Expression<int>? formulation_id,
    Expression<int>? version,
    Expression<String>? created_at,
    Expression<String>? note,
    Expression<String>? snapshot_data,
    Expression<String>? trigger_type,
    Expression<int>? parent_snapshot_id,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (formulation_id != null) 'formulation_id': formulation_id,
      if (version != null) 'version': version,
      if (created_at != null) 'created_at': created_at,
      if (note != null) 'note': note,
      if (snapshot_data != null) 'snapshot_data': snapshot_data,
      if (trigger_type != null) 'trigger_type': trigger_type,
      if (parent_snapshot_id != null) 'parent_snapshot_id': parent_snapshot_id,
    });
  }

  FormulationSnapshotsCompanion copyWith({
    Value<int>? id,
    Value<int>? formulation_id,
    Value<int>? version,
    Value<String>? created_at,
    Value<String?>? note,
    Value<String>? snapshot_data,
    Value<String>? trigger_type,
    Value<int?>? parent_snapshot_id,
  }) {
    return FormulationSnapshotsCompanion(
      id: id ?? this.id,
      formulation_id: formulation_id ?? this.formulation_id,
      version: version ?? this.version,
      created_at: created_at ?? this.created_at,
      note: note ?? this.note,
      snapshot_data: snapshot_data ?? this.snapshot_data,
      trigger_type: trigger_type ?? this.trigger_type,
      parent_snapshot_id: parent_snapshot_id ?? this.parent_snapshot_id,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (formulation_id.present) {
      map['formulation_id'] = Variable<int>(formulation_id.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (created_at.present) {
      map['created_at'] = Variable<String>(created_at.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (snapshot_data.present) {
      map['snapshot_data'] = Variable<String>(snapshot_data.value);
    }
    if (trigger_type.present) {
      map['trigger_type'] = Variable<String>(trigger_type.value);
    }
    if (parent_snapshot_id.present) {
      map['parent_snapshot_id'] = Variable<int>(parent_snapshot_id.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FormulationSnapshotsCompanion(')
          ..write('id: $id, ')
          ..write('formulation_id: $formulation_id, ')
          ..write('version: $version, ')
          ..write('created_at: $created_at, ')
          ..write('note: $note, ')
          ..write('snapshot_data: $snapshot_data, ')
          ..write('trigger_type: $trigger_type, ')
          ..write('parent_snapshot_id: $parent_snapshot_id')
          ..write(')'))
        .toString();
  }
}

class $WaterQualityTable extends WaterQuality
    with TableInfo<$WaterQualityTable, WaterQualityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WaterQualityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _is_defaultMeta = const VerificationMeta(
    'is_default',
  );
  @override
  late final GeneratedColumn<bool> is_default = GeneratedColumn<bool>(
    'is_default',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_default" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _phMeta = const VerificationMeta('ph');
  @override
  late final GeneratedColumn<double> ph = GeneratedColumn<double>(
    'ph',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ghMeta = const VerificationMeta('gh');
  @override
  late final GeneratedColumn<double> gh = GeneratedColumn<double>(
    'gh',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _khMeta = const VerificationMeta('kh');
  @override
  late final GeneratedColumn<double> kh = GeneratedColumn<double>(
    'kh',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _n_no3Meta = const VerificationMeta('n_no3');
  @override
  late final GeneratedColumn<double> n_no3 = GeneratedColumn<double>(
    'n_no3',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _n_nh4Meta = const VerificationMeta('n_nh4');
  @override
  late final GeneratedColumn<double> n_nh4 = GeneratedColumn<double>(
    'n_nh4',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _pMeta = const VerificationMeta('p');
  @override
  late final GeneratedColumn<double> p = GeneratedColumn<double>(
    'p',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _kMeta = const VerificationMeta('k');
  @override
  late final GeneratedColumn<double> k = GeneratedColumn<double>(
    'k',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _caMeta = const VerificationMeta('ca');
  @override
  late final GeneratedColumn<double> ca = GeneratedColumn<double>(
    'ca',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _mgMeta = const VerificationMeta('mg');
  @override
  late final GeneratedColumn<double> mg = GeneratedColumn<double>(
    'mg',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _sMeta = const VerificationMeta('s');
  @override
  late final GeneratedColumn<double> s = GeneratedColumn<double>(
    's',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _feMeta = const VerificationMeta('fe');
  @override
  late final GeneratedColumn<double> fe = GeneratedColumn<double>(
    'fe',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _mnMeta = const VerificationMeta('mn');
  @override
  late final GeneratedColumn<double> mn = GeneratedColumn<double>(
    'mn',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _znMeta = const VerificationMeta('zn');
  @override
  late final GeneratedColumn<double> zn = GeneratedColumn<double>(
    'zn',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _bMeta = const VerificationMeta('b');
  @override
  late final GeneratedColumn<double> b = GeneratedColumn<double>(
    'b',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _cuMeta = const VerificationMeta('cu');
  @override
  late final GeneratedColumn<double> cu = GeneratedColumn<double>(
    'cu',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _siMeta = const VerificationMeta('si');
  @override
  late final GeneratedColumn<double> si = GeneratedColumn<double>(
    'si',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _moMeta = const VerificationMeta('mo');
  @override
  late final GeneratedColumn<double> mo = GeneratedColumn<double>(
    'mo',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _naMeta = const VerificationMeta('na');
  @override
  late final GeneratedColumn<double> na = GeneratedColumn<double>(
    'na',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _clMeta = const VerificationMeta('cl');
  @override
  late final GeneratedColumn<double> cl = GeneratedColumn<double>(
    'cl',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    is_default,
    ph,
    gh,
    kh,
    n_no3,
    n_nh4,
    p,
    k,
    ca,
    mg,
    s,
    fe,
    mn,
    zn,
    b,
    cu,
    si,
    mo,
    na,
    cl,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'water_quality';
  @override
  VerificationContext validateIntegrity(
    Insertable<WaterQualityData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('is_default')) {
      context.handle(
        _is_defaultMeta,
        is_default.isAcceptableOrUnknown(data['is_default']!, _is_defaultMeta),
      );
    }
    if (data.containsKey('ph')) {
      context.handle(_phMeta, ph.isAcceptableOrUnknown(data['ph']!, _phMeta));
    }
    if (data.containsKey('gh')) {
      context.handle(_ghMeta, gh.isAcceptableOrUnknown(data['gh']!, _ghMeta));
    }
    if (data.containsKey('kh')) {
      context.handle(_khMeta, kh.isAcceptableOrUnknown(data['kh']!, _khMeta));
    }
    if (data.containsKey('n_no3')) {
      context.handle(
        _n_no3Meta,
        n_no3.isAcceptableOrUnknown(data['n_no3']!, _n_no3Meta),
      );
    }
    if (data.containsKey('n_nh4')) {
      context.handle(
        _n_nh4Meta,
        n_nh4.isAcceptableOrUnknown(data['n_nh4']!, _n_nh4Meta),
      );
    }
    if (data.containsKey('p')) {
      context.handle(_pMeta, p.isAcceptableOrUnknown(data['p']!, _pMeta));
    }
    if (data.containsKey('k')) {
      context.handle(_kMeta, k.isAcceptableOrUnknown(data['k']!, _kMeta));
    }
    if (data.containsKey('ca')) {
      context.handle(_caMeta, ca.isAcceptableOrUnknown(data['ca']!, _caMeta));
    }
    if (data.containsKey('mg')) {
      context.handle(_mgMeta, mg.isAcceptableOrUnknown(data['mg']!, _mgMeta));
    }
    if (data.containsKey('s')) {
      context.handle(_sMeta, s.isAcceptableOrUnknown(data['s']!, _sMeta));
    }
    if (data.containsKey('fe')) {
      context.handle(_feMeta, fe.isAcceptableOrUnknown(data['fe']!, _feMeta));
    }
    if (data.containsKey('mn')) {
      context.handle(_mnMeta, mn.isAcceptableOrUnknown(data['mn']!, _mnMeta));
    }
    if (data.containsKey('zn')) {
      context.handle(_znMeta, zn.isAcceptableOrUnknown(data['zn']!, _znMeta));
    }
    if (data.containsKey('b')) {
      context.handle(_bMeta, b.isAcceptableOrUnknown(data['b']!, _bMeta));
    }
    if (data.containsKey('cu')) {
      context.handle(_cuMeta, cu.isAcceptableOrUnknown(data['cu']!, _cuMeta));
    }
    if (data.containsKey('si')) {
      context.handle(_siMeta, si.isAcceptableOrUnknown(data['si']!, _siMeta));
    }
    if (data.containsKey('mo')) {
      context.handle(_moMeta, mo.isAcceptableOrUnknown(data['mo']!, _moMeta));
    }
    if (data.containsKey('na')) {
      context.handle(_naMeta, na.isAcceptableOrUnknown(data['na']!, _naMeta));
    }
    if (data.containsKey('cl')) {
      context.handle(_clMeta, cl.isAcceptableOrUnknown(data['cl']!, _clMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WaterQualityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WaterQualityData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      is_default: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_default'],
      )!,
      ph: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}ph'],
      ),
      gh: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}gh'],
      ),
      kh: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}kh'],
      ),
      n_no3: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}n_no3'],
      )!,
      n_nh4: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}n_nh4'],
      )!,
      p: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}p'],
      )!,
      k: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}k'],
      )!,
      ca: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}ca'],
      )!,
      mg: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}mg'],
      )!,
      s: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}s'],
      )!,
      fe: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}fe'],
      )!,
      mn: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}mn'],
      )!,
      zn: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}zn'],
      )!,
      b: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}b'],
      )!,
      cu: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}cu'],
      )!,
      si: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}si'],
      )!,
      mo: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}mo'],
      )!,
      na: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}na'],
      )!,
      cl: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}cl'],
      )!,
    );
  }

  @override
  $WaterQualityTable createAlias(String alias) {
    return $WaterQualityTable(attachedDatabase, alias);
  }
}

class WaterQualityData extends DataClass
    implements Insertable<WaterQualityData> {
  final int id;
  final String name;
  final bool is_default;
  final double? ph;
  final double? gh;
  final double? kh;
  final double n_no3;
  final double n_nh4;
  final double p;
  final double k;
  final double ca;
  final double mg;
  final double s;
  final double fe;
  final double mn;
  final double zn;
  final double b;
  final double cu;
  final double si;
  final double mo;
  final double na;
  final double cl;
  const WaterQualityData({
    required this.id,
    required this.name,
    required this.is_default,
    this.ph,
    this.gh,
    this.kh,
    required this.n_no3,
    required this.n_nh4,
    required this.p,
    required this.k,
    required this.ca,
    required this.mg,
    required this.s,
    required this.fe,
    required this.mn,
    required this.zn,
    required this.b,
    required this.cu,
    required this.si,
    required this.mo,
    required this.na,
    required this.cl,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['is_default'] = Variable<bool>(is_default);
    if (!nullToAbsent || ph != null) {
      map['ph'] = Variable<double>(ph);
    }
    if (!nullToAbsent || gh != null) {
      map['gh'] = Variable<double>(gh);
    }
    if (!nullToAbsent || kh != null) {
      map['kh'] = Variable<double>(kh);
    }
    map['n_no3'] = Variable<double>(n_no3);
    map['n_nh4'] = Variable<double>(n_nh4);
    map['p'] = Variable<double>(p);
    map['k'] = Variable<double>(k);
    map['ca'] = Variable<double>(ca);
    map['mg'] = Variable<double>(mg);
    map['s'] = Variable<double>(s);
    map['fe'] = Variable<double>(fe);
    map['mn'] = Variable<double>(mn);
    map['zn'] = Variable<double>(zn);
    map['b'] = Variable<double>(b);
    map['cu'] = Variable<double>(cu);
    map['si'] = Variable<double>(si);
    map['mo'] = Variable<double>(mo);
    map['na'] = Variable<double>(na);
    map['cl'] = Variable<double>(cl);
    return map;
  }

  WaterQualityCompanion toCompanion(bool nullToAbsent) {
    return WaterQualityCompanion(
      id: Value(id),
      name: Value(name),
      is_default: Value(is_default),
      ph: ph == null && nullToAbsent ? const Value.absent() : Value(ph),
      gh: gh == null && nullToAbsent ? const Value.absent() : Value(gh),
      kh: kh == null && nullToAbsent ? const Value.absent() : Value(kh),
      n_no3: Value(n_no3),
      n_nh4: Value(n_nh4),
      p: Value(p),
      k: Value(k),
      ca: Value(ca),
      mg: Value(mg),
      s: Value(s),
      fe: Value(fe),
      mn: Value(mn),
      zn: Value(zn),
      b: Value(b),
      cu: Value(cu),
      si: Value(si),
      mo: Value(mo),
      na: Value(na),
      cl: Value(cl),
    );
  }

  factory WaterQualityData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WaterQualityData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      is_default: serializer.fromJson<bool>(json['is_default']),
      ph: serializer.fromJson<double?>(json['ph']),
      gh: serializer.fromJson<double?>(json['gh']),
      kh: serializer.fromJson<double?>(json['kh']),
      n_no3: serializer.fromJson<double>(json['n_no3']),
      n_nh4: serializer.fromJson<double>(json['n_nh4']),
      p: serializer.fromJson<double>(json['p']),
      k: serializer.fromJson<double>(json['k']),
      ca: serializer.fromJson<double>(json['ca']),
      mg: serializer.fromJson<double>(json['mg']),
      s: serializer.fromJson<double>(json['s']),
      fe: serializer.fromJson<double>(json['fe']),
      mn: serializer.fromJson<double>(json['mn']),
      zn: serializer.fromJson<double>(json['zn']),
      b: serializer.fromJson<double>(json['b']),
      cu: serializer.fromJson<double>(json['cu']),
      si: serializer.fromJson<double>(json['si']),
      mo: serializer.fromJson<double>(json['mo']),
      na: serializer.fromJson<double>(json['na']),
      cl: serializer.fromJson<double>(json['cl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'is_default': serializer.toJson<bool>(is_default),
      'ph': serializer.toJson<double?>(ph),
      'gh': serializer.toJson<double?>(gh),
      'kh': serializer.toJson<double?>(kh),
      'n_no3': serializer.toJson<double>(n_no3),
      'n_nh4': serializer.toJson<double>(n_nh4),
      'p': serializer.toJson<double>(p),
      'k': serializer.toJson<double>(k),
      'ca': serializer.toJson<double>(ca),
      'mg': serializer.toJson<double>(mg),
      's': serializer.toJson<double>(s),
      'fe': serializer.toJson<double>(fe),
      'mn': serializer.toJson<double>(mn),
      'zn': serializer.toJson<double>(zn),
      'b': serializer.toJson<double>(b),
      'cu': serializer.toJson<double>(cu),
      'si': serializer.toJson<double>(si),
      'mo': serializer.toJson<double>(mo),
      'na': serializer.toJson<double>(na),
      'cl': serializer.toJson<double>(cl),
    };
  }

  WaterQualityData copyWith({
    int? id,
    String? name,
    bool? is_default,
    Value<double?> ph = const Value.absent(),
    Value<double?> gh = const Value.absent(),
    Value<double?> kh = const Value.absent(),
    double? n_no3,
    double? n_nh4,
    double? p,
    double? k,
    double? ca,
    double? mg,
    double? s,
    double? fe,
    double? mn,
    double? zn,
    double? b,
    double? cu,
    double? si,
    double? mo,
    double? na,
    double? cl,
  }) => WaterQualityData(
    id: id ?? this.id,
    name: name ?? this.name,
    is_default: is_default ?? this.is_default,
    ph: ph.present ? ph.value : this.ph,
    gh: gh.present ? gh.value : this.gh,
    kh: kh.present ? kh.value : this.kh,
    n_no3: n_no3 ?? this.n_no3,
    n_nh4: n_nh4 ?? this.n_nh4,
    p: p ?? this.p,
    k: k ?? this.k,
    ca: ca ?? this.ca,
    mg: mg ?? this.mg,
    s: s ?? this.s,
    fe: fe ?? this.fe,
    mn: mn ?? this.mn,
    zn: zn ?? this.zn,
    b: b ?? this.b,
    cu: cu ?? this.cu,
    si: si ?? this.si,
    mo: mo ?? this.mo,
    na: na ?? this.na,
    cl: cl ?? this.cl,
  );
  WaterQualityData copyWithCompanion(WaterQualityCompanion data) {
    return WaterQualityData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      is_default: data.is_default.present
          ? data.is_default.value
          : this.is_default,
      ph: data.ph.present ? data.ph.value : this.ph,
      gh: data.gh.present ? data.gh.value : this.gh,
      kh: data.kh.present ? data.kh.value : this.kh,
      n_no3: data.n_no3.present ? data.n_no3.value : this.n_no3,
      n_nh4: data.n_nh4.present ? data.n_nh4.value : this.n_nh4,
      p: data.p.present ? data.p.value : this.p,
      k: data.k.present ? data.k.value : this.k,
      ca: data.ca.present ? data.ca.value : this.ca,
      mg: data.mg.present ? data.mg.value : this.mg,
      s: data.s.present ? data.s.value : this.s,
      fe: data.fe.present ? data.fe.value : this.fe,
      mn: data.mn.present ? data.mn.value : this.mn,
      zn: data.zn.present ? data.zn.value : this.zn,
      b: data.b.present ? data.b.value : this.b,
      cu: data.cu.present ? data.cu.value : this.cu,
      si: data.si.present ? data.si.value : this.si,
      mo: data.mo.present ? data.mo.value : this.mo,
      na: data.na.present ? data.na.value : this.na,
      cl: data.cl.present ? data.cl.value : this.cl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WaterQualityData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('is_default: $is_default, ')
          ..write('ph: $ph, ')
          ..write('gh: $gh, ')
          ..write('kh: $kh, ')
          ..write('n_no3: $n_no3, ')
          ..write('n_nh4: $n_nh4, ')
          ..write('p: $p, ')
          ..write('k: $k, ')
          ..write('ca: $ca, ')
          ..write('mg: $mg, ')
          ..write('s: $s, ')
          ..write('fe: $fe, ')
          ..write('mn: $mn, ')
          ..write('zn: $zn, ')
          ..write('b: $b, ')
          ..write('cu: $cu, ')
          ..write('si: $si, ')
          ..write('mo: $mo, ')
          ..write('na: $na, ')
          ..write('cl: $cl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    name,
    is_default,
    ph,
    gh,
    kh,
    n_no3,
    n_nh4,
    p,
    k,
    ca,
    mg,
    s,
    fe,
    mn,
    zn,
    b,
    cu,
    si,
    mo,
    na,
    cl,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WaterQualityData &&
          other.id == this.id &&
          other.name == this.name &&
          other.is_default == this.is_default &&
          other.ph == this.ph &&
          other.gh == this.gh &&
          other.kh == this.kh &&
          other.n_no3 == this.n_no3 &&
          other.n_nh4 == this.n_nh4 &&
          other.p == this.p &&
          other.k == this.k &&
          other.ca == this.ca &&
          other.mg == this.mg &&
          other.s == this.s &&
          other.fe == this.fe &&
          other.mn == this.mn &&
          other.zn == this.zn &&
          other.b == this.b &&
          other.cu == this.cu &&
          other.si == this.si &&
          other.mo == this.mo &&
          other.na == this.na &&
          other.cl == this.cl);
}

class WaterQualityCompanion extends UpdateCompanion<WaterQualityData> {
  final Value<int> id;
  final Value<String> name;
  final Value<bool> is_default;
  final Value<double?> ph;
  final Value<double?> gh;
  final Value<double?> kh;
  final Value<double> n_no3;
  final Value<double> n_nh4;
  final Value<double> p;
  final Value<double> k;
  final Value<double> ca;
  final Value<double> mg;
  final Value<double> s;
  final Value<double> fe;
  final Value<double> mn;
  final Value<double> zn;
  final Value<double> b;
  final Value<double> cu;
  final Value<double> si;
  final Value<double> mo;
  final Value<double> na;
  final Value<double> cl;
  const WaterQualityCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.is_default = const Value.absent(),
    this.ph = const Value.absent(),
    this.gh = const Value.absent(),
    this.kh = const Value.absent(),
    this.n_no3 = const Value.absent(),
    this.n_nh4 = const Value.absent(),
    this.p = const Value.absent(),
    this.k = const Value.absent(),
    this.ca = const Value.absent(),
    this.mg = const Value.absent(),
    this.s = const Value.absent(),
    this.fe = const Value.absent(),
    this.mn = const Value.absent(),
    this.zn = const Value.absent(),
    this.b = const Value.absent(),
    this.cu = const Value.absent(),
    this.si = const Value.absent(),
    this.mo = const Value.absent(),
    this.na = const Value.absent(),
    this.cl = const Value.absent(),
  });
  WaterQualityCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.is_default = const Value.absent(),
    this.ph = const Value.absent(),
    this.gh = const Value.absent(),
    this.kh = const Value.absent(),
    this.n_no3 = const Value.absent(),
    this.n_nh4 = const Value.absent(),
    this.p = const Value.absent(),
    this.k = const Value.absent(),
    this.ca = const Value.absent(),
    this.mg = const Value.absent(),
    this.s = const Value.absent(),
    this.fe = const Value.absent(),
    this.mn = const Value.absent(),
    this.zn = const Value.absent(),
    this.b = const Value.absent(),
    this.cu = const Value.absent(),
    this.si = const Value.absent(),
    this.mo = const Value.absent(),
    this.na = const Value.absent(),
    this.cl = const Value.absent(),
  }) : name = Value(name);
  static Insertable<WaterQualityData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<bool>? is_default,
    Expression<double>? ph,
    Expression<double>? gh,
    Expression<double>? kh,
    Expression<double>? n_no3,
    Expression<double>? n_nh4,
    Expression<double>? p,
    Expression<double>? k,
    Expression<double>? ca,
    Expression<double>? mg,
    Expression<double>? s,
    Expression<double>? fe,
    Expression<double>? mn,
    Expression<double>? zn,
    Expression<double>? b,
    Expression<double>? cu,
    Expression<double>? si,
    Expression<double>? mo,
    Expression<double>? na,
    Expression<double>? cl,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (is_default != null) 'is_default': is_default,
      if (ph != null) 'ph': ph,
      if (gh != null) 'gh': gh,
      if (kh != null) 'kh': kh,
      if (n_no3 != null) 'n_no3': n_no3,
      if (n_nh4 != null) 'n_nh4': n_nh4,
      if (p != null) 'p': p,
      if (k != null) 'k': k,
      if (ca != null) 'ca': ca,
      if (mg != null) 'mg': mg,
      if (s != null) 's': s,
      if (fe != null) 'fe': fe,
      if (mn != null) 'mn': mn,
      if (zn != null) 'zn': zn,
      if (b != null) 'b': b,
      if (cu != null) 'cu': cu,
      if (si != null) 'si': si,
      if (mo != null) 'mo': mo,
      if (na != null) 'na': na,
      if (cl != null) 'cl': cl,
    });
  }

  WaterQualityCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<bool>? is_default,
    Value<double?>? ph,
    Value<double?>? gh,
    Value<double?>? kh,
    Value<double>? n_no3,
    Value<double>? n_nh4,
    Value<double>? p,
    Value<double>? k,
    Value<double>? ca,
    Value<double>? mg,
    Value<double>? s,
    Value<double>? fe,
    Value<double>? mn,
    Value<double>? zn,
    Value<double>? b,
    Value<double>? cu,
    Value<double>? si,
    Value<double>? mo,
    Value<double>? na,
    Value<double>? cl,
  }) {
    return WaterQualityCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      is_default: is_default ?? this.is_default,
      ph: ph ?? this.ph,
      gh: gh ?? this.gh,
      kh: kh ?? this.kh,
      n_no3: n_no3 ?? this.n_no3,
      n_nh4: n_nh4 ?? this.n_nh4,
      p: p ?? this.p,
      k: k ?? this.k,
      ca: ca ?? this.ca,
      mg: mg ?? this.mg,
      s: s ?? this.s,
      fe: fe ?? this.fe,
      mn: mn ?? this.mn,
      zn: zn ?? this.zn,
      b: b ?? this.b,
      cu: cu ?? this.cu,
      si: si ?? this.si,
      mo: mo ?? this.mo,
      na: na ?? this.na,
      cl: cl ?? this.cl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (is_default.present) {
      map['is_default'] = Variable<bool>(is_default.value);
    }
    if (ph.present) {
      map['ph'] = Variable<double>(ph.value);
    }
    if (gh.present) {
      map['gh'] = Variable<double>(gh.value);
    }
    if (kh.present) {
      map['kh'] = Variable<double>(kh.value);
    }
    if (n_no3.present) {
      map['n_no3'] = Variable<double>(n_no3.value);
    }
    if (n_nh4.present) {
      map['n_nh4'] = Variable<double>(n_nh4.value);
    }
    if (p.present) {
      map['p'] = Variable<double>(p.value);
    }
    if (k.present) {
      map['k'] = Variable<double>(k.value);
    }
    if (ca.present) {
      map['ca'] = Variable<double>(ca.value);
    }
    if (mg.present) {
      map['mg'] = Variable<double>(mg.value);
    }
    if (s.present) {
      map['s'] = Variable<double>(s.value);
    }
    if (fe.present) {
      map['fe'] = Variable<double>(fe.value);
    }
    if (mn.present) {
      map['mn'] = Variable<double>(mn.value);
    }
    if (zn.present) {
      map['zn'] = Variable<double>(zn.value);
    }
    if (b.present) {
      map['b'] = Variable<double>(b.value);
    }
    if (cu.present) {
      map['cu'] = Variable<double>(cu.value);
    }
    if (si.present) {
      map['si'] = Variable<double>(si.value);
    }
    if (mo.present) {
      map['mo'] = Variable<double>(mo.value);
    }
    if (na.present) {
      map['na'] = Variable<double>(na.value);
    }
    if (cl.present) {
      map['cl'] = Variable<double>(cl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WaterQualityCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('is_default: $is_default, ')
          ..write('ph: $ph, ')
          ..write('gh: $gh, ')
          ..write('kh: $kh, ')
          ..write('n_no3: $n_no3, ')
          ..write('n_nh4: $n_nh4, ')
          ..write('p: $p, ')
          ..write('k: $k, ')
          ..write('ca: $ca, ')
          ..write('mg: $mg, ')
          ..write('s: $s, ')
          ..write('fe: $fe, ')
          ..write('mn: $mn, ')
          ..write('zn: $zn, ')
          ..write('b: $b, ')
          ..write('cu: $cu, ')
          ..write('si: $si, ')
          ..write('mo: $mo, ')
          ..write('na: $na, ')
          ..write('cl: $cl')
          ..write(')'))
        .toString();
  }
}

class $TissueAnalysisTable extends TissueAnalysis
    with TableInfo<$TissueAnalysisTable, TissueAnalysi> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TissueAnalysisTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nMeta = const VerificationMeta('n');
  @override
  late final GeneratedColumn<double> n = GeneratedColumn<double>(
    'n',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _pMeta = const VerificationMeta('p');
  @override
  late final GeneratedColumn<double> p = GeneratedColumn<double>(
    'p',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _kMeta = const VerificationMeta('k');
  @override
  late final GeneratedColumn<double> k = GeneratedColumn<double>(
    'k',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _caMeta = const VerificationMeta('ca');
  @override
  late final GeneratedColumn<double> ca = GeneratedColumn<double>(
    'ca',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _mgMeta = const VerificationMeta('mg');
  @override
  late final GeneratedColumn<double> mg = GeneratedColumn<double>(
    'mg',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _sMeta = const VerificationMeta('s');
  @override
  late final GeneratedColumn<double> s = GeneratedColumn<double>(
    's',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _feMeta = const VerificationMeta('fe');
  @override
  late final GeneratedColumn<double> fe = GeneratedColumn<double>(
    'fe',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _mnMeta = const VerificationMeta('mn');
  @override
  late final GeneratedColumn<double> mn = GeneratedColumn<double>(
    'mn',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _znMeta = const VerificationMeta('zn');
  @override
  late final GeneratedColumn<double> zn = GeneratedColumn<double>(
    'zn',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _bMeta = const VerificationMeta('b');
  @override
  late final GeneratedColumn<double> b = GeneratedColumn<double>(
    'b',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _cuMeta = const VerificationMeta('cu');
  @override
  late final GeneratedColumn<double> cu = GeneratedColumn<double>(
    'cu',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _siMeta = const VerificationMeta('si');
  @override
  late final GeneratedColumn<double> si = GeneratedColumn<double>(
    'si',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _moMeta = const VerificationMeta('mo');
  @override
  late final GeneratedColumn<double> mo = GeneratedColumn<double>(
    'mo',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _naMeta = const VerificationMeta('na');
  @override
  late final GeneratedColumn<double> na = GeneratedColumn<double>(
    'na',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _clMeta = const VerificationMeta('cl');
  @override
  late final GeneratedColumn<double> cl = GeneratedColumn<double>(
    'cl',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    n,
    p,
    k,
    ca,
    mg,
    s,
    fe,
    mn,
    zn,
    b,
    cu,
    si,
    mo,
    na,
    cl,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tissue_analysis';
  @override
  VerificationContext validateIntegrity(
    Insertable<TissueAnalysi> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('n')) {
      context.handle(_nMeta, n.isAcceptableOrUnknown(data['n']!, _nMeta));
    }
    if (data.containsKey('p')) {
      context.handle(_pMeta, p.isAcceptableOrUnknown(data['p']!, _pMeta));
    }
    if (data.containsKey('k')) {
      context.handle(_kMeta, k.isAcceptableOrUnknown(data['k']!, _kMeta));
    }
    if (data.containsKey('ca')) {
      context.handle(_caMeta, ca.isAcceptableOrUnknown(data['ca']!, _caMeta));
    }
    if (data.containsKey('mg')) {
      context.handle(_mgMeta, mg.isAcceptableOrUnknown(data['mg']!, _mgMeta));
    }
    if (data.containsKey('s')) {
      context.handle(_sMeta, s.isAcceptableOrUnknown(data['s']!, _sMeta));
    }
    if (data.containsKey('fe')) {
      context.handle(_feMeta, fe.isAcceptableOrUnknown(data['fe']!, _feMeta));
    }
    if (data.containsKey('mn')) {
      context.handle(_mnMeta, mn.isAcceptableOrUnknown(data['mn']!, _mnMeta));
    }
    if (data.containsKey('zn')) {
      context.handle(_znMeta, zn.isAcceptableOrUnknown(data['zn']!, _znMeta));
    }
    if (data.containsKey('b')) {
      context.handle(_bMeta, b.isAcceptableOrUnknown(data['b']!, _bMeta));
    }
    if (data.containsKey('cu')) {
      context.handle(_cuMeta, cu.isAcceptableOrUnknown(data['cu']!, _cuMeta));
    }
    if (data.containsKey('si')) {
      context.handle(_siMeta, si.isAcceptableOrUnknown(data['si']!, _siMeta));
    }
    if (data.containsKey('mo')) {
      context.handle(_moMeta, mo.isAcceptableOrUnknown(data['mo']!, _moMeta));
    }
    if (data.containsKey('na')) {
      context.handle(_naMeta, na.isAcceptableOrUnknown(data['na']!, _naMeta));
    }
    if (data.containsKey('cl')) {
      context.handle(_clMeta, cl.isAcceptableOrUnknown(data['cl']!, _clMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TissueAnalysi map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TissueAnalysi(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      n: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}n'],
      )!,
      p: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}p'],
      )!,
      k: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}k'],
      )!,
      ca: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}ca'],
      )!,
      mg: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}mg'],
      )!,
      s: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}s'],
      )!,
      fe: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}fe'],
      )!,
      mn: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}mn'],
      )!,
      zn: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}zn'],
      )!,
      b: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}b'],
      )!,
      cu: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}cu'],
      )!,
      si: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}si'],
      )!,
      mo: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}mo'],
      )!,
      na: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}na'],
      )!,
      cl: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}cl'],
      )!,
    );
  }

  @override
  $TissueAnalysisTable createAlias(String alias) {
    return $TissueAnalysisTable(attachedDatabase, alias);
  }
}

class TissueAnalysi extends DataClass implements Insertable<TissueAnalysi> {
  final int id;
  final String name;
  final double n;
  final double p;
  final double k;
  final double ca;
  final double mg;
  final double s;
  final double fe;
  final double mn;
  final double zn;
  final double b;
  final double cu;
  final double si;
  final double mo;
  final double na;
  final double cl;
  const TissueAnalysi({
    required this.id,
    required this.name,
    required this.n,
    required this.p,
    required this.k,
    required this.ca,
    required this.mg,
    required this.s,
    required this.fe,
    required this.mn,
    required this.zn,
    required this.b,
    required this.cu,
    required this.si,
    required this.mo,
    required this.na,
    required this.cl,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['n'] = Variable<double>(n);
    map['p'] = Variable<double>(p);
    map['k'] = Variable<double>(k);
    map['ca'] = Variable<double>(ca);
    map['mg'] = Variable<double>(mg);
    map['s'] = Variable<double>(s);
    map['fe'] = Variable<double>(fe);
    map['mn'] = Variable<double>(mn);
    map['zn'] = Variable<double>(zn);
    map['b'] = Variable<double>(b);
    map['cu'] = Variable<double>(cu);
    map['si'] = Variable<double>(si);
    map['mo'] = Variable<double>(mo);
    map['na'] = Variable<double>(na);
    map['cl'] = Variable<double>(cl);
    return map;
  }

  TissueAnalysisCompanion toCompanion(bool nullToAbsent) {
    return TissueAnalysisCompanion(
      id: Value(id),
      name: Value(name),
      n: Value(n),
      p: Value(p),
      k: Value(k),
      ca: Value(ca),
      mg: Value(mg),
      s: Value(s),
      fe: Value(fe),
      mn: Value(mn),
      zn: Value(zn),
      b: Value(b),
      cu: Value(cu),
      si: Value(si),
      mo: Value(mo),
      na: Value(na),
      cl: Value(cl),
    );
  }

  factory TissueAnalysi.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TissueAnalysi(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      n: serializer.fromJson<double>(json['n']),
      p: serializer.fromJson<double>(json['p']),
      k: serializer.fromJson<double>(json['k']),
      ca: serializer.fromJson<double>(json['ca']),
      mg: serializer.fromJson<double>(json['mg']),
      s: serializer.fromJson<double>(json['s']),
      fe: serializer.fromJson<double>(json['fe']),
      mn: serializer.fromJson<double>(json['mn']),
      zn: serializer.fromJson<double>(json['zn']),
      b: serializer.fromJson<double>(json['b']),
      cu: serializer.fromJson<double>(json['cu']),
      si: serializer.fromJson<double>(json['si']),
      mo: serializer.fromJson<double>(json['mo']),
      na: serializer.fromJson<double>(json['na']),
      cl: serializer.fromJson<double>(json['cl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'n': serializer.toJson<double>(n),
      'p': serializer.toJson<double>(p),
      'k': serializer.toJson<double>(k),
      'ca': serializer.toJson<double>(ca),
      'mg': serializer.toJson<double>(mg),
      's': serializer.toJson<double>(s),
      'fe': serializer.toJson<double>(fe),
      'mn': serializer.toJson<double>(mn),
      'zn': serializer.toJson<double>(zn),
      'b': serializer.toJson<double>(b),
      'cu': serializer.toJson<double>(cu),
      'si': serializer.toJson<double>(si),
      'mo': serializer.toJson<double>(mo),
      'na': serializer.toJson<double>(na),
      'cl': serializer.toJson<double>(cl),
    };
  }

  TissueAnalysi copyWith({
    int? id,
    String? name,
    double? n,
    double? p,
    double? k,
    double? ca,
    double? mg,
    double? s,
    double? fe,
    double? mn,
    double? zn,
    double? b,
    double? cu,
    double? si,
    double? mo,
    double? na,
    double? cl,
  }) => TissueAnalysi(
    id: id ?? this.id,
    name: name ?? this.name,
    n: n ?? this.n,
    p: p ?? this.p,
    k: k ?? this.k,
    ca: ca ?? this.ca,
    mg: mg ?? this.mg,
    s: s ?? this.s,
    fe: fe ?? this.fe,
    mn: mn ?? this.mn,
    zn: zn ?? this.zn,
    b: b ?? this.b,
    cu: cu ?? this.cu,
    si: si ?? this.si,
    mo: mo ?? this.mo,
    na: na ?? this.na,
    cl: cl ?? this.cl,
  );
  TissueAnalysi copyWithCompanion(TissueAnalysisCompanion data) {
    return TissueAnalysi(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      n: data.n.present ? data.n.value : this.n,
      p: data.p.present ? data.p.value : this.p,
      k: data.k.present ? data.k.value : this.k,
      ca: data.ca.present ? data.ca.value : this.ca,
      mg: data.mg.present ? data.mg.value : this.mg,
      s: data.s.present ? data.s.value : this.s,
      fe: data.fe.present ? data.fe.value : this.fe,
      mn: data.mn.present ? data.mn.value : this.mn,
      zn: data.zn.present ? data.zn.value : this.zn,
      b: data.b.present ? data.b.value : this.b,
      cu: data.cu.present ? data.cu.value : this.cu,
      si: data.si.present ? data.si.value : this.si,
      mo: data.mo.present ? data.mo.value : this.mo,
      na: data.na.present ? data.na.value : this.na,
      cl: data.cl.present ? data.cl.value : this.cl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TissueAnalysi(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('n: $n, ')
          ..write('p: $p, ')
          ..write('k: $k, ')
          ..write('ca: $ca, ')
          ..write('mg: $mg, ')
          ..write('s: $s, ')
          ..write('fe: $fe, ')
          ..write('mn: $mn, ')
          ..write('zn: $zn, ')
          ..write('b: $b, ')
          ..write('cu: $cu, ')
          ..write('si: $si, ')
          ..write('mo: $mo, ')
          ..write('na: $na, ')
          ..write('cl: $cl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    n,
    p,
    k,
    ca,
    mg,
    s,
    fe,
    mn,
    zn,
    b,
    cu,
    si,
    mo,
    na,
    cl,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TissueAnalysi &&
          other.id == this.id &&
          other.name == this.name &&
          other.n == this.n &&
          other.p == this.p &&
          other.k == this.k &&
          other.ca == this.ca &&
          other.mg == this.mg &&
          other.s == this.s &&
          other.fe == this.fe &&
          other.mn == this.mn &&
          other.zn == this.zn &&
          other.b == this.b &&
          other.cu == this.cu &&
          other.si == this.si &&
          other.mo == this.mo &&
          other.na == this.na &&
          other.cl == this.cl);
}

class TissueAnalysisCompanion extends UpdateCompanion<TissueAnalysi> {
  final Value<int> id;
  final Value<String> name;
  final Value<double> n;
  final Value<double> p;
  final Value<double> k;
  final Value<double> ca;
  final Value<double> mg;
  final Value<double> s;
  final Value<double> fe;
  final Value<double> mn;
  final Value<double> zn;
  final Value<double> b;
  final Value<double> cu;
  final Value<double> si;
  final Value<double> mo;
  final Value<double> na;
  final Value<double> cl;
  const TissueAnalysisCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.n = const Value.absent(),
    this.p = const Value.absent(),
    this.k = const Value.absent(),
    this.ca = const Value.absent(),
    this.mg = const Value.absent(),
    this.s = const Value.absent(),
    this.fe = const Value.absent(),
    this.mn = const Value.absent(),
    this.zn = const Value.absent(),
    this.b = const Value.absent(),
    this.cu = const Value.absent(),
    this.si = const Value.absent(),
    this.mo = const Value.absent(),
    this.na = const Value.absent(),
    this.cl = const Value.absent(),
  });
  TissueAnalysisCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.n = const Value.absent(),
    this.p = const Value.absent(),
    this.k = const Value.absent(),
    this.ca = const Value.absent(),
    this.mg = const Value.absent(),
    this.s = const Value.absent(),
    this.fe = const Value.absent(),
    this.mn = const Value.absent(),
    this.zn = const Value.absent(),
    this.b = const Value.absent(),
    this.cu = const Value.absent(),
    this.si = const Value.absent(),
    this.mo = const Value.absent(),
    this.na = const Value.absent(),
    this.cl = const Value.absent(),
  }) : name = Value(name);
  static Insertable<TissueAnalysi> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<double>? n,
    Expression<double>? p,
    Expression<double>? k,
    Expression<double>? ca,
    Expression<double>? mg,
    Expression<double>? s,
    Expression<double>? fe,
    Expression<double>? mn,
    Expression<double>? zn,
    Expression<double>? b,
    Expression<double>? cu,
    Expression<double>? si,
    Expression<double>? mo,
    Expression<double>? na,
    Expression<double>? cl,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (n != null) 'n': n,
      if (p != null) 'p': p,
      if (k != null) 'k': k,
      if (ca != null) 'ca': ca,
      if (mg != null) 'mg': mg,
      if (s != null) 's': s,
      if (fe != null) 'fe': fe,
      if (mn != null) 'mn': mn,
      if (zn != null) 'zn': zn,
      if (b != null) 'b': b,
      if (cu != null) 'cu': cu,
      if (si != null) 'si': si,
      if (mo != null) 'mo': mo,
      if (na != null) 'na': na,
      if (cl != null) 'cl': cl,
    });
  }

  TissueAnalysisCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<double>? n,
    Value<double>? p,
    Value<double>? k,
    Value<double>? ca,
    Value<double>? mg,
    Value<double>? s,
    Value<double>? fe,
    Value<double>? mn,
    Value<double>? zn,
    Value<double>? b,
    Value<double>? cu,
    Value<double>? si,
    Value<double>? mo,
    Value<double>? na,
    Value<double>? cl,
  }) {
    return TissueAnalysisCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      n: n ?? this.n,
      p: p ?? this.p,
      k: k ?? this.k,
      ca: ca ?? this.ca,
      mg: mg ?? this.mg,
      s: s ?? this.s,
      fe: fe ?? this.fe,
      mn: mn ?? this.mn,
      zn: zn ?? this.zn,
      b: b ?? this.b,
      cu: cu ?? this.cu,
      si: si ?? this.si,
      mo: mo ?? this.mo,
      na: na ?? this.na,
      cl: cl ?? this.cl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (n.present) {
      map['n'] = Variable<double>(n.value);
    }
    if (p.present) {
      map['p'] = Variable<double>(p.value);
    }
    if (k.present) {
      map['k'] = Variable<double>(k.value);
    }
    if (ca.present) {
      map['ca'] = Variable<double>(ca.value);
    }
    if (mg.present) {
      map['mg'] = Variable<double>(mg.value);
    }
    if (s.present) {
      map['s'] = Variable<double>(s.value);
    }
    if (fe.present) {
      map['fe'] = Variable<double>(fe.value);
    }
    if (mn.present) {
      map['mn'] = Variable<double>(mn.value);
    }
    if (zn.present) {
      map['zn'] = Variable<double>(zn.value);
    }
    if (b.present) {
      map['b'] = Variable<double>(b.value);
    }
    if (cu.present) {
      map['cu'] = Variable<double>(cu.value);
    }
    if (si.present) {
      map['si'] = Variable<double>(si.value);
    }
    if (mo.present) {
      map['mo'] = Variable<double>(mo.value);
    }
    if (na.present) {
      map['na'] = Variable<double>(na.value);
    }
    if (cl.present) {
      map['cl'] = Variable<double>(cl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TissueAnalysisCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('n: $n, ')
          ..write('p: $p, ')
          ..write('k: $k, ')
          ..write('ca: $ca, ')
          ..write('mg: $mg, ')
          ..write('s: $s, ')
          ..write('fe: $fe, ')
          ..write('mn: $mn, ')
          ..write('zn: $zn, ')
          ..write('b: $b, ')
          ..write('cu: $cu, ')
          ..write('si: $si, ')
          ..write('mo: $mo, ')
          ..write('na: $na, ')
          ..write('cl: $cl')
          ..write(')'))
        .toString();
  }
}

class $SubstancesUsedTable extends SubstancesUsed
    with TableInfo<$SubstancesUsedTable, SubstancesUsedData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SubstancesUsedTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _substance_idMeta = const VerificationMeta(
    'substance_id',
  );
  @override
  late final GeneratedColumn<int> substance_id = GeneratedColumn<int>(
    'substance_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES substances (id)',
    ),
  );
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
    'weight',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, substance_id, weight];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'substances_used';
  @override
  VerificationContext validateIntegrity(
    Insertable<SubstancesUsedData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('substance_id')) {
      context.handle(
        _substance_idMeta,
        substance_id.isAcceptableOrUnknown(
          data['substance_id']!,
          _substance_idMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_substance_idMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(
        _weightMeta,
        weight.isAcceptableOrUnknown(data['weight']!, _weightMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SubstancesUsedData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SubstancesUsedData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      substance_id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}substance_id'],
      )!,
      weight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight'],
      ),
    );
  }

  @override
  $SubstancesUsedTable createAlias(String alias) {
    return $SubstancesUsedTable(attachedDatabase, alias);
  }
}

class SubstancesUsedData extends DataClass
    implements Insertable<SubstancesUsedData> {
  final int id;
  final int substance_id;
  final double? weight;
  const SubstancesUsedData({
    required this.id,
    required this.substance_id,
    this.weight,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['substance_id'] = Variable<int>(substance_id);
    if (!nullToAbsent || weight != null) {
      map['weight'] = Variable<double>(weight);
    }
    return map;
  }

  SubstancesUsedCompanion toCompanion(bool nullToAbsent) {
    return SubstancesUsedCompanion(
      id: Value(id),
      substance_id: Value(substance_id),
      weight: weight == null && nullToAbsent
          ? const Value.absent()
          : Value(weight),
    );
  }

  factory SubstancesUsedData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SubstancesUsedData(
      id: serializer.fromJson<int>(json['id']),
      substance_id: serializer.fromJson<int>(json['substance_id']),
      weight: serializer.fromJson<double?>(json['weight']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'substance_id': serializer.toJson<int>(substance_id),
      'weight': serializer.toJson<double?>(weight),
    };
  }

  SubstancesUsedData copyWith({
    int? id,
    int? substance_id,
    Value<double?> weight = const Value.absent(),
  }) => SubstancesUsedData(
    id: id ?? this.id,
    substance_id: substance_id ?? this.substance_id,
    weight: weight.present ? weight.value : this.weight,
  );
  SubstancesUsedData copyWithCompanion(SubstancesUsedCompanion data) {
    return SubstancesUsedData(
      id: data.id.present ? data.id.value : this.id,
      substance_id: data.substance_id.present
          ? data.substance_id.value
          : this.substance_id,
      weight: data.weight.present ? data.weight.value : this.weight,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SubstancesUsedData(')
          ..write('id: $id, ')
          ..write('substance_id: $substance_id, ')
          ..write('weight: $weight')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, substance_id, weight);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SubstancesUsedData &&
          other.id == this.id &&
          other.substance_id == this.substance_id &&
          other.weight == this.weight);
}

class SubstancesUsedCompanion extends UpdateCompanion<SubstancesUsedData> {
  final Value<int> id;
  final Value<int> substance_id;
  final Value<double?> weight;
  const SubstancesUsedCompanion({
    this.id = const Value.absent(),
    this.substance_id = const Value.absent(),
    this.weight = const Value.absent(),
  });
  SubstancesUsedCompanion.insert({
    this.id = const Value.absent(),
    required int substance_id,
    this.weight = const Value.absent(),
  }) : substance_id = Value(substance_id);
  static Insertable<SubstancesUsedData> custom({
    Expression<int>? id,
    Expression<int>? substance_id,
    Expression<double>? weight,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (substance_id != null) 'substance_id': substance_id,
      if (weight != null) 'weight': weight,
    });
  }

  SubstancesUsedCompanion copyWith({
    Value<int>? id,
    Value<int>? substance_id,
    Value<double?>? weight,
  }) {
    return SubstancesUsedCompanion(
      id: id ?? this.id,
      substance_id: substance_id ?? this.substance_id,
      weight: weight ?? this.weight,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (substance_id.present) {
      map['substance_id'] = Variable<int>(substance_id.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SubstancesUsedCompanion(')
          ..write('id: $id, ')
          ..write('substance_id: $substance_id, ')
          ..write('weight: $weight')
          ..write(')'))
        .toString();
  }
}

class $TankBatchesTable extends TankBatches
    with TableInfo<$TankBatchesTable, TankBatche> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TankBatchesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _formulation_idMeta = const VerificationMeta(
    'formulation_id',
  );
  @override
  late final GeneratedColumn<int> formulation_id = GeneratedColumn<int>(
    'formulation_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES formulations (id)',
    ),
  );
  static const VerificationMeta _volumeMeta = const VerificationMeta('volume');
  @override
  late final GeneratedColumn<double> volume = GeneratedColumn<double>(
    'volume',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _volume_remainingMeta = const VerificationMeta(
    'volume_remaining',
  );
  @override
  late final GeneratedColumn<double> volume_remaining = GeneratedColumn<double>(
    'volume_remaining',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _prepared_atMeta = const VerificationMeta(
    'prepared_at',
  );
  @override
  late final GeneratedColumn<String> prepared_at = GeneratedColumn<String>(
    'prepared_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    formulation_id,
    volume,
    volume_remaining,
    prepared_at,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tank_batches';
  @override
  VerificationContext validateIntegrity(
    Insertable<TankBatche> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('formulation_id')) {
      context.handle(
        _formulation_idMeta,
        formulation_id.isAcceptableOrUnknown(
          data['formulation_id']!,
          _formulation_idMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_formulation_idMeta);
    }
    if (data.containsKey('volume')) {
      context.handle(
        _volumeMeta,
        volume.isAcceptableOrUnknown(data['volume']!, _volumeMeta),
      );
    } else if (isInserting) {
      context.missing(_volumeMeta);
    }
    if (data.containsKey('volume_remaining')) {
      context.handle(
        _volume_remainingMeta,
        volume_remaining.isAcceptableOrUnknown(
          data['volume_remaining']!,
          _volume_remainingMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_volume_remainingMeta);
    }
    if (data.containsKey('prepared_at')) {
      context.handle(
        _prepared_atMeta,
        prepared_at.isAcceptableOrUnknown(
          data['prepared_at']!,
          _prepared_atMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_prepared_atMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TankBatche map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TankBatche(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      formulation_id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}formulation_id'],
      )!,
      volume: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}volume'],
      )!,
      volume_remaining: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}volume_remaining'],
      )!,
      prepared_at: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}prepared_at'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $TankBatchesTable createAlias(String alias) {
    return $TankBatchesTable(attachedDatabase, alias);
  }
}

class TankBatche extends DataClass implements Insertable<TankBatche> {
  final int id;
  final String name;
  final int formulation_id;
  final double volume;
  final double volume_remaining;
  final String prepared_at;
  final String? notes;
  const TankBatche({
    required this.id,
    required this.name,
    required this.formulation_id,
    required this.volume,
    required this.volume_remaining,
    required this.prepared_at,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['formulation_id'] = Variable<int>(formulation_id);
    map['volume'] = Variable<double>(volume);
    map['volume_remaining'] = Variable<double>(volume_remaining);
    map['prepared_at'] = Variable<String>(prepared_at);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  TankBatchesCompanion toCompanion(bool nullToAbsent) {
    return TankBatchesCompanion(
      id: Value(id),
      name: Value(name),
      formulation_id: Value(formulation_id),
      volume: Value(volume),
      volume_remaining: Value(volume_remaining),
      prepared_at: Value(prepared_at),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory TankBatche.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TankBatche(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      formulation_id: serializer.fromJson<int>(json['formulation_id']),
      volume: serializer.fromJson<double>(json['volume']),
      volume_remaining: serializer.fromJson<double>(json['volume_remaining']),
      prepared_at: serializer.fromJson<String>(json['prepared_at']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'formulation_id': serializer.toJson<int>(formulation_id),
      'volume': serializer.toJson<double>(volume),
      'volume_remaining': serializer.toJson<double>(volume_remaining),
      'prepared_at': serializer.toJson<String>(prepared_at),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  TankBatche copyWith({
    int? id,
    String? name,
    int? formulation_id,
    double? volume,
    double? volume_remaining,
    String? prepared_at,
    Value<String?> notes = const Value.absent(),
  }) => TankBatche(
    id: id ?? this.id,
    name: name ?? this.name,
    formulation_id: formulation_id ?? this.formulation_id,
    volume: volume ?? this.volume,
    volume_remaining: volume_remaining ?? this.volume_remaining,
    prepared_at: prepared_at ?? this.prepared_at,
    notes: notes.present ? notes.value : this.notes,
  );
  TankBatche copyWithCompanion(TankBatchesCompanion data) {
    return TankBatche(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      formulation_id: data.formulation_id.present
          ? data.formulation_id.value
          : this.formulation_id,
      volume: data.volume.present ? data.volume.value : this.volume,
      volume_remaining: data.volume_remaining.present
          ? data.volume_remaining.value
          : this.volume_remaining,
      prepared_at: data.prepared_at.present
          ? data.prepared_at.value
          : this.prepared_at,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TankBatche(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('formulation_id: $formulation_id, ')
          ..write('volume: $volume, ')
          ..write('volume_remaining: $volume_remaining, ')
          ..write('prepared_at: $prepared_at, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    formulation_id,
    volume,
    volume_remaining,
    prepared_at,
    notes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TankBatche &&
          other.id == this.id &&
          other.name == this.name &&
          other.formulation_id == this.formulation_id &&
          other.volume == this.volume &&
          other.volume_remaining == this.volume_remaining &&
          other.prepared_at == this.prepared_at &&
          other.notes == this.notes);
}

class TankBatchesCompanion extends UpdateCompanion<TankBatche> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> formulation_id;
  final Value<double> volume;
  final Value<double> volume_remaining;
  final Value<String> prepared_at;
  final Value<String?> notes;
  const TankBatchesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.formulation_id = const Value.absent(),
    this.volume = const Value.absent(),
    this.volume_remaining = const Value.absent(),
    this.prepared_at = const Value.absent(),
    this.notes = const Value.absent(),
  });
  TankBatchesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int formulation_id,
    required double volume,
    required double volume_remaining,
    required String prepared_at,
    this.notes = const Value.absent(),
  }) : name = Value(name),
       formulation_id = Value(formulation_id),
       volume = Value(volume),
       volume_remaining = Value(volume_remaining),
       prepared_at = Value(prepared_at);
  static Insertable<TankBatche> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? formulation_id,
    Expression<double>? volume,
    Expression<double>? volume_remaining,
    Expression<String>? prepared_at,
    Expression<String>? notes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (formulation_id != null) 'formulation_id': formulation_id,
      if (volume != null) 'volume': volume,
      if (volume_remaining != null) 'volume_remaining': volume_remaining,
      if (prepared_at != null) 'prepared_at': prepared_at,
      if (notes != null) 'notes': notes,
    });
  }

  TankBatchesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<int>? formulation_id,
    Value<double>? volume,
    Value<double>? volume_remaining,
    Value<String>? prepared_at,
    Value<String?>? notes,
  }) {
    return TankBatchesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      formulation_id: formulation_id ?? this.formulation_id,
      volume: volume ?? this.volume,
      volume_remaining: volume_remaining ?? this.volume_remaining,
      prepared_at: prepared_at ?? this.prepared_at,
      notes: notes ?? this.notes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (formulation_id.present) {
      map['formulation_id'] = Variable<int>(formulation_id.value);
    }
    if (volume.present) {
      map['volume'] = Variable<double>(volume.value);
    }
    if (volume_remaining.present) {
      map['volume_remaining'] = Variable<double>(volume_remaining.value);
    }
    if (prepared_at.present) {
      map['prepared_at'] = Variable<String>(prepared_at.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TankBatchesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('formulation_id: $formulation_id, ')
          ..write('volume: $volume, ')
          ..write('volume_remaining: $volume_remaining, ')
          ..write('prepared_at: $prepared_at, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

class $TankUsageEventsTable extends TankUsageEvents
    with TableInfo<$TankUsageEventsTable, TankUsageEvent> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TankUsageEventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _tank_batch_idMeta = const VerificationMeta(
    'tank_batch_id',
  );
  @override
  late final GeneratedColumn<int> tank_batch_id = GeneratedColumn<int>(
    'tank_batch_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES tank_batches (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _event_typeMeta = const VerificationMeta(
    'event_type',
  );
  @override
  late final GeneratedColumn<String> event_type = GeneratedColumn<String>(
    'event_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _volumeMeta = const VerificationMeta('volume');
  @override
  late final GeneratedColumn<double> volume = GeneratedColumn<double>(
    'volume',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _created_atMeta = const VerificationMeta(
    'created_at',
  );
  @override
  late final GeneratedColumn<String> created_at = GeneratedColumn<String>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    tank_batch_id,
    event_type,
    volume,
    created_at,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tank_usage_events';
  @override
  VerificationContext validateIntegrity(
    Insertable<TankUsageEvent> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('tank_batch_id')) {
      context.handle(
        _tank_batch_idMeta,
        tank_batch_id.isAcceptableOrUnknown(
          data['tank_batch_id']!,
          _tank_batch_idMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_tank_batch_idMeta);
    }
    if (data.containsKey('event_type')) {
      context.handle(
        _event_typeMeta,
        event_type.isAcceptableOrUnknown(data['event_type']!, _event_typeMeta),
      );
    } else if (isInserting) {
      context.missing(_event_typeMeta);
    }
    if (data.containsKey('volume')) {
      context.handle(
        _volumeMeta,
        volume.isAcceptableOrUnknown(data['volume']!, _volumeMeta),
      );
    } else if (isInserting) {
      context.missing(_volumeMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _created_atMeta,
        created_at.isAcceptableOrUnknown(data['created_at']!, _created_atMeta),
      );
    } else if (isInserting) {
      context.missing(_created_atMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TankUsageEvent map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TankUsageEvent(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      tank_batch_id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tank_batch_id'],
      )!,
      event_type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}event_type'],
      )!,
      volume: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}volume'],
      )!,
      created_at: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $TankUsageEventsTable createAlias(String alias) {
    return $TankUsageEventsTable(attachedDatabase, alias);
  }
}

class TankUsageEvent extends DataClass implements Insertable<TankUsageEvent> {
  final int id;
  final int tank_batch_id;
  final String event_type;
  final double volume;
  final String created_at;
  final String? notes;
  const TankUsageEvent({
    required this.id,
    required this.tank_batch_id,
    required this.event_type,
    required this.volume,
    required this.created_at,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['tank_batch_id'] = Variable<int>(tank_batch_id);
    map['event_type'] = Variable<String>(event_type);
    map['volume'] = Variable<double>(volume);
    map['created_at'] = Variable<String>(created_at);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  TankUsageEventsCompanion toCompanion(bool nullToAbsent) {
    return TankUsageEventsCompanion(
      id: Value(id),
      tank_batch_id: Value(tank_batch_id),
      event_type: Value(event_type),
      volume: Value(volume),
      created_at: Value(created_at),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory TankUsageEvent.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TankUsageEvent(
      id: serializer.fromJson<int>(json['id']),
      tank_batch_id: serializer.fromJson<int>(json['tank_batch_id']),
      event_type: serializer.fromJson<String>(json['event_type']),
      volume: serializer.fromJson<double>(json['volume']),
      created_at: serializer.fromJson<String>(json['created_at']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'tank_batch_id': serializer.toJson<int>(tank_batch_id),
      'event_type': serializer.toJson<String>(event_type),
      'volume': serializer.toJson<double>(volume),
      'created_at': serializer.toJson<String>(created_at),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  TankUsageEvent copyWith({
    int? id,
    int? tank_batch_id,
    String? event_type,
    double? volume,
    String? created_at,
    Value<String?> notes = const Value.absent(),
  }) => TankUsageEvent(
    id: id ?? this.id,
    tank_batch_id: tank_batch_id ?? this.tank_batch_id,
    event_type: event_type ?? this.event_type,
    volume: volume ?? this.volume,
    created_at: created_at ?? this.created_at,
    notes: notes.present ? notes.value : this.notes,
  );
  TankUsageEvent copyWithCompanion(TankUsageEventsCompanion data) {
    return TankUsageEvent(
      id: data.id.present ? data.id.value : this.id,
      tank_batch_id: data.tank_batch_id.present
          ? data.tank_batch_id.value
          : this.tank_batch_id,
      event_type: data.event_type.present
          ? data.event_type.value
          : this.event_type,
      volume: data.volume.present ? data.volume.value : this.volume,
      created_at: data.created_at.present
          ? data.created_at.value
          : this.created_at,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TankUsageEvent(')
          ..write('id: $id, ')
          ..write('tank_batch_id: $tank_batch_id, ')
          ..write('event_type: $event_type, ')
          ..write('volume: $volume, ')
          ..write('created_at: $created_at, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, tank_batch_id, event_type, volume, created_at, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TankUsageEvent &&
          other.id == this.id &&
          other.tank_batch_id == this.tank_batch_id &&
          other.event_type == this.event_type &&
          other.volume == this.volume &&
          other.created_at == this.created_at &&
          other.notes == this.notes);
}

class TankUsageEventsCompanion extends UpdateCompanion<TankUsageEvent> {
  final Value<int> id;
  final Value<int> tank_batch_id;
  final Value<String> event_type;
  final Value<double> volume;
  final Value<String> created_at;
  final Value<String?> notes;
  const TankUsageEventsCompanion({
    this.id = const Value.absent(),
    this.tank_batch_id = const Value.absent(),
    this.event_type = const Value.absent(),
    this.volume = const Value.absent(),
    this.created_at = const Value.absent(),
    this.notes = const Value.absent(),
  });
  TankUsageEventsCompanion.insert({
    this.id = const Value.absent(),
    required int tank_batch_id,
    required String event_type,
    required double volume,
    required String created_at,
    this.notes = const Value.absent(),
  }) : tank_batch_id = Value(tank_batch_id),
       event_type = Value(event_type),
       volume = Value(volume),
       created_at = Value(created_at);
  static Insertable<TankUsageEvent> custom({
    Expression<int>? id,
    Expression<int>? tank_batch_id,
    Expression<String>? event_type,
    Expression<double>? volume,
    Expression<String>? created_at,
    Expression<String>? notes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tank_batch_id != null) 'tank_batch_id': tank_batch_id,
      if (event_type != null) 'event_type': event_type,
      if (volume != null) 'volume': volume,
      if (created_at != null) 'created_at': created_at,
      if (notes != null) 'notes': notes,
    });
  }

  TankUsageEventsCompanion copyWith({
    Value<int>? id,
    Value<int>? tank_batch_id,
    Value<String>? event_type,
    Value<double>? volume,
    Value<String>? created_at,
    Value<String?>? notes,
  }) {
    return TankUsageEventsCompanion(
      id: id ?? this.id,
      tank_batch_id: tank_batch_id ?? this.tank_batch_id,
      event_type: event_type ?? this.event_type,
      volume: volume ?? this.volume,
      created_at: created_at ?? this.created_at,
      notes: notes ?? this.notes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (tank_batch_id.present) {
      map['tank_batch_id'] = Variable<int>(tank_batch_id.value);
    }
    if (event_type.present) {
      map['event_type'] = Variable<String>(event_type.value);
    }
    if (volume.present) {
      map['volume'] = Variable<double>(volume.value);
    }
    if (created_at.present) {
      map['created_at'] = Variable<String>(created_at.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TankUsageEventsCompanion(')
          ..write('id: $id, ')
          ..write('tank_batch_id: $tank_batch_id, ')
          ..write('event_type: $event_type, ')
          ..write('volume: $volume, ')
          ..write('created_at: $created_at, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SubstancesTable substances = $SubstancesTable(this);
  late final $FormulationsTable formulations = $FormulationsTable(this);
  late final $FormulationSnapshotsTable formulationSnapshots =
      $FormulationSnapshotsTable(this);
  late final $WaterQualityTable waterQuality = $WaterQualityTable(this);
  late final $TissueAnalysisTable tissueAnalysis = $TissueAnalysisTable(this);
  late final $SubstancesUsedTable substancesUsed = $SubstancesUsedTable(this);
  late final $TankBatchesTable tankBatches = $TankBatchesTable(this);
  late final $TankUsageEventsTable tankUsageEvents = $TankUsageEventsTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    substances,
    formulations,
    formulationSnapshots,
    waterQuality,
    tissueAnalysis,
    substancesUsed,
    tankBatches,
    tankUsageEvents,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'formulations',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('formulation_snapshots', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'tank_batches',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('tank_usage_events', kind: UpdateKind.delete)],
    ),
  ]);
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef $$SubstancesTableCreateCompanionBuilder =
    SubstancesCompanion Function({
      Value<int> id,
      required String name,
      Value<String?> formula,
      Value<String?> source,
      Value<double> purity,
      Value<double> cost,
      Value<bool> is_liquid,
      Value<double> density,
      Value<String?> conc_type,
      Value<double> n_no3,
      Value<double> n_nh4,
      Value<double> p,
      Value<double> k,
      Value<double> ca,
      Value<double> mg,
      Value<double> s,
      Value<double> fe,
      Value<double> mn,
      Value<double> zn,
      Value<double> b,
      Value<double> cu,
      Value<double> si,
      Value<double> mo,
      Value<double> na,
      Value<double> cl,
    });
typedef $$SubstancesTableUpdateCompanionBuilder =
    SubstancesCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> formula,
      Value<String?> source,
      Value<double> purity,
      Value<double> cost,
      Value<bool> is_liquid,
      Value<double> density,
      Value<String?> conc_type,
      Value<double> n_no3,
      Value<double> n_nh4,
      Value<double> p,
      Value<double> k,
      Value<double> ca,
      Value<double> mg,
      Value<double> s,
      Value<double> fe,
      Value<double> mn,
      Value<double> zn,
      Value<double> b,
      Value<double> cu,
      Value<double> si,
      Value<double> mo,
      Value<double> na,
      Value<double> cl,
    });

final class $$SubstancesTableReferences
    extends BaseReferences<_$AppDatabase, $SubstancesTable, Substance> {
  $$SubstancesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$SubstancesUsedTable, List<SubstancesUsedData>>
  _substancesUsedRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.substancesUsed,
    aliasName: $_aliasNameGenerator(
      db.substances.id,
      db.substancesUsed.substance_id,
    ),
  );

  $$SubstancesUsedTableProcessedTableManager get substancesUsedRefs {
    final manager = $$SubstancesUsedTableTableManager(
      $_db,
      $_db.substancesUsed,
    ).filter((f) => f.substance_id.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_substancesUsedRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SubstancesTableFilterComposer
    extends Composer<_$AppDatabase, $SubstancesTable> {
  $$SubstancesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get formula => $composableBuilder(
    column: $table.formula,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get purity => $composableBuilder(
    column: $table.purity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get cost => $composableBuilder(
    column: $table.cost,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get is_liquid => $composableBuilder(
    column: $table.is_liquid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get density => $composableBuilder(
    column: $table.density,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get conc_type => $composableBuilder(
    column: $table.conc_type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get n_no3 => $composableBuilder(
    column: $table.n_no3,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get n_nh4 => $composableBuilder(
    column: $table.n_nh4,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get p => $composableBuilder(
    column: $table.p,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get k => $composableBuilder(
    column: $table.k,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get ca => $composableBuilder(
    column: $table.ca,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get mg => $composableBuilder(
    column: $table.mg,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get s => $composableBuilder(
    column: $table.s,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get fe => $composableBuilder(
    column: $table.fe,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get mn => $composableBuilder(
    column: $table.mn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get zn => $composableBuilder(
    column: $table.zn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get b => $composableBuilder(
    column: $table.b,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get cu => $composableBuilder(
    column: $table.cu,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get si => $composableBuilder(
    column: $table.si,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get mo => $composableBuilder(
    column: $table.mo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get na => $composableBuilder(
    column: $table.na,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get cl => $composableBuilder(
    column: $table.cl,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> substancesUsedRefs(
    Expression<bool> Function($$SubstancesUsedTableFilterComposer f) f,
  ) {
    final $$SubstancesUsedTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.substancesUsed,
      getReferencedColumn: (t) => t.substance_id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubstancesUsedTableFilterComposer(
            $db: $db,
            $table: $db.substancesUsed,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SubstancesTableOrderingComposer
    extends Composer<_$AppDatabase, $SubstancesTable> {
  $$SubstancesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get formula => $composableBuilder(
    column: $table.formula,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get purity => $composableBuilder(
    column: $table.purity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get cost => $composableBuilder(
    column: $table.cost,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get is_liquid => $composableBuilder(
    column: $table.is_liquid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get density => $composableBuilder(
    column: $table.density,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get conc_type => $composableBuilder(
    column: $table.conc_type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get n_no3 => $composableBuilder(
    column: $table.n_no3,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get n_nh4 => $composableBuilder(
    column: $table.n_nh4,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get p => $composableBuilder(
    column: $table.p,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get k => $composableBuilder(
    column: $table.k,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get ca => $composableBuilder(
    column: $table.ca,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get mg => $composableBuilder(
    column: $table.mg,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get s => $composableBuilder(
    column: $table.s,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get fe => $composableBuilder(
    column: $table.fe,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get mn => $composableBuilder(
    column: $table.mn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get zn => $composableBuilder(
    column: $table.zn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get b => $composableBuilder(
    column: $table.b,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get cu => $composableBuilder(
    column: $table.cu,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get si => $composableBuilder(
    column: $table.si,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get mo => $composableBuilder(
    column: $table.mo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get na => $composableBuilder(
    column: $table.na,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get cl => $composableBuilder(
    column: $table.cl,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SubstancesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SubstancesTable> {
  $$SubstancesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get formula =>
      $composableBuilder(column: $table.formula, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<double> get purity =>
      $composableBuilder(column: $table.purity, builder: (column) => column);

  GeneratedColumn<double> get cost =>
      $composableBuilder(column: $table.cost, builder: (column) => column);

  GeneratedColumn<bool> get is_liquid =>
      $composableBuilder(column: $table.is_liquid, builder: (column) => column);

  GeneratedColumn<double> get density =>
      $composableBuilder(column: $table.density, builder: (column) => column);

  GeneratedColumn<String> get conc_type =>
      $composableBuilder(column: $table.conc_type, builder: (column) => column);

  GeneratedColumn<double> get n_no3 =>
      $composableBuilder(column: $table.n_no3, builder: (column) => column);

  GeneratedColumn<double> get n_nh4 =>
      $composableBuilder(column: $table.n_nh4, builder: (column) => column);

  GeneratedColumn<double> get p =>
      $composableBuilder(column: $table.p, builder: (column) => column);

  GeneratedColumn<double> get k =>
      $composableBuilder(column: $table.k, builder: (column) => column);

  GeneratedColumn<double> get ca =>
      $composableBuilder(column: $table.ca, builder: (column) => column);

  GeneratedColumn<double> get mg =>
      $composableBuilder(column: $table.mg, builder: (column) => column);

  GeneratedColumn<double> get s =>
      $composableBuilder(column: $table.s, builder: (column) => column);

  GeneratedColumn<double> get fe =>
      $composableBuilder(column: $table.fe, builder: (column) => column);

  GeneratedColumn<double> get mn =>
      $composableBuilder(column: $table.mn, builder: (column) => column);

  GeneratedColumn<double> get zn =>
      $composableBuilder(column: $table.zn, builder: (column) => column);

  GeneratedColumn<double> get b =>
      $composableBuilder(column: $table.b, builder: (column) => column);

  GeneratedColumn<double> get cu =>
      $composableBuilder(column: $table.cu, builder: (column) => column);

  GeneratedColumn<double> get si =>
      $composableBuilder(column: $table.si, builder: (column) => column);

  GeneratedColumn<double> get mo =>
      $composableBuilder(column: $table.mo, builder: (column) => column);

  GeneratedColumn<double> get na =>
      $composableBuilder(column: $table.na, builder: (column) => column);

  GeneratedColumn<double> get cl =>
      $composableBuilder(column: $table.cl, builder: (column) => column);

  Expression<T> substancesUsedRefs<T extends Object>(
    Expression<T> Function($$SubstancesUsedTableAnnotationComposer a) f,
  ) {
    final $$SubstancesUsedTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.substancesUsed,
      getReferencedColumn: (t) => t.substance_id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubstancesUsedTableAnnotationComposer(
            $db: $db,
            $table: $db.substancesUsed,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SubstancesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SubstancesTable,
          Substance,
          $$SubstancesTableFilterComposer,
          $$SubstancesTableOrderingComposer,
          $$SubstancesTableAnnotationComposer,
          $$SubstancesTableCreateCompanionBuilder,
          $$SubstancesTableUpdateCompanionBuilder,
          (Substance, $$SubstancesTableReferences),
          Substance,
          PrefetchHooks Function({bool substancesUsedRefs})
        > {
  $$SubstancesTableTableManager(_$AppDatabase db, $SubstancesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SubstancesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SubstancesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SubstancesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> formula = const Value.absent(),
                Value<String?> source = const Value.absent(),
                Value<double> purity = const Value.absent(),
                Value<double> cost = const Value.absent(),
                Value<bool> is_liquid = const Value.absent(),
                Value<double> density = const Value.absent(),
                Value<String?> conc_type = const Value.absent(),
                Value<double> n_no3 = const Value.absent(),
                Value<double> n_nh4 = const Value.absent(),
                Value<double> p = const Value.absent(),
                Value<double> k = const Value.absent(),
                Value<double> ca = const Value.absent(),
                Value<double> mg = const Value.absent(),
                Value<double> s = const Value.absent(),
                Value<double> fe = const Value.absent(),
                Value<double> mn = const Value.absent(),
                Value<double> zn = const Value.absent(),
                Value<double> b = const Value.absent(),
                Value<double> cu = const Value.absent(),
                Value<double> si = const Value.absent(),
                Value<double> mo = const Value.absent(),
                Value<double> na = const Value.absent(),
                Value<double> cl = const Value.absent(),
              }) => SubstancesCompanion(
                id: id,
                name: name,
                formula: formula,
                source: source,
                purity: purity,
                cost: cost,
                is_liquid: is_liquid,
                density: density,
                conc_type: conc_type,
                n_no3: n_no3,
                n_nh4: n_nh4,
                p: p,
                k: k,
                ca: ca,
                mg: mg,
                s: s,
                fe: fe,
                mn: mn,
                zn: zn,
                b: b,
                cu: cu,
                si: si,
                mo: mo,
                na: na,
                cl: cl,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> formula = const Value.absent(),
                Value<String?> source = const Value.absent(),
                Value<double> purity = const Value.absent(),
                Value<double> cost = const Value.absent(),
                Value<bool> is_liquid = const Value.absent(),
                Value<double> density = const Value.absent(),
                Value<String?> conc_type = const Value.absent(),
                Value<double> n_no3 = const Value.absent(),
                Value<double> n_nh4 = const Value.absent(),
                Value<double> p = const Value.absent(),
                Value<double> k = const Value.absent(),
                Value<double> ca = const Value.absent(),
                Value<double> mg = const Value.absent(),
                Value<double> s = const Value.absent(),
                Value<double> fe = const Value.absent(),
                Value<double> mn = const Value.absent(),
                Value<double> zn = const Value.absent(),
                Value<double> b = const Value.absent(),
                Value<double> cu = const Value.absent(),
                Value<double> si = const Value.absent(),
                Value<double> mo = const Value.absent(),
                Value<double> na = const Value.absent(),
                Value<double> cl = const Value.absent(),
              }) => SubstancesCompanion.insert(
                id: id,
                name: name,
                formula: formula,
                source: source,
                purity: purity,
                cost: cost,
                is_liquid: is_liquid,
                density: density,
                conc_type: conc_type,
                n_no3: n_no3,
                n_nh4: n_nh4,
                p: p,
                k: k,
                ca: ca,
                mg: mg,
                s: s,
                fe: fe,
                mn: mn,
                zn: zn,
                b: b,
                cu: cu,
                si: si,
                mo: mo,
                na: na,
                cl: cl,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SubstancesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({substancesUsedRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (substancesUsedRefs) db.substancesUsed,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (substancesUsedRefs)
                    await $_getPrefetchedData<
                      Substance,
                      $SubstancesTable,
                      SubstancesUsedData
                    >(
                      currentTable: table,
                      referencedTable: $$SubstancesTableReferences
                          ._substancesUsedRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$SubstancesTableReferences(
                            db,
                            table,
                            p0,
                          ).substancesUsedRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.substance_id == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$SubstancesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SubstancesTable,
      Substance,
      $$SubstancesTableFilterComposer,
      $$SubstancesTableOrderingComposer,
      $$SubstancesTableAnnotationComposer,
      $$SubstancesTableCreateCompanionBuilder,
      $$SubstancesTableUpdateCompanionBuilder,
      (Substance, $$SubstancesTableReferences),
      Substance,
      PrefetchHooks Function({bool substancesUsedRefs})
    >;
typedef $$FormulationsTableCreateCompanionBuilder =
    FormulationsCompanion Function({
      Value<int> id,
      required String name,
      Value<String> units,
      required String created_at,
      required String updated_at,
      Value<double> n_no3,
      Value<double> n_nh4,
      Value<double> p,
      Value<double> k,
      Value<double> ca,
      Value<double> mg,
      Value<double> s,
      Value<double> fe,
      Value<double> mn,
      Value<double> zn,
      Value<double> b,
      Value<double> cu,
      Value<double> si,
      Value<double> mo,
      Value<double> na,
      Value<double> cl,
    });
typedef $$FormulationsTableUpdateCompanionBuilder =
    FormulationsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> units,
      Value<String> created_at,
      Value<String> updated_at,
      Value<double> n_no3,
      Value<double> n_nh4,
      Value<double> p,
      Value<double> k,
      Value<double> ca,
      Value<double> mg,
      Value<double> s,
      Value<double> fe,
      Value<double> mn,
      Value<double> zn,
      Value<double> b,
      Value<double> cu,
      Value<double> si,
      Value<double> mo,
      Value<double> na,
      Value<double> cl,
    });

final class $$FormulationsTableReferences
    extends BaseReferences<_$AppDatabase, $FormulationsTable, Formulation> {
  $$FormulationsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<
    $FormulationSnapshotsTable,
    List<FormulationSnapshot>
  >
  _formulationSnapshotsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.formulationSnapshots,
        aliasName: $_aliasNameGenerator(
          db.formulations.id,
          db.formulationSnapshots.formulation_id,
        ),
      );

  $$FormulationSnapshotsTableProcessedTableManager
  get formulationSnapshotsRefs {
    final manager = $$FormulationSnapshotsTableTableManager(
      $_db,
      $_db.formulationSnapshots,
    ).filter((f) => f.formulation_id.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _formulationSnapshotsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$TankBatchesTable, List<TankBatche>>
  _tankBatchesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.tankBatches,
    aliasName: $_aliasNameGenerator(
      db.formulations.id,
      db.tankBatches.formulation_id,
    ),
  );

  $$TankBatchesTableProcessedTableManager get tankBatchesRefs {
    final manager = $$TankBatchesTableTableManager(
      $_db,
      $_db.tankBatches,
    ).filter((f) => f.formulation_id.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_tankBatchesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$FormulationsTableFilterComposer
    extends Composer<_$AppDatabase, $FormulationsTable> {
  $$FormulationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get units => $composableBuilder(
    column: $table.units,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get created_at => $composableBuilder(
    column: $table.created_at,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updated_at => $composableBuilder(
    column: $table.updated_at,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get n_no3 => $composableBuilder(
    column: $table.n_no3,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get n_nh4 => $composableBuilder(
    column: $table.n_nh4,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get p => $composableBuilder(
    column: $table.p,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get k => $composableBuilder(
    column: $table.k,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get ca => $composableBuilder(
    column: $table.ca,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get mg => $composableBuilder(
    column: $table.mg,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get s => $composableBuilder(
    column: $table.s,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get fe => $composableBuilder(
    column: $table.fe,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get mn => $composableBuilder(
    column: $table.mn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get zn => $composableBuilder(
    column: $table.zn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get b => $composableBuilder(
    column: $table.b,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get cu => $composableBuilder(
    column: $table.cu,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get si => $composableBuilder(
    column: $table.si,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get mo => $composableBuilder(
    column: $table.mo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get na => $composableBuilder(
    column: $table.na,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get cl => $composableBuilder(
    column: $table.cl,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> formulationSnapshotsRefs(
    Expression<bool> Function($$FormulationSnapshotsTableFilterComposer f) f,
  ) {
    final $$FormulationSnapshotsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.formulationSnapshots,
      getReferencedColumn: (t) => t.formulation_id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FormulationSnapshotsTableFilterComposer(
            $db: $db,
            $table: $db.formulationSnapshots,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> tankBatchesRefs(
    Expression<bool> Function($$TankBatchesTableFilterComposer f) f,
  ) {
    final $$TankBatchesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tankBatches,
      getReferencedColumn: (t) => t.formulation_id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TankBatchesTableFilterComposer(
            $db: $db,
            $table: $db.tankBatches,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$FormulationsTableOrderingComposer
    extends Composer<_$AppDatabase, $FormulationsTable> {
  $$FormulationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get units => $composableBuilder(
    column: $table.units,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get created_at => $composableBuilder(
    column: $table.created_at,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updated_at => $composableBuilder(
    column: $table.updated_at,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get n_no3 => $composableBuilder(
    column: $table.n_no3,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get n_nh4 => $composableBuilder(
    column: $table.n_nh4,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get p => $composableBuilder(
    column: $table.p,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get k => $composableBuilder(
    column: $table.k,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get ca => $composableBuilder(
    column: $table.ca,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get mg => $composableBuilder(
    column: $table.mg,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get s => $composableBuilder(
    column: $table.s,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get fe => $composableBuilder(
    column: $table.fe,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get mn => $composableBuilder(
    column: $table.mn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get zn => $composableBuilder(
    column: $table.zn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get b => $composableBuilder(
    column: $table.b,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get cu => $composableBuilder(
    column: $table.cu,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get si => $composableBuilder(
    column: $table.si,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get mo => $composableBuilder(
    column: $table.mo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get na => $composableBuilder(
    column: $table.na,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get cl => $composableBuilder(
    column: $table.cl,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FormulationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FormulationsTable> {
  $$FormulationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get units =>
      $composableBuilder(column: $table.units, builder: (column) => column);

  GeneratedColumn<String> get created_at => $composableBuilder(
    column: $table.created_at,
    builder: (column) => column,
  );

  GeneratedColumn<String> get updated_at => $composableBuilder(
    column: $table.updated_at,
    builder: (column) => column,
  );

  GeneratedColumn<double> get n_no3 =>
      $composableBuilder(column: $table.n_no3, builder: (column) => column);

  GeneratedColumn<double> get n_nh4 =>
      $composableBuilder(column: $table.n_nh4, builder: (column) => column);

  GeneratedColumn<double> get p =>
      $composableBuilder(column: $table.p, builder: (column) => column);

  GeneratedColumn<double> get k =>
      $composableBuilder(column: $table.k, builder: (column) => column);

  GeneratedColumn<double> get ca =>
      $composableBuilder(column: $table.ca, builder: (column) => column);

  GeneratedColumn<double> get mg =>
      $composableBuilder(column: $table.mg, builder: (column) => column);

  GeneratedColumn<double> get s =>
      $composableBuilder(column: $table.s, builder: (column) => column);

  GeneratedColumn<double> get fe =>
      $composableBuilder(column: $table.fe, builder: (column) => column);

  GeneratedColumn<double> get mn =>
      $composableBuilder(column: $table.mn, builder: (column) => column);

  GeneratedColumn<double> get zn =>
      $composableBuilder(column: $table.zn, builder: (column) => column);

  GeneratedColumn<double> get b =>
      $composableBuilder(column: $table.b, builder: (column) => column);

  GeneratedColumn<double> get cu =>
      $composableBuilder(column: $table.cu, builder: (column) => column);

  GeneratedColumn<double> get si =>
      $composableBuilder(column: $table.si, builder: (column) => column);

  GeneratedColumn<double> get mo =>
      $composableBuilder(column: $table.mo, builder: (column) => column);

  GeneratedColumn<double> get na =>
      $composableBuilder(column: $table.na, builder: (column) => column);

  GeneratedColumn<double> get cl =>
      $composableBuilder(column: $table.cl, builder: (column) => column);

  Expression<T> formulationSnapshotsRefs<T extends Object>(
    Expression<T> Function($$FormulationSnapshotsTableAnnotationComposer a) f,
  ) {
    final $$FormulationSnapshotsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.formulationSnapshots,
          getReferencedColumn: (t) => t.formulation_id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$FormulationSnapshotsTableAnnotationComposer(
                $db: $db,
                $table: $db.formulationSnapshots,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> tankBatchesRefs<T extends Object>(
    Expression<T> Function($$TankBatchesTableAnnotationComposer a) f,
  ) {
    final $$TankBatchesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tankBatches,
      getReferencedColumn: (t) => t.formulation_id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TankBatchesTableAnnotationComposer(
            $db: $db,
            $table: $db.tankBatches,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$FormulationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FormulationsTable,
          Formulation,
          $$FormulationsTableFilterComposer,
          $$FormulationsTableOrderingComposer,
          $$FormulationsTableAnnotationComposer,
          $$FormulationsTableCreateCompanionBuilder,
          $$FormulationsTableUpdateCompanionBuilder,
          (Formulation, $$FormulationsTableReferences),
          Formulation,
          PrefetchHooks Function({
            bool formulationSnapshotsRefs,
            bool tankBatchesRefs,
          })
        > {
  $$FormulationsTableTableManager(_$AppDatabase db, $FormulationsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FormulationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FormulationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FormulationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> units = const Value.absent(),
                Value<String> created_at = const Value.absent(),
                Value<String> updated_at = const Value.absent(),
                Value<double> n_no3 = const Value.absent(),
                Value<double> n_nh4 = const Value.absent(),
                Value<double> p = const Value.absent(),
                Value<double> k = const Value.absent(),
                Value<double> ca = const Value.absent(),
                Value<double> mg = const Value.absent(),
                Value<double> s = const Value.absent(),
                Value<double> fe = const Value.absent(),
                Value<double> mn = const Value.absent(),
                Value<double> zn = const Value.absent(),
                Value<double> b = const Value.absent(),
                Value<double> cu = const Value.absent(),
                Value<double> si = const Value.absent(),
                Value<double> mo = const Value.absent(),
                Value<double> na = const Value.absent(),
                Value<double> cl = const Value.absent(),
              }) => FormulationsCompanion(
                id: id,
                name: name,
                units: units,
                created_at: created_at,
                updated_at: updated_at,
                n_no3: n_no3,
                n_nh4: n_nh4,
                p: p,
                k: k,
                ca: ca,
                mg: mg,
                s: s,
                fe: fe,
                mn: mn,
                zn: zn,
                b: b,
                cu: cu,
                si: si,
                mo: mo,
                na: na,
                cl: cl,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String> units = const Value.absent(),
                required String created_at,
                required String updated_at,
                Value<double> n_no3 = const Value.absent(),
                Value<double> n_nh4 = const Value.absent(),
                Value<double> p = const Value.absent(),
                Value<double> k = const Value.absent(),
                Value<double> ca = const Value.absent(),
                Value<double> mg = const Value.absent(),
                Value<double> s = const Value.absent(),
                Value<double> fe = const Value.absent(),
                Value<double> mn = const Value.absent(),
                Value<double> zn = const Value.absent(),
                Value<double> b = const Value.absent(),
                Value<double> cu = const Value.absent(),
                Value<double> si = const Value.absent(),
                Value<double> mo = const Value.absent(),
                Value<double> na = const Value.absent(),
                Value<double> cl = const Value.absent(),
              }) => FormulationsCompanion.insert(
                id: id,
                name: name,
                units: units,
                created_at: created_at,
                updated_at: updated_at,
                n_no3: n_no3,
                n_nh4: n_nh4,
                p: p,
                k: k,
                ca: ca,
                mg: mg,
                s: s,
                fe: fe,
                mn: mn,
                zn: zn,
                b: b,
                cu: cu,
                si: si,
                mo: mo,
                na: na,
                cl: cl,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$FormulationsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({formulationSnapshotsRefs = false, tankBatchesRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (formulationSnapshotsRefs) db.formulationSnapshots,
                    if (tankBatchesRefs) db.tankBatches,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (formulationSnapshotsRefs)
                        await $_getPrefetchedData<
                          Formulation,
                          $FormulationsTable,
                          FormulationSnapshot
                        >(
                          currentTable: table,
                          referencedTable: $$FormulationsTableReferences
                              ._formulationSnapshotsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$FormulationsTableReferences(
                                db,
                                table,
                                p0,
                              ).formulationSnapshotsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.formulation_id == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (tankBatchesRefs)
                        await $_getPrefetchedData<
                          Formulation,
                          $FormulationsTable,
                          TankBatche
                        >(
                          currentTable: table,
                          referencedTable: $$FormulationsTableReferences
                              ._tankBatchesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$FormulationsTableReferences(
                                db,
                                table,
                                p0,
                              ).tankBatchesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.formulation_id == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$FormulationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FormulationsTable,
      Formulation,
      $$FormulationsTableFilterComposer,
      $$FormulationsTableOrderingComposer,
      $$FormulationsTableAnnotationComposer,
      $$FormulationsTableCreateCompanionBuilder,
      $$FormulationsTableUpdateCompanionBuilder,
      (Formulation, $$FormulationsTableReferences),
      Formulation,
      PrefetchHooks Function({
        bool formulationSnapshotsRefs,
        bool tankBatchesRefs,
      })
    >;
typedef $$FormulationSnapshotsTableCreateCompanionBuilder =
    FormulationSnapshotsCompanion Function({
      Value<int> id,
      required int formulation_id,
      required int version,
      required String created_at,
      Value<String?> note,
      required String snapshot_data,
      required String trigger_type,
      Value<int?> parent_snapshot_id,
    });
typedef $$FormulationSnapshotsTableUpdateCompanionBuilder =
    FormulationSnapshotsCompanion Function({
      Value<int> id,
      Value<int> formulation_id,
      Value<int> version,
      Value<String> created_at,
      Value<String?> note,
      Value<String> snapshot_data,
      Value<String> trigger_type,
      Value<int?> parent_snapshot_id,
    });

final class $$FormulationSnapshotsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $FormulationSnapshotsTable,
          FormulationSnapshot
        > {
  $$FormulationSnapshotsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $FormulationsTable _formulation_idTable(_$AppDatabase db) =>
      db.formulations.createAlias(
        $_aliasNameGenerator(
          db.formulationSnapshots.formulation_id,
          db.formulations.id,
        ),
      );

  $$FormulationsTableProcessedTableManager get formulation_id {
    final $_column = $_itemColumn<int>('formulation_id')!;

    final manager = $$FormulationsTableTableManager(
      $_db,
      $_db.formulations,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_formulation_idTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$FormulationSnapshotsTableFilterComposer
    extends Composer<_$AppDatabase, $FormulationSnapshotsTable> {
  $$FormulationSnapshotsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get created_at => $composableBuilder(
    column: $table.created_at,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get snapshot_data => $composableBuilder(
    column: $table.snapshot_data,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get trigger_type => $composableBuilder(
    column: $table.trigger_type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get parent_snapshot_id => $composableBuilder(
    column: $table.parent_snapshot_id,
    builder: (column) => ColumnFilters(column),
  );

  $$FormulationsTableFilterComposer get formulation_id {
    final $$FormulationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.formulation_id,
      referencedTable: $db.formulations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FormulationsTableFilterComposer(
            $db: $db,
            $table: $db.formulations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FormulationSnapshotsTableOrderingComposer
    extends Composer<_$AppDatabase, $FormulationSnapshotsTable> {
  $$FormulationSnapshotsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get created_at => $composableBuilder(
    column: $table.created_at,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get snapshot_data => $composableBuilder(
    column: $table.snapshot_data,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get trigger_type => $composableBuilder(
    column: $table.trigger_type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get parent_snapshot_id => $composableBuilder(
    column: $table.parent_snapshot_id,
    builder: (column) => ColumnOrderings(column),
  );

  $$FormulationsTableOrderingComposer get formulation_id {
    final $$FormulationsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.formulation_id,
      referencedTable: $db.formulations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FormulationsTableOrderingComposer(
            $db: $db,
            $table: $db.formulations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FormulationSnapshotsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FormulationSnapshotsTable> {
  $$FormulationSnapshotsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get created_at => $composableBuilder(
    column: $table.created_at,
    builder: (column) => column,
  );

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<String> get snapshot_data => $composableBuilder(
    column: $table.snapshot_data,
    builder: (column) => column,
  );

  GeneratedColumn<String> get trigger_type => $composableBuilder(
    column: $table.trigger_type,
    builder: (column) => column,
  );

  GeneratedColumn<int> get parent_snapshot_id => $composableBuilder(
    column: $table.parent_snapshot_id,
    builder: (column) => column,
  );

  $$FormulationsTableAnnotationComposer get formulation_id {
    final $$FormulationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.formulation_id,
      referencedTable: $db.formulations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FormulationsTableAnnotationComposer(
            $db: $db,
            $table: $db.formulations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FormulationSnapshotsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FormulationSnapshotsTable,
          FormulationSnapshot,
          $$FormulationSnapshotsTableFilterComposer,
          $$FormulationSnapshotsTableOrderingComposer,
          $$FormulationSnapshotsTableAnnotationComposer,
          $$FormulationSnapshotsTableCreateCompanionBuilder,
          $$FormulationSnapshotsTableUpdateCompanionBuilder,
          (FormulationSnapshot, $$FormulationSnapshotsTableReferences),
          FormulationSnapshot,
          PrefetchHooks Function({bool formulation_id})
        > {
  $$FormulationSnapshotsTableTableManager(
    _$AppDatabase db,
    $FormulationSnapshotsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FormulationSnapshotsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FormulationSnapshotsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$FormulationSnapshotsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> formulation_id = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String> created_at = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<String> snapshot_data = const Value.absent(),
                Value<String> trigger_type = const Value.absent(),
                Value<int?> parent_snapshot_id = const Value.absent(),
              }) => FormulationSnapshotsCompanion(
                id: id,
                formulation_id: formulation_id,
                version: version,
                created_at: created_at,
                note: note,
                snapshot_data: snapshot_data,
                trigger_type: trigger_type,
                parent_snapshot_id: parent_snapshot_id,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int formulation_id,
                required int version,
                required String created_at,
                Value<String?> note = const Value.absent(),
                required String snapshot_data,
                required String trigger_type,
                Value<int?> parent_snapshot_id = const Value.absent(),
              }) => FormulationSnapshotsCompanion.insert(
                id: id,
                formulation_id: formulation_id,
                version: version,
                created_at: created_at,
                note: note,
                snapshot_data: snapshot_data,
                trigger_type: trigger_type,
                parent_snapshot_id: parent_snapshot_id,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$FormulationSnapshotsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({formulation_id = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (formulation_id) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.formulation_id,
                                referencedTable:
                                    $$FormulationSnapshotsTableReferences
                                        ._formulation_idTable(db),
                                referencedColumn:
                                    $$FormulationSnapshotsTableReferences
                                        ._formulation_idTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$FormulationSnapshotsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FormulationSnapshotsTable,
      FormulationSnapshot,
      $$FormulationSnapshotsTableFilterComposer,
      $$FormulationSnapshotsTableOrderingComposer,
      $$FormulationSnapshotsTableAnnotationComposer,
      $$FormulationSnapshotsTableCreateCompanionBuilder,
      $$FormulationSnapshotsTableUpdateCompanionBuilder,
      (FormulationSnapshot, $$FormulationSnapshotsTableReferences),
      FormulationSnapshot,
      PrefetchHooks Function({bool formulation_id})
    >;
typedef $$WaterQualityTableCreateCompanionBuilder =
    WaterQualityCompanion Function({
      Value<int> id,
      required String name,
      Value<bool> is_default,
      Value<double?> ph,
      Value<double?> gh,
      Value<double?> kh,
      Value<double> n_no3,
      Value<double> n_nh4,
      Value<double> p,
      Value<double> k,
      Value<double> ca,
      Value<double> mg,
      Value<double> s,
      Value<double> fe,
      Value<double> mn,
      Value<double> zn,
      Value<double> b,
      Value<double> cu,
      Value<double> si,
      Value<double> mo,
      Value<double> na,
      Value<double> cl,
    });
typedef $$WaterQualityTableUpdateCompanionBuilder =
    WaterQualityCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<bool> is_default,
      Value<double?> ph,
      Value<double?> gh,
      Value<double?> kh,
      Value<double> n_no3,
      Value<double> n_nh4,
      Value<double> p,
      Value<double> k,
      Value<double> ca,
      Value<double> mg,
      Value<double> s,
      Value<double> fe,
      Value<double> mn,
      Value<double> zn,
      Value<double> b,
      Value<double> cu,
      Value<double> si,
      Value<double> mo,
      Value<double> na,
      Value<double> cl,
    });

class $$WaterQualityTableFilterComposer
    extends Composer<_$AppDatabase, $WaterQualityTable> {
  $$WaterQualityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get is_default => $composableBuilder(
    column: $table.is_default,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get ph => $composableBuilder(
    column: $table.ph,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get gh => $composableBuilder(
    column: $table.gh,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get kh => $composableBuilder(
    column: $table.kh,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get n_no3 => $composableBuilder(
    column: $table.n_no3,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get n_nh4 => $composableBuilder(
    column: $table.n_nh4,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get p => $composableBuilder(
    column: $table.p,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get k => $composableBuilder(
    column: $table.k,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get ca => $composableBuilder(
    column: $table.ca,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get mg => $composableBuilder(
    column: $table.mg,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get s => $composableBuilder(
    column: $table.s,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get fe => $composableBuilder(
    column: $table.fe,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get mn => $composableBuilder(
    column: $table.mn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get zn => $composableBuilder(
    column: $table.zn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get b => $composableBuilder(
    column: $table.b,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get cu => $composableBuilder(
    column: $table.cu,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get si => $composableBuilder(
    column: $table.si,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get mo => $composableBuilder(
    column: $table.mo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get na => $composableBuilder(
    column: $table.na,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get cl => $composableBuilder(
    column: $table.cl,
    builder: (column) => ColumnFilters(column),
  );
}

class $$WaterQualityTableOrderingComposer
    extends Composer<_$AppDatabase, $WaterQualityTable> {
  $$WaterQualityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get is_default => $composableBuilder(
    column: $table.is_default,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get ph => $composableBuilder(
    column: $table.ph,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get gh => $composableBuilder(
    column: $table.gh,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get kh => $composableBuilder(
    column: $table.kh,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get n_no3 => $composableBuilder(
    column: $table.n_no3,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get n_nh4 => $composableBuilder(
    column: $table.n_nh4,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get p => $composableBuilder(
    column: $table.p,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get k => $composableBuilder(
    column: $table.k,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get ca => $composableBuilder(
    column: $table.ca,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get mg => $composableBuilder(
    column: $table.mg,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get s => $composableBuilder(
    column: $table.s,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get fe => $composableBuilder(
    column: $table.fe,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get mn => $composableBuilder(
    column: $table.mn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get zn => $composableBuilder(
    column: $table.zn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get b => $composableBuilder(
    column: $table.b,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get cu => $composableBuilder(
    column: $table.cu,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get si => $composableBuilder(
    column: $table.si,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get mo => $composableBuilder(
    column: $table.mo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get na => $composableBuilder(
    column: $table.na,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get cl => $composableBuilder(
    column: $table.cl,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WaterQualityTableAnnotationComposer
    extends Composer<_$AppDatabase, $WaterQualityTable> {
  $$WaterQualityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<bool> get is_default => $composableBuilder(
    column: $table.is_default,
    builder: (column) => column,
  );

  GeneratedColumn<double> get ph =>
      $composableBuilder(column: $table.ph, builder: (column) => column);

  GeneratedColumn<double> get gh =>
      $composableBuilder(column: $table.gh, builder: (column) => column);

  GeneratedColumn<double> get kh =>
      $composableBuilder(column: $table.kh, builder: (column) => column);

  GeneratedColumn<double> get n_no3 =>
      $composableBuilder(column: $table.n_no3, builder: (column) => column);

  GeneratedColumn<double> get n_nh4 =>
      $composableBuilder(column: $table.n_nh4, builder: (column) => column);

  GeneratedColumn<double> get p =>
      $composableBuilder(column: $table.p, builder: (column) => column);

  GeneratedColumn<double> get k =>
      $composableBuilder(column: $table.k, builder: (column) => column);

  GeneratedColumn<double> get ca =>
      $composableBuilder(column: $table.ca, builder: (column) => column);

  GeneratedColumn<double> get mg =>
      $composableBuilder(column: $table.mg, builder: (column) => column);

  GeneratedColumn<double> get s =>
      $composableBuilder(column: $table.s, builder: (column) => column);

  GeneratedColumn<double> get fe =>
      $composableBuilder(column: $table.fe, builder: (column) => column);

  GeneratedColumn<double> get mn =>
      $composableBuilder(column: $table.mn, builder: (column) => column);

  GeneratedColumn<double> get zn =>
      $composableBuilder(column: $table.zn, builder: (column) => column);

  GeneratedColumn<double> get b =>
      $composableBuilder(column: $table.b, builder: (column) => column);

  GeneratedColumn<double> get cu =>
      $composableBuilder(column: $table.cu, builder: (column) => column);

  GeneratedColumn<double> get si =>
      $composableBuilder(column: $table.si, builder: (column) => column);

  GeneratedColumn<double> get mo =>
      $composableBuilder(column: $table.mo, builder: (column) => column);

  GeneratedColumn<double> get na =>
      $composableBuilder(column: $table.na, builder: (column) => column);

  GeneratedColumn<double> get cl =>
      $composableBuilder(column: $table.cl, builder: (column) => column);
}

class $$WaterQualityTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WaterQualityTable,
          WaterQualityData,
          $$WaterQualityTableFilterComposer,
          $$WaterQualityTableOrderingComposer,
          $$WaterQualityTableAnnotationComposer,
          $$WaterQualityTableCreateCompanionBuilder,
          $$WaterQualityTableUpdateCompanionBuilder,
          (
            WaterQualityData,
            BaseReferences<_$AppDatabase, $WaterQualityTable, WaterQualityData>,
          ),
          WaterQualityData,
          PrefetchHooks Function()
        > {
  $$WaterQualityTableTableManager(_$AppDatabase db, $WaterQualityTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WaterQualityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WaterQualityTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WaterQualityTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<bool> is_default = const Value.absent(),
                Value<double?> ph = const Value.absent(),
                Value<double?> gh = const Value.absent(),
                Value<double?> kh = const Value.absent(),
                Value<double> n_no3 = const Value.absent(),
                Value<double> n_nh4 = const Value.absent(),
                Value<double> p = const Value.absent(),
                Value<double> k = const Value.absent(),
                Value<double> ca = const Value.absent(),
                Value<double> mg = const Value.absent(),
                Value<double> s = const Value.absent(),
                Value<double> fe = const Value.absent(),
                Value<double> mn = const Value.absent(),
                Value<double> zn = const Value.absent(),
                Value<double> b = const Value.absent(),
                Value<double> cu = const Value.absent(),
                Value<double> si = const Value.absent(),
                Value<double> mo = const Value.absent(),
                Value<double> na = const Value.absent(),
                Value<double> cl = const Value.absent(),
              }) => WaterQualityCompanion(
                id: id,
                name: name,
                is_default: is_default,
                ph: ph,
                gh: gh,
                kh: kh,
                n_no3: n_no3,
                n_nh4: n_nh4,
                p: p,
                k: k,
                ca: ca,
                mg: mg,
                s: s,
                fe: fe,
                mn: mn,
                zn: zn,
                b: b,
                cu: cu,
                si: si,
                mo: mo,
                na: na,
                cl: cl,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<bool> is_default = const Value.absent(),
                Value<double?> ph = const Value.absent(),
                Value<double?> gh = const Value.absent(),
                Value<double?> kh = const Value.absent(),
                Value<double> n_no3 = const Value.absent(),
                Value<double> n_nh4 = const Value.absent(),
                Value<double> p = const Value.absent(),
                Value<double> k = const Value.absent(),
                Value<double> ca = const Value.absent(),
                Value<double> mg = const Value.absent(),
                Value<double> s = const Value.absent(),
                Value<double> fe = const Value.absent(),
                Value<double> mn = const Value.absent(),
                Value<double> zn = const Value.absent(),
                Value<double> b = const Value.absent(),
                Value<double> cu = const Value.absent(),
                Value<double> si = const Value.absent(),
                Value<double> mo = const Value.absent(),
                Value<double> na = const Value.absent(),
                Value<double> cl = const Value.absent(),
              }) => WaterQualityCompanion.insert(
                id: id,
                name: name,
                is_default: is_default,
                ph: ph,
                gh: gh,
                kh: kh,
                n_no3: n_no3,
                n_nh4: n_nh4,
                p: p,
                k: k,
                ca: ca,
                mg: mg,
                s: s,
                fe: fe,
                mn: mn,
                zn: zn,
                b: b,
                cu: cu,
                si: si,
                mo: mo,
                na: na,
                cl: cl,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$WaterQualityTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WaterQualityTable,
      WaterQualityData,
      $$WaterQualityTableFilterComposer,
      $$WaterQualityTableOrderingComposer,
      $$WaterQualityTableAnnotationComposer,
      $$WaterQualityTableCreateCompanionBuilder,
      $$WaterQualityTableUpdateCompanionBuilder,
      (
        WaterQualityData,
        BaseReferences<_$AppDatabase, $WaterQualityTable, WaterQualityData>,
      ),
      WaterQualityData,
      PrefetchHooks Function()
    >;
typedef $$TissueAnalysisTableCreateCompanionBuilder =
    TissueAnalysisCompanion Function({
      Value<int> id,
      required String name,
      Value<double> n,
      Value<double> p,
      Value<double> k,
      Value<double> ca,
      Value<double> mg,
      Value<double> s,
      Value<double> fe,
      Value<double> mn,
      Value<double> zn,
      Value<double> b,
      Value<double> cu,
      Value<double> si,
      Value<double> mo,
      Value<double> na,
      Value<double> cl,
    });
typedef $$TissueAnalysisTableUpdateCompanionBuilder =
    TissueAnalysisCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<double> n,
      Value<double> p,
      Value<double> k,
      Value<double> ca,
      Value<double> mg,
      Value<double> s,
      Value<double> fe,
      Value<double> mn,
      Value<double> zn,
      Value<double> b,
      Value<double> cu,
      Value<double> si,
      Value<double> mo,
      Value<double> na,
      Value<double> cl,
    });

class $$TissueAnalysisTableFilterComposer
    extends Composer<_$AppDatabase, $TissueAnalysisTable> {
  $$TissueAnalysisTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get n => $composableBuilder(
    column: $table.n,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get p => $composableBuilder(
    column: $table.p,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get k => $composableBuilder(
    column: $table.k,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get ca => $composableBuilder(
    column: $table.ca,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get mg => $composableBuilder(
    column: $table.mg,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get s => $composableBuilder(
    column: $table.s,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get fe => $composableBuilder(
    column: $table.fe,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get mn => $composableBuilder(
    column: $table.mn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get zn => $composableBuilder(
    column: $table.zn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get b => $composableBuilder(
    column: $table.b,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get cu => $composableBuilder(
    column: $table.cu,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get si => $composableBuilder(
    column: $table.si,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get mo => $composableBuilder(
    column: $table.mo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get na => $composableBuilder(
    column: $table.na,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get cl => $composableBuilder(
    column: $table.cl,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TissueAnalysisTableOrderingComposer
    extends Composer<_$AppDatabase, $TissueAnalysisTable> {
  $$TissueAnalysisTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get n => $composableBuilder(
    column: $table.n,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get p => $composableBuilder(
    column: $table.p,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get k => $composableBuilder(
    column: $table.k,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get ca => $composableBuilder(
    column: $table.ca,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get mg => $composableBuilder(
    column: $table.mg,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get s => $composableBuilder(
    column: $table.s,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get fe => $composableBuilder(
    column: $table.fe,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get mn => $composableBuilder(
    column: $table.mn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get zn => $composableBuilder(
    column: $table.zn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get b => $composableBuilder(
    column: $table.b,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get cu => $composableBuilder(
    column: $table.cu,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get si => $composableBuilder(
    column: $table.si,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get mo => $composableBuilder(
    column: $table.mo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get na => $composableBuilder(
    column: $table.na,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get cl => $composableBuilder(
    column: $table.cl,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TissueAnalysisTableAnnotationComposer
    extends Composer<_$AppDatabase, $TissueAnalysisTable> {
  $$TissueAnalysisTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get n =>
      $composableBuilder(column: $table.n, builder: (column) => column);

  GeneratedColumn<double> get p =>
      $composableBuilder(column: $table.p, builder: (column) => column);

  GeneratedColumn<double> get k =>
      $composableBuilder(column: $table.k, builder: (column) => column);

  GeneratedColumn<double> get ca =>
      $composableBuilder(column: $table.ca, builder: (column) => column);

  GeneratedColumn<double> get mg =>
      $composableBuilder(column: $table.mg, builder: (column) => column);

  GeneratedColumn<double> get s =>
      $composableBuilder(column: $table.s, builder: (column) => column);

  GeneratedColumn<double> get fe =>
      $composableBuilder(column: $table.fe, builder: (column) => column);

  GeneratedColumn<double> get mn =>
      $composableBuilder(column: $table.mn, builder: (column) => column);

  GeneratedColumn<double> get zn =>
      $composableBuilder(column: $table.zn, builder: (column) => column);

  GeneratedColumn<double> get b =>
      $composableBuilder(column: $table.b, builder: (column) => column);

  GeneratedColumn<double> get cu =>
      $composableBuilder(column: $table.cu, builder: (column) => column);

  GeneratedColumn<double> get si =>
      $composableBuilder(column: $table.si, builder: (column) => column);

  GeneratedColumn<double> get mo =>
      $composableBuilder(column: $table.mo, builder: (column) => column);

  GeneratedColumn<double> get na =>
      $composableBuilder(column: $table.na, builder: (column) => column);

  GeneratedColumn<double> get cl =>
      $composableBuilder(column: $table.cl, builder: (column) => column);
}

class $$TissueAnalysisTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TissueAnalysisTable,
          TissueAnalysi,
          $$TissueAnalysisTableFilterComposer,
          $$TissueAnalysisTableOrderingComposer,
          $$TissueAnalysisTableAnnotationComposer,
          $$TissueAnalysisTableCreateCompanionBuilder,
          $$TissueAnalysisTableUpdateCompanionBuilder,
          (
            TissueAnalysi,
            BaseReferences<_$AppDatabase, $TissueAnalysisTable, TissueAnalysi>,
          ),
          TissueAnalysi,
          PrefetchHooks Function()
        > {
  $$TissueAnalysisTableTableManager(
    _$AppDatabase db,
    $TissueAnalysisTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TissueAnalysisTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TissueAnalysisTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TissueAnalysisTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<double> n = const Value.absent(),
                Value<double> p = const Value.absent(),
                Value<double> k = const Value.absent(),
                Value<double> ca = const Value.absent(),
                Value<double> mg = const Value.absent(),
                Value<double> s = const Value.absent(),
                Value<double> fe = const Value.absent(),
                Value<double> mn = const Value.absent(),
                Value<double> zn = const Value.absent(),
                Value<double> b = const Value.absent(),
                Value<double> cu = const Value.absent(),
                Value<double> si = const Value.absent(),
                Value<double> mo = const Value.absent(),
                Value<double> na = const Value.absent(),
                Value<double> cl = const Value.absent(),
              }) => TissueAnalysisCompanion(
                id: id,
                name: name,
                n: n,
                p: p,
                k: k,
                ca: ca,
                mg: mg,
                s: s,
                fe: fe,
                mn: mn,
                zn: zn,
                b: b,
                cu: cu,
                si: si,
                mo: mo,
                na: na,
                cl: cl,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<double> n = const Value.absent(),
                Value<double> p = const Value.absent(),
                Value<double> k = const Value.absent(),
                Value<double> ca = const Value.absent(),
                Value<double> mg = const Value.absent(),
                Value<double> s = const Value.absent(),
                Value<double> fe = const Value.absent(),
                Value<double> mn = const Value.absent(),
                Value<double> zn = const Value.absent(),
                Value<double> b = const Value.absent(),
                Value<double> cu = const Value.absent(),
                Value<double> si = const Value.absent(),
                Value<double> mo = const Value.absent(),
                Value<double> na = const Value.absent(),
                Value<double> cl = const Value.absent(),
              }) => TissueAnalysisCompanion.insert(
                id: id,
                name: name,
                n: n,
                p: p,
                k: k,
                ca: ca,
                mg: mg,
                s: s,
                fe: fe,
                mn: mn,
                zn: zn,
                b: b,
                cu: cu,
                si: si,
                mo: mo,
                na: na,
                cl: cl,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TissueAnalysisTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TissueAnalysisTable,
      TissueAnalysi,
      $$TissueAnalysisTableFilterComposer,
      $$TissueAnalysisTableOrderingComposer,
      $$TissueAnalysisTableAnnotationComposer,
      $$TissueAnalysisTableCreateCompanionBuilder,
      $$TissueAnalysisTableUpdateCompanionBuilder,
      (
        TissueAnalysi,
        BaseReferences<_$AppDatabase, $TissueAnalysisTable, TissueAnalysi>,
      ),
      TissueAnalysi,
      PrefetchHooks Function()
    >;
typedef $$SubstancesUsedTableCreateCompanionBuilder =
    SubstancesUsedCompanion Function({
      Value<int> id,
      required int substance_id,
      Value<double?> weight,
    });
typedef $$SubstancesUsedTableUpdateCompanionBuilder =
    SubstancesUsedCompanion Function({
      Value<int> id,
      Value<int> substance_id,
      Value<double?> weight,
    });

final class $$SubstancesUsedTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $SubstancesUsedTable,
          SubstancesUsedData
        > {
  $$SubstancesUsedTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $SubstancesTable _substance_idTable(_$AppDatabase db) =>
      db.substances.createAlias(
        $_aliasNameGenerator(db.substancesUsed.substance_id, db.substances.id),
      );

  $$SubstancesTableProcessedTableManager get substance_id {
    final $_column = $_itemColumn<int>('substance_id')!;

    final manager = $$SubstancesTableTableManager(
      $_db,
      $_db.substances,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_substance_idTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SubstancesUsedTableFilterComposer
    extends Composer<_$AppDatabase, $SubstancesUsedTable> {
  $$SubstancesUsedTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnFilters(column),
  );

  $$SubstancesTableFilterComposer get substance_id {
    final $$SubstancesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.substance_id,
      referencedTable: $db.substances,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubstancesTableFilterComposer(
            $db: $db,
            $table: $db.substances,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SubstancesUsedTableOrderingComposer
    extends Composer<_$AppDatabase, $SubstancesUsedTable> {
  $$SubstancesUsedTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnOrderings(column),
  );

  $$SubstancesTableOrderingComposer get substance_id {
    final $$SubstancesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.substance_id,
      referencedTable: $db.substances,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubstancesTableOrderingComposer(
            $db: $db,
            $table: $db.substances,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SubstancesUsedTableAnnotationComposer
    extends Composer<_$AppDatabase, $SubstancesUsedTable> {
  $$SubstancesUsedTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  $$SubstancesTableAnnotationComposer get substance_id {
    final $$SubstancesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.substance_id,
      referencedTable: $db.substances,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubstancesTableAnnotationComposer(
            $db: $db,
            $table: $db.substances,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SubstancesUsedTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SubstancesUsedTable,
          SubstancesUsedData,
          $$SubstancesUsedTableFilterComposer,
          $$SubstancesUsedTableOrderingComposer,
          $$SubstancesUsedTableAnnotationComposer,
          $$SubstancesUsedTableCreateCompanionBuilder,
          $$SubstancesUsedTableUpdateCompanionBuilder,
          (SubstancesUsedData, $$SubstancesUsedTableReferences),
          SubstancesUsedData,
          PrefetchHooks Function({bool substance_id})
        > {
  $$SubstancesUsedTableTableManager(
    _$AppDatabase db,
    $SubstancesUsedTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SubstancesUsedTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SubstancesUsedTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SubstancesUsedTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> substance_id = const Value.absent(),
                Value<double?> weight = const Value.absent(),
              }) => SubstancesUsedCompanion(
                id: id,
                substance_id: substance_id,
                weight: weight,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int substance_id,
                Value<double?> weight = const Value.absent(),
              }) => SubstancesUsedCompanion.insert(
                id: id,
                substance_id: substance_id,
                weight: weight,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SubstancesUsedTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({substance_id = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (substance_id) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.substance_id,
                                referencedTable: $$SubstancesUsedTableReferences
                                    ._substance_idTable(db),
                                referencedColumn:
                                    $$SubstancesUsedTableReferences
                                        ._substance_idTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$SubstancesUsedTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SubstancesUsedTable,
      SubstancesUsedData,
      $$SubstancesUsedTableFilterComposer,
      $$SubstancesUsedTableOrderingComposer,
      $$SubstancesUsedTableAnnotationComposer,
      $$SubstancesUsedTableCreateCompanionBuilder,
      $$SubstancesUsedTableUpdateCompanionBuilder,
      (SubstancesUsedData, $$SubstancesUsedTableReferences),
      SubstancesUsedData,
      PrefetchHooks Function({bool substance_id})
    >;
typedef $$TankBatchesTableCreateCompanionBuilder =
    TankBatchesCompanion Function({
      Value<int> id,
      required String name,
      required int formulation_id,
      required double volume,
      required double volume_remaining,
      required String prepared_at,
      Value<String?> notes,
    });
typedef $$TankBatchesTableUpdateCompanionBuilder =
    TankBatchesCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<int> formulation_id,
      Value<double> volume,
      Value<double> volume_remaining,
      Value<String> prepared_at,
      Value<String?> notes,
    });

final class $$TankBatchesTableReferences
    extends BaseReferences<_$AppDatabase, $TankBatchesTable, TankBatche> {
  $$TankBatchesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $FormulationsTable _formulation_idTable(_$AppDatabase db) =>
      db.formulations.createAlias(
        $_aliasNameGenerator(db.tankBatches.formulation_id, db.formulations.id),
      );

  $$FormulationsTableProcessedTableManager get formulation_id {
    final $_column = $_itemColumn<int>('formulation_id')!;

    final manager = $$FormulationsTableTableManager(
      $_db,
      $_db.formulations,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_formulation_idTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$TankUsageEventsTable, List<TankUsageEvent>>
  _tankUsageEventsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.tankUsageEvents,
    aliasName: $_aliasNameGenerator(
      db.tankBatches.id,
      db.tankUsageEvents.tank_batch_id,
    ),
  );

  $$TankUsageEventsTableProcessedTableManager get tankUsageEventsRefs {
    final manager = $$TankUsageEventsTableTableManager(
      $_db,
      $_db.tankUsageEvents,
    ).filter((f) => f.tank_batch_id.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _tankUsageEventsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TankBatchesTableFilterComposer
    extends Composer<_$AppDatabase, $TankBatchesTable> {
  $$TankBatchesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get volume => $composableBuilder(
    column: $table.volume,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get volume_remaining => $composableBuilder(
    column: $table.volume_remaining,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get prepared_at => $composableBuilder(
    column: $table.prepared_at,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  $$FormulationsTableFilterComposer get formulation_id {
    final $$FormulationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.formulation_id,
      referencedTable: $db.formulations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FormulationsTableFilterComposer(
            $db: $db,
            $table: $db.formulations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> tankUsageEventsRefs(
    Expression<bool> Function($$TankUsageEventsTableFilterComposer f) f,
  ) {
    final $$TankUsageEventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tankUsageEvents,
      getReferencedColumn: (t) => t.tank_batch_id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TankUsageEventsTableFilterComposer(
            $db: $db,
            $table: $db.tankUsageEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TankBatchesTableOrderingComposer
    extends Composer<_$AppDatabase, $TankBatchesTable> {
  $$TankBatchesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get volume => $composableBuilder(
    column: $table.volume,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get volume_remaining => $composableBuilder(
    column: $table.volume_remaining,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get prepared_at => $composableBuilder(
    column: $table.prepared_at,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  $$FormulationsTableOrderingComposer get formulation_id {
    final $$FormulationsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.formulation_id,
      referencedTable: $db.formulations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FormulationsTableOrderingComposer(
            $db: $db,
            $table: $db.formulations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TankBatchesTableAnnotationComposer
    extends Composer<_$AppDatabase, $TankBatchesTable> {
  $$TankBatchesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get volume =>
      $composableBuilder(column: $table.volume, builder: (column) => column);

  GeneratedColumn<double> get volume_remaining => $composableBuilder(
    column: $table.volume_remaining,
    builder: (column) => column,
  );

  GeneratedColumn<String> get prepared_at => $composableBuilder(
    column: $table.prepared_at,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  $$FormulationsTableAnnotationComposer get formulation_id {
    final $$FormulationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.formulation_id,
      referencedTable: $db.formulations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FormulationsTableAnnotationComposer(
            $db: $db,
            $table: $db.formulations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> tankUsageEventsRefs<T extends Object>(
    Expression<T> Function($$TankUsageEventsTableAnnotationComposer a) f,
  ) {
    final $$TankUsageEventsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tankUsageEvents,
      getReferencedColumn: (t) => t.tank_batch_id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TankUsageEventsTableAnnotationComposer(
            $db: $db,
            $table: $db.tankUsageEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TankBatchesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TankBatchesTable,
          TankBatche,
          $$TankBatchesTableFilterComposer,
          $$TankBatchesTableOrderingComposer,
          $$TankBatchesTableAnnotationComposer,
          $$TankBatchesTableCreateCompanionBuilder,
          $$TankBatchesTableUpdateCompanionBuilder,
          (TankBatche, $$TankBatchesTableReferences),
          TankBatche,
          PrefetchHooks Function({
            bool formulation_id,
            bool tankUsageEventsRefs,
          })
        > {
  $$TankBatchesTableTableManager(_$AppDatabase db, $TankBatchesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TankBatchesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TankBatchesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TankBatchesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> formulation_id = const Value.absent(),
                Value<double> volume = const Value.absent(),
                Value<double> volume_remaining = const Value.absent(),
                Value<String> prepared_at = const Value.absent(),
                Value<String?> notes = const Value.absent(),
              }) => TankBatchesCompanion(
                id: id,
                name: name,
                formulation_id: formulation_id,
                volume: volume,
                volume_remaining: volume_remaining,
                prepared_at: prepared_at,
                notes: notes,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required int formulation_id,
                required double volume,
                required double volume_remaining,
                required String prepared_at,
                Value<String?> notes = const Value.absent(),
              }) => TankBatchesCompanion.insert(
                id: id,
                name: name,
                formulation_id: formulation_id,
                volume: volume,
                volume_remaining: volume_remaining,
                prepared_at: prepared_at,
                notes: notes,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TankBatchesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({formulation_id = false, tankUsageEventsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (tankUsageEventsRefs) db.tankUsageEvents,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (formulation_id) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.formulation_id,
                                    referencedTable:
                                        $$TankBatchesTableReferences
                                            ._formulation_idTable(db),
                                    referencedColumn:
                                        $$TankBatchesTableReferences
                                            ._formulation_idTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (tankUsageEventsRefs)
                        await $_getPrefetchedData<
                          TankBatche,
                          $TankBatchesTable,
                          TankUsageEvent
                        >(
                          currentTable: table,
                          referencedTable: $$TankBatchesTableReferences
                              ._tankUsageEventsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TankBatchesTableReferences(
                                db,
                                table,
                                p0,
                              ).tankUsageEventsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.tank_batch_id == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$TankBatchesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TankBatchesTable,
      TankBatche,
      $$TankBatchesTableFilterComposer,
      $$TankBatchesTableOrderingComposer,
      $$TankBatchesTableAnnotationComposer,
      $$TankBatchesTableCreateCompanionBuilder,
      $$TankBatchesTableUpdateCompanionBuilder,
      (TankBatche, $$TankBatchesTableReferences),
      TankBatche,
      PrefetchHooks Function({bool formulation_id, bool tankUsageEventsRefs})
    >;
typedef $$TankUsageEventsTableCreateCompanionBuilder =
    TankUsageEventsCompanion Function({
      Value<int> id,
      required int tank_batch_id,
      required String event_type,
      required double volume,
      required String created_at,
      Value<String?> notes,
    });
typedef $$TankUsageEventsTableUpdateCompanionBuilder =
    TankUsageEventsCompanion Function({
      Value<int> id,
      Value<int> tank_batch_id,
      Value<String> event_type,
      Value<double> volume,
      Value<String> created_at,
      Value<String?> notes,
    });

final class $$TankUsageEventsTableReferences
    extends
        BaseReferences<_$AppDatabase, $TankUsageEventsTable, TankUsageEvent> {
  $$TankUsageEventsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $TankBatchesTable _tank_batch_idTable(_$AppDatabase db) =>
      db.tankBatches.createAlias(
        $_aliasNameGenerator(
          db.tankUsageEvents.tank_batch_id,
          db.tankBatches.id,
        ),
      );

  $$TankBatchesTableProcessedTableManager get tank_batch_id {
    final $_column = $_itemColumn<int>('tank_batch_id')!;

    final manager = $$TankBatchesTableTableManager(
      $_db,
      $_db.tankBatches,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tank_batch_idTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TankUsageEventsTableFilterComposer
    extends Composer<_$AppDatabase, $TankUsageEventsTable> {
  $$TankUsageEventsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get event_type => $composableBuilder(
    column: $table.event_type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get volume => $composableBuilder(
    column: $table.volume,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get created_at => $composableBuilder(
    column: $table.created_at,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  $$TankBatchesTableFilterComposer get tank_batch_id {
    final $$TankBatchesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tank_batch_id,
      referencedTable: $db.tankBatches,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TankBatchesTableFilterComposer(
            $db: $db,
            $table: $db.tankBatches,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TankUsageEventsTableOrderingComposer
    extends Composer<_$AppDatabase, $TankUsageEventsTable> {
  $$TankUsageEventsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get event_type => $composableBuilder(
    column: $table.event_type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get volume => $composableBuilder(
    column: $table.volume,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get created_at => $composableBuilder(
    column: $table.created_at,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  $$TankBatchesTableOrderingComposer get tank_batch_id {
    final $$TankBatchesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tank_batch_id,
      referencedTable: $db.tankBatches,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TankBatchesTableOrderingComposer(
            $db: $db,
            $table: $db.tankBatches,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TankUsageEventsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TankUsageEventsTable> {
  $$TankUsageEventsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get event_type => $composableBuilder(
    column: $table.event_type,
    builder: (column) => column,
  );

  GeneratedColumn<double> get volume =>
      $composableBuilder(column: $table.volume, builder: (column) => column);

  GeneratedColumn<String> get created_at => $composableBuilder(
    column: $table.created_at,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  $$TankBatchesTableAnnotationComposer get tank_batch_id {
    final $$TankBatchesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tank_batch_id,
      referencedTable: $db.tankBatches,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TankBatchesTableAnnotationComposer(
            $db: $db,
            $table: $db.tankBatches,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TankUsageEventsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TankUsageEventsTable,
          TankUsageEvent,
          $$TankUsageEventsTableFilterComposer,
          $$TankUsageEventsTableOrderingComposer,
          $$TankUsageEventsTableAnnotationComposer,
          $$TankUsageEventsTableCreateCompanionBuilder,
          $$TankUsageEventsTableUpdateCompanionBuilder,
          (TankUsageEvent, $$TankUsageEventsTableReferences),
          TankUsageEvent,
          PrefetchHooks Function({bool tank_batch_id})
        > {
  $$TankUsageEventsTableTableManager(
    _$AppDatabase db,
    $TankUsageEventsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TankUsageEventsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TankUsageEventsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TankUsageEventsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> tank_batch_id = const Value.absent(),
                Value<String> event_type = const Value.absent(),
                Value<double> volume = const Value.absent(),
                Value<String> created_at = const Value.absent(),
                Value<String?> notes = const Value.absent(),
              }) => TankUsageEventsCompanion(
                id: id,
                tank_batch_id: tank_batch_id,
                event_type: event_type,
                volume: volume,
                created_at: created_at,
                notes: notes,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int tank_batch_id,
                required String event_type,
                required double volume,
                required String created_at,
                Value<String?> notes = const Value.absent(),
              }) => TankUsageEventsCompanion.insert(
                id: id,
                tank_batch_id: tank_batch_id,
                event_type: event_type,
                volume: volume,
                created_at: created_at,
                notes: notes,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TankUsageEventsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({tank_batch_id = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (tank_batch_id) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.tank_batch_id,
                                referencedTable:
                                    $$TankUsageEventsTableReferences
                                        ._tank_batch_idTable(db),
                                referencedColumn:
                                    $$TankUsageEventsTableReferences
                                        ._tank_batch_idTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$TankUsageEventsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TankUsageEventsTable,
      TankUsageEvent,
      $$TankUsageEventsTableFilterComposer,
      $$TankUsageEventsTableOrderingComposer,
      $$TankUsageEventsTableAnnotationComposer,
      $$TankUsageEventsTableCreateCompanionBuilder,
      $$TankUsageEventsTableUpdateCompanionBuilder,
      (TankUsageEvent, $$TankUsageEventsTableReferences),
      TankUsageEvent,
      PrefetchHooks Function({bool tank_batch_id})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SubstancesTableTableManager get substances =>
      $$SubstancesTableTableManager(_db, _db.substances);
  $$FormulationsTableTableManager get formulations =>
      $$FormulationsTableTableManager(_db, _db.formulations);
  $$FormulationSnapshotsTableTableManager get formulationSnapshots =>
      $$FormulationSnapshotsTableTableManager(_db, _db.formulationSnapshots);
  $$WaterQualityTableTableManager get waterQuality =>
      $$WaterQualityTableTableManager(_db, _db.waterQuality);
  $$TissueAnalysisTableTableManager get tissueAnalysis =>
      $$TissueAnalysisTableTableManager(_db, _db.tissueAnalysis);
  $$SubstancesUsedTableTableManager get substancesUsed =>
      $$SubstancesUsedTableTableManager(_db, _db.substancesUsed);
  $$TankBatchesTableTableManager get tankBatches =>
      $$TankBatchesTableTableManager(_db, _db.tankBatches);
  $$TankUsageEventsTableTableManager get tankUsageEvents =>
      $$TankUsageEventsTableTableManager(_db, _db.tankUsageEvents);
}
