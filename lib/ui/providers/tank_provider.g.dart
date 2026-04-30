// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tank_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$watchTankBatchesHash() => r'1d111dd5e884f539ef077567f56a57a564ecfaea';

/// See also [watchTankBatches].
@ProviderFor(watchTankBatches)
final watchTankBatchesProvider =
    AutoDisposeFutureProvider<List<TankBatch>>.internal(
      watchTankBatches,
      name: r'watchTankBatchesProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$watchTankBatchesHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchTankBatchesRef = AutoDisposeFutureProviderRef<List<TankBatch>>;
String _$tankBatchByIdHash() => r'407f6e22d971262afbf6bdfb752f687f6b42bab2';

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

/// See also [tankBatchById].
@ProviderFor(tankBatchById)
const tankBatchByIdProvider = TankBatchByIdFamily();

/// See also [tankBatchById].
class TankBatchByIdFamily extends Family<AsyncValue<TankBatch?>> {
  /// See also [tankBatchById].
  const TankBatchByIdFamily();

  /// See also [tankBatchById].
  TankBatchByIdProvider call(int id) {
    return TankBatchByIdProvider(id);
  }

  @override
  TankBatchByIdProvider getProviderOverride(
    covariant TankBatchByIdProvider provider,
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
  String? get name => r'tankBatchByIdProvider';
}

/// See also [tankBatchById].
class TankBatchByIdProvider extends AutoDisposeFutureProvider<TankBatch?> {
  /// See also [tankBatchById].
  TankBatchByIdProvider(int id)
    : this._internal(
        (ref) => tankBatchById(ref as TankBatchByIdRef, id),
        from: tankBatchByIdProvider,
        name: r'tankBatchByIdProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$tankBatchByIdHash,
        dependencies: TankBatchByIdFamily._dependencies,
        allTransitiveDependencies:
            TankBatchByIdFamily._allTransitiveDependencies,
        id: id,
      );

  TankBatchByIdProvider._internal(
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
    FutureOr<TankBatch?> Function(TankBatchByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TankBatchByIdProvider._internal(
        (ref) => create(ref as TankBatchByIdRef),
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
  AutoDisposeFutureProviderElement<TankBatch?> createElement() {
    return _TankBatchByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TankBatchByIdProvider && other.id == id;
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
mixin TankBatchByIdRef on AutoDisposeFutureProviderRef<TankBatch?> {
  /// The parameter `id` of this provider.
  int get id;
}

class _TankBatchByIdProviderElement
    extends AutoDisposeFutureProviderElement<TankBatch?>
    with TankBatchByIdRef {
  _TankBatchByIdProviderElement(super.provider);

  @override
  int get id => (origin as TankBatchByIdProvider).id;
}

String _$deleteTankBatchHash() => r'6c572e8709519ce8d7bc4f2d67e0ee2071a95800';

/// See also [deleteTankBatch].
@ProviderFor(deleteTankBatch)
const deleteTankBatchProvider = DeleteTankBatchFamily();

/// See also [deleteTankBatch].
class DeleteTankBatchFamily extends Family<AsyncValue<void>> {
  /// See also [deleteTankBatch].
  const DeleteTankBatchFamily();

  /// See also [deleteTankBatch].
  DeleteTankBatchProvider call(int id) {
    return DeleteTankBatchProvider(id);
  }

  @override
  DeleteTankBatchProvider getProviderOverride(
    covariant DeleteTankBatchProvider provider,
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
  String? get name => r'deleteTankBatchProvider';
}

/// See also [deleteTankBatch].
class DeleteTankBatchProvider extends AutoDisposeFutureProvider<void> {
  /// See also [deleteTankBatch].
  DeleteTankBatchProvider(int id)
    : this._internal(
        (ref) => deleteTankBatch(ref as DeleteTankBatchRef, id),
        from: deleteTankBatchProvider,
        name: r'deleteTankBatchProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$deleteTankBatchHash,
        dependencies: DeleteTankBatchFamily._dependencies,
        allTransitiveDependencies:
            DeleteTankBatchFamily._allTransitiveDependencies,
        id: id,
      );

  DeleteTankBatchProvider._internal(
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
    FutureOr<void> Function(DeleteTankBatchRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteTankBatchProvider._internal(
        (ref) => create(ref as DeleteTankBatchRef),
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
    return _DeleteTankBatchProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteTankBatchProvider && other.id == id;
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
mixin DeleteTankBatchRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `id` of this provider.
  int get id;
}

class _DeleteTankBatchProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with DeleteTankBatchRef {
  _DeleteTankBatchProviderElement(super.provider);

  @override
  int get id => (origin as DeleteTankBatchProvider).id;
}

String _$watchUsageEventsHash() => r'a2d3997fa2c2ee4e585d44a3df76fab300b99acb';

/// See also [watchUsageEvents].
@ProviderFor(watchUsageEvents)
const watchUsageEventsProvider = WatchUsageEventsFamily();

/// See also [watchUsageEvents].
class WatchUsageEventsFamily extends Family<AsyncValue<List<TankUsageEvent>>> {
  /// See also [watchUsageEvents].
  const WatchUsageEventsFamily();

  /// See also [watchUsageEvents].
  WatchUsageEventsProvider call(int tankBatchId) {
    return WatchUsageEventsProvider(tankBatchId);
  }

  @override
  WatchUsageEventsProvider getProviderOverride(
    covariant WatchUsageEventsProvider provider,
  ) {
    return call(provider.tankBatchId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'watchUsageEventsProvider';
}

/// See also [watchUsageEvents].
class WatchUsageEventsProvider
    extends AutoDisposeFutureProvider<List<TankUsageEvent>> {
  /// See also [watchUsageEvents].
  WatchUsageEventsProvider(int tankBatchId)
    : this._internal(
        (ref) => watchUsageEvents(ref as WatchUsageEventsRef, tankBatchId),
        from: watchUsageEventsProvider,
        name: r'watchUsageEventsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$watchUsageEventsHash,
        dependencies: WatchUsageEventsFamily._dependencies,
        allTransitiveDependencies:
            WatchUsageEventsFamily._allTransitiveDependencies,
        tankBatchId: tankBatchId,
      );

  WatchUsageEventsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tankBatchId,
  }) : super.internal();

  final int tankBatchId;

  @override
  Override overrideWith(
    FutureOr<List<TankUsageEvent>> Function(WatchUsageEventsRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchUsageEventsProvider._internal(
        (ref) => create(ref as WatchUsageEventsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tankBatchId: tankBatchId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<TankUsageEvent>> createElement() {
    return _WatchUsageEventsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchUsageEventsProvider &&
        other.tankBatchId == tankBatchId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tankBatchId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchUsageEventsRef
    on AutoDisposeFutureProviderRef<List<TankUsageEvent>> {
  /// The parameter `tankBatchId` of this provider.
  int get tankBatchId;
}

class _WatchUsageEventsProviderElement
    extends AutoDisposeFutureProviderElement<List<TankUsageEvent>>
    with WatchUsageEventsRef {
  _WatchUsageEventsProviderElement(super.provider);

  @override
  int get tankBatchId => (origin as WatchUsageEventsProvider).tankBatchId;
}

String _$addUsageEventHash() => r'c4bb4dedba99bf910aecb723d6908f330bb7cad7';

/// See also [addUsageEvent].
@ProviderFor(addUsageEvent)
const addUsageEventProvider = AddUsageEventFamily();

/// See also [addUsageEvent].
class AddUsageEventFamily extends Family<AsyncValue<void>> {
  /// See also [addUsageEvent].
  const AddUsageEventFamily();

  /// See also [addUsageEvent].
  AddUsageEventProvider call(
    int tankBatchId,
    String eventType,
    double volume,
    String? notes,
  ) {
    return AddUsageEventProvider(tankBatchId, eventType, volume, notes);
  }

  @override
  AddUsageEventProvider getProviderOverride(
    covariant AddUsageEventProvider provider,
  ) {
    return call(
      provider.tankBatchId,
      provider.eventType,
      provider.volume,
      provider.notes,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'addUsageEventProvider';
}

/// See also [addUsageEvent].
class AddUsageEventProvider extends AutoDisposeFutureProvider<void> {
  /// See also [addUsageEvent].
  AddUsageEventProvider(
    int tankBatchId,
    String eventType,
    double volume,
    String? notes,
  ) : this._internal(
        (ref) => addUsageEvent(
          ref as AddUsageEventRef,
          tankBatchId,
          eventType,
          volume,
          notes,
        ),
        from: addUsageEventProvider,
        name: r'addUsageEventProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$addUsageEventHash,
        dependencies: AddUsageEventFamily._dependencies,
        allTransitiveDependencies:
            AddUsageEventFamily._allTransitiveDependencies,
        tankBatchId: tankBatchId,
        eventType: eventType,
        volume: volume,
        notes: notes,
      );

  AddUsageEventProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tankBatchId,
    required this.eventType,
    required this.volume,
    required this.notes,
  }) : super.internal();

  final int tankBatchId;
  final String eventType;
  final double volume;
  final String? notes;

  @override
  Override overrideWith(
    FutureOr<void> Function(AddUsageEventRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddUsageEventProvider._internal(
        (ref) => create(ref as AddUsageEventRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tankBatchId: tankBatchId,
        eventType: eventType,
        volume: volume,
        notes: notes,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _AddUsageEventProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddUsageEventProvider &&
        other.tankBatchId == tankBatchId &&
        other.eventType == eventType &&
        other.volume == volume &&
        other.notes == notes;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tankBatchId.hashCode);
    hash = _SystemHash.combine(hash, eventType.hashCode);
    hash = _SystemHash.combine(hash, volume.hashCode);
    hash = _SystemHash.combine(hash, notes.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AddUsageEventRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `tankBatchId` of this provider.
  int get tankBatchId;

  /// The parameter `eventType` of this provider.
  String get eventType;

  /// The parameter `volume` of this provider.
  double get volume;

  /// The parameter `notes` of this provider.
  String? get notes;
}

class _AddUsageEventProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with AddUsageEventRef {
  _AddUsageEventProviderElement(super.provider);

  @override
  int get tankBatchId => (origin as AddUsageEventProvider).tankBatchId;
  @override
  String get eventType => (origin as AddUsageEventProvider).eventType;
  @override
  double get volume => (origin as AddUsageEventProvider).volume;
  @override
  String? get notes => (origin as AddUsageEventProvider).notes;
}

String _$watchSubstancesUsedHash() =>
    r'6431dbf1978dad8b4c370091ce6352bce58a93ec';

/// See also [watchSubstancesUsed].
@ProviderFor(watchSubstancesUsed)
final watchSubstancesUsedProvider =
    AutoDisposeFutureProvider<List<SubstanceUsed>>.internal(
      watchSubstancesUsed,
      name: r'watchSubstancesUsedProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$watchSubstancesUsedHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchSubstancesUsedRef =
    AutoDisposeFutureProviderRef<List<SubstanceUsed>>;
String _$addSubstanceUsedHash() => r'7f4913b84330790aa2c9425cba9d9e41039ff12d';

/// See also [addSubstanceUsed].
@ProviderFor(addSubstanceUsed)
const addSubstanceUsedProvider = AddSubstanceUsedFamily();

/// See also [addSubstanceUsed].
class AddSubstanceUsedFamily extends Family<AsyncValue<void>> {
  /// See also [addSubstanceUsed].
  const AddSubstanceUsedFamily();

  /// See also [addSubstanceUsed].
  AddSubstanceUsedProvider call(int substanceId, double weight) {
    return AddSubstanceUsedProvider(substanceId, weight);
  }

  @override
  AddSubstanceUsedProvider getProviderOverride(
    covariant AddSubstanceUsedProvider provider,
  ) {
    return call(provider.substanceId, provider.weight);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'addSubstanceUsedProvider';
}

/// See also [addSubstanceUsed].
class AddSubstanceUsedProvider extends AutoDisposeFutureProvider<void> {
  /// See also [addSubstanceUsed].
  AddSubstanceUsedProvider(int substanceId, double weight)
    : this._internal(
        (ref) =>
            addSubstanceUsed(ref as AddSubstanceUsedRef, substanceId, weight),
        from: addSubstanceUsedProvider,
        name: r'addSubstanceUsedProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$addSubstanceUsedHash,
        dependencies: AddSubstanceUsedFamily._dependencies,
        allTransitiveDependencies:
            AddSubstanceUsedFamily._allTransitiveDependencies,
        substanceId: substanceId,
        weight: weight,
      );

  AddSubstanceUsedProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.substanceId,
    required this.weight,
  }) : super.internal();

  final int substanceId;
  final double weight;

  @override
  Override overrideWith(
    FutureOr<void> Function(AddSubstanceUsedRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddSubstanceUsedProvider._internal(
        (ref) => create(ref as AddSubstanceUsedRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        substanceId: substanceId,
        weight: weight,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _AddSubstanceUsedProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddSubstanceUsedProvider &&
        other.substanceId == substanceId &&
        other.weight == weight;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, substanceId.hashCode);
    hash = _SystemHash.combine(hash, weight.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AddSubstanceUsedRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `substanceId` of this provider.
  int get substanceId;

  /// The parameter `weight` of this provider.
  double get weight;
}

class _AddSubstanceUsedProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with AddSubstanceUsedRef {
  _AddSubstanceUsedProviderElement(super.provider);

  @override
  int get substanceId => (origin as AddSubstanceUsedProvider).substanceId;
  @override
  double get weight => (origin as AddSubstanceUsedProvider).weight;
}

String _$tankBatchFormHash() => r'20b414055cf317d3537bb34e1567c0043606975e';

/// See also [TankBatchForm].
@ProviderFor(TankBatchForm)
final tankBatchFormProvider =
    AutoDisposeNotifierProvider<TankBatchForm, TankBatchFormState>.internal(
      TankBatchForm.new,
      name: r'tankBatchFormProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$tankBatchFormHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$TankBatchForm = AutoDisposeNotifier<TankBatchFormState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
