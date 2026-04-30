// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_quality_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$watchWaterQualitiesHash() =>
    r'30403ffd6f2dd28ceacb0ced4d467552ea078e01';

/// See also [watchWaterQualities].
@ProviderFor(watchWaterQualities)
final watchWaterQualitiesProvider =
    AutoDisposeFutureProvider<List<db.WaterQualityData>>.internal(
      watchWaterQualities,
      name: r'watchWaterQualitiesProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$watchWaterQualitiesHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchWaterQualitiesRef =
    AutoDisposeFutureProviderRef<List<db.WaterQualityData>>;
String _$waterQualityByIdHash() => r'410ea8eb9f88d8743b71c8abc66067b14156beb2';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [waterQualityById].
@ProviderFor(waterQualityById)
const waterQualityByIdProvider = WaterQualityByIdFamily();

/// See also [waterQualityById].
class WaterQualityByIdFamily extends Family<AsyncValue<db.WaterQualityData?>> {
  /// See also [waterQualityById].
  const WaterQualityByIdFamily();

  /// See also [waterQualityById].
  WaterQualityByIdProvider call(int id) {
    return WaterQualityByIdProvider(id);
  }

  @override
  WaterQualityByIdProvider getProviderOverride(
    covariant WaterQualityByIdProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'waterQualityByIdProvider';
}

/// See also [waterQualityById].
class WaterQualityByIdProvider
    extends AutoDisposeFutureProvider<db.WaterQualityData?> {
  /// See also [waterQualityById].
  WaterQualityByIdProvider(int id)
    : this._internal(
        (ref) => waterQualityById(ref as WaterQualityByIdRef, id),
        from: waterQualityByIdProvider,
        name: r'waterQualityByIdProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$waterQualityByIdHash,
        dependencies: WaterQualityByIdFamily._dependencies,
        allTransitiveDependencies:
            WaterQualityByIdFamily._allTransitiveDependencies,
        id: id,
      );

  WaterQualityByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<db.WaterQualityData?> Function(WaterQualityByIdRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WaterQualityByIdProvider._internal(
        (ref) => create(ref as WaterQualityByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<db.WaterQualityData?> createElement() {
    return _WaterQualityByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WaterQualityByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WaterQualityByIdRef
    on AutoDisposeFutureProviderRef<db.WaterQualityData?> {
  /// The parameter `id` of this provider.
  int get id;
}

class _WaterQualityByIdProviderElement
    extends AutoDisposeFutureProviderElement<db.WaterQualityData?>
    with WaterQualityByIdRef {
  _WaterQualityByIdProviderElement(super.provider);

  @override
  int get id => (origin as WaterQualityByIdProvider).id;
}

String _$deleteWaterQualityHash() =>
    r'287eebd54b2f33aba2dcc9614773d15cc5b66895';

/// See also [deleteWaterQuality].
@ProviderFor(deleteWaterQuality)
const deleteWaterQualityProvider = DeleteWaterQualityFamily();

/// See also [deleteWaterQuality].
class DeleteWaterQualityFamily extends Family<AsyncValue<void>> {
  /// See also [deleteWaterQuality].
  const DeleteWaterQualityFamily();

  /// See also [deleteWaterQuality].
  DeleteWaterQualityProvider call(int id) {
    return DeleteWaterQualityProvider(id);
  }

  @override
  DeleteWaterQualityProvider getProviderOverride(
    covariant DeleteWaterQualityProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'deleteWaterQualityProvider';
}

/// See also [deleteWaterQuality].
class DeleteWaterQualityProvider extends AutoDisposeFutureProvider<void> {
  /// See also [deleteWaterQuality].
  DeleteWaterQualityProvider(int id)
    : this._internal(
        (ref) => deleteWaterQuality(ref as DeleteWaterQualityRef, id),
        from: deleteWaterQualityProvider,
        name: r'deleteWaterQualityProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$deleteWaterQualityHash,
        dependencies: DeleteWaterQualityFamily._dependencies,
        allTransitiveDependencies:
            DeleteWaterQualityFamily._allTransitiveDependencies,
        id: id,
      );

  DeleteWaterQualityProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<void> Function(DeleteWaterQualityRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteWaterQualityProvider._internal(
        (ref) => create(ref as DeleteWaterQualityRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _DeleteWaterQualityProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteWaterQualityProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DeleteWaterQualityRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `id` of this provider.
  int get id;
}

class _DeleteWaterQualityProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with DeleteWaterQualityRef {
  _DeleteWaterQualityProviderElement(super.provider);

  @override
  int get id => (origin as DeleteWaterQualityProvider).id;
}

String _$watchTissuesHash() => r'2952b320dd648156f638297889310a7b1f06ea56';

/// See also [watchTissues].
@ProviderFor(watchTissues)
final watchTissuesProvider =
    AutoDisposeFutureProvider<List<db.TissueAnalysi>>.internal(
      watchTissues,
      name: r'watchTissuesProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$watchTissuesHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchTissuesRef = AutoDisposeFutureProviderRef<List<db.TissueAnalysi>>;
String _$tissueByIdHash() => r'874439386509b5a4e3aac8477a1f0f1dd39b6f66';

/// See also [tissueById].
@ProviderFor(tissueById)
const tissueByIdProvider = TissueByIdFamily();

/// See also [tissueById].
class TissueByIdFamily extends Family<AsyncValue<db.TissueAnalysi?>> {
  /// See also [tissueById].
  const TissueByIdFamily();

  /// See also [tissueById].
  TissueByIdProvider call(int id) {
    return TissueByIdProvider(id);
  }

  @override
  TissueByIdProvider getProviderOverride(
    covariant TissueByIdProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'tissueByIdProvider';
}

/// See also [tissueById].
class TissueByIdProvider extends AutoDisposeFutureProvider<db.TissueAnalysi?> {
  /// See also [tissueById].
  TissueByIdProvider(int id)
    : this._internal(
        (ref) => tissueById(ref as TissueByIdRef, id),
        from: tissueByIdProvider,
        name: r'tissueByIdProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$tissueByIdHash,
        dependencies: TissueByIdFamily._dependencies,
        allTransitiveDependencies: TissueByIdFamily._allTransitiveDependencies,
        id: id,
      );

  TissueByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<db.TissueAnalysi?> Function(TissueByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TissueByIdProvider._internal(
        (ref) => create(ref as TissueByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<db.TissueAnalysi?> createElement() {
    return _TissueByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TissueByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TissueByIdRef on AutoDisposeFutureProviderRef<db.TissueAnalysi?> {
  /// The parameter `id` of this provider.
  int get id;
}

class _TissueByIdProviderElement
    extends AutoDisposeFutureProviderElement<db.TissueAnalysi?>
    with TissueByIdRef {
  _TissueByIdProviderElement(super.provider);

  @override
  int get id => (origin as TissueByIdProvider).id;
}

String _$deleteTissueHash() => r'2438545a575c9c4b24744f7224fb9b6d45481f5c';

/// See also [deleteTissue].
@ProviderFor(deleteTissue)
const deleteTissueProvider = DeleteTissueFamily();

/// See also [deleteTissue].
class DeleteTissueFamily extends Family<AsyncValue<void>> {
  /// See also [deleteTissue].
  const DeleteTissueFamily();

  /// See also [deleteTissue].
  DeleteTissueProvider call(int id) {
    return DeleteTissueProvider(id);
  }

  @override
  DeleteTissueProvider getProviderOverride(
    covariant DeleteTissueProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'deleteTissueProvider';
}

/// See also [deleteTissue].
class DeleteTissueProvider extends AutoDisposeFutureProvider<void> {
  /// See also [deleteTissue].
  DeleteTissueProvider(int id)
    : this._internal(
        (ref) => deleteTissue(ref as DeleteTissueRef, id),
        from: deleteTissueProvider,
        name: r'deleteTissueProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$deleteTissueHash,
        dependencies: DeleteTissueFamily._dependencies,
        allTransitiveDependencies:
            DeleteTissueFamily._allTransitiveDependencies,
        id: id,
      );

  DeleteTissueProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<void> Function(DeleteTissueRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteTissueProvider._internal(
        (ref) => create(ref as DeleteTissueRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _DeleteTissueProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteTissueProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DeleteTissueRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `id` of this provider.
  int get id;
}

class _DeleteTissueProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with DeleteTissueRef {
  _DeleteTissueProviderElement(super.provider);

  @override
  int get id => (origin as DeleteTissueProvider).id;
}

String _$waterQualityFormHash() => r'07809225057aa5c0dc0f8556aa23096945abba3d';

/// See also [WaterQualityForm].
@ProviderFor(WaterQualityForm)
final waterQualityFormProvider =
    AutoDisposeAsyncNotifierProvider<WaterQualityForm, void>.internal(
      WaterQualityForm.new,
      name: r'waterQualityFormProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$waterQualityFormHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$WaterQualityForm = AutoDisposeAsyncNotifier<void>;
String _$tissueFormHash() => r'5a6262fa9c277d2155db5ea8ad7aeb7f566d7502';

/// See also [TissueForm].
@ProviderFor(TissueForm)
final tissueFormProvider =
    AutoDisposeAsyncNotifierProvider<TissueForm, void>.internal(
      TissueForm.new,
      name: r'tissueFormProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$tissueFormHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$TissueForm = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
