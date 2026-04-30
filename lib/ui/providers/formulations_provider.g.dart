// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'formulations_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$watchFormulationsHash() => r'94c99bea5ab72dd1c46267143a22963ad80653c1';

/// See also [watchFormulations].
@ProviderFor(watchFormulations)
final watchFormulationsProvider =
    AutoDisposeFutureProvider<List<Formulation>>.internal(
      watchFormulations,
      name: r'watchFormulationsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$watchFormulationsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchFormulationsRef = AutoDisposeFutureProviderRef<List<Formulation>>;
String _$formulationByIdHash() => r'1369f327edd30f0153ac624b86f4515d718827f7';

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

/// See also [formulationById].
@ProviderFor(formulationById)
const formulationByIdProvider = FormulationByIdFamily();

/// See also [formulationById].
class FormulationByIdFamily extends Family<AsyncValue<Formulation?>> {
  /// See also [formulationById].
  const FormulationByIdFamily();

  /// See also [formulationById].
  FormulationByIdProvider call(int id) {
    return FormulationByIdProvider(id);
  }

  @override
  FormulationByIdProvider getProviderOverride(
    covariant FormulationByIdProvider provider,
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
  String? get name => r'formulationByIdProvider';
}

/// See also [formulationById].
class FormulationByIdProvider extends AutoDisposeFutureProvider<Formulation?> {
  /// See also [formulationById].
  FormulationByIdProvider(int id)
    : this._internal(
        (ref) => formulationById(ref as FormulationByIdRef, id),
        from: formulationByIdProvider,
        name: r'formulationByIdProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$formulationByIdHash,
        dependencies: FormulationByIdFamily._dependencies,
        allTransitiveDependencies:
            FormulationByIdFamily._allTransitiveDependencies,
        id: id,
      );

  FormulationByIdProvider._internal(
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
    FutureOr<Formulation?> Function(FormulationByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FormulationByIdProvider._internal(
        (ref) => create(ref as FormulationByIdRef),
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
  AutoDisposeFutureProviderElement<Formulation?> createElement() {
    return _FormulationByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FormulationByIdProvider && other.id == id;
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
mixin FormulationByIdRef on AutoDisposeFutureProviderRef<Formulation?> {
  /// The parameter `id` of this provider.
  int get id;
}

class _FormulationByIdProviderElement
    extends AutoDisposeFutureProviderElement<Formulation?>
    with FormulationByIdRef {
  _FormulationByIdProviderElement(super.provider);

  @override
  int get id => (origin as FormulationByIdProvider).id;
}

String _$watchSnapshotsHash() => r'804ea273b75a7e6e4a3c285f18a75a7c692bbd10';

/// See also [watchSnapshots].
@ProviderFor(watchSnapshots)
const watchSnapshotsProvider = WatchSnapshotsFamily();

/// See also [watchSnapshots].
class WatchSnapshotsFamily
    extends Family<AsyncValue<List<db.FormulationSnapshot>>> {
  /// See also [watchSnapshots].
  const WatchSnapshotsFamily();

  /// See also [watchSnapshots].
  WatchSnapshotsProvider call(int formulationId) {
    return WatchSnapshotsProvider(formulationId);
  }

  @override
  WatchSnapshotsProvider getProviderOverride(
    covariant WatchSnapshotsProvider provider,
  ) {
    return call(provider.formulationId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'watchSnapshotsProvider';
}

/// See also [watchSnapshots].
class WatchSnapshotsProvider
    extends AutoDisposeFutureProvider<List<db.FormulationSnapshot>> {
  /// See also [watchSnapshots].
  WatchSnapshotsProvider(int formulationId)
    : this._internal(
        (ref) => watchSnapshots(ref as WatchSnapshotsRef, formulationId),
        from: watchSnapshotsProvider,
        name: r'watchSnapshotsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$watchSnapshotsHash,
        dependencies: WatchSnapshotsFamily._dependencies,
        allTransitiveDependencies:
            WatchSnapshotsFamily._allTransitiveDependencies,
        formulationId: formulationId,
      );

  WatchSnapshotsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.formulationId,
  }) : super.internal();

  final int formulationId;

  @override
  Override overrideWith(
    FutureOr<List<db.FormulationSnapshot>> Function(WatchSnapshotsRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchSnapshotsProvider._internal(
        (ref) => create(ref as WatchSnapshotsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        formulationId: formulationId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<db.FormulationSnapshot>>
  createElement() {
    return _WatchSnapshotsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchSnapshotsProvider &&
        other.formulationId == formulationId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, formulationId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchSnapshotsRef
    on AutoDisposeFutureProviderRef<List<db.FormulationSnapshot>> {
  /// The parameter `formulationId` of this provider.
  int get formulationId;
}

class _WatchSnapshotsProviderElement
    extends AutoDisposeFutureProviderElement<List<db.FormulationSnapshot>>
    with WatchSnapshotsRef {
  _WatchSnapshotsProviderElement(super.provider);

  @override
  int get formulationId => (origin as WatchSnapshotsProvider).formulationId;
}

String _$createSnapshotHash() => r'3d904cdb5cd2992e26ce87a3fde36f7583ae3973';

/// See also [createSnapshot].
@ProviderFor(createSnapshot)
const createSnapshotProvider = CreateSnapshotFamily();

/// See also [createSnapshot].
class CreateSnapshotFamily extends Family<AsyncValue<void>> {
  /// See also [createSnapshot].
  const CreateSnapshotFamily();

  /// See also [createSnapshot].
  CreateSnapshotProvider call({
    required int formulationId,
    required String note,
    required String triggerType,
    required String snapshotData,
  }) {
    return CreateSnapshotProvider(
      formulationId: formulationId,
      note: note,
      triggerType: triggerType,
      snapshotData: snapshotData,
    );
  }

  @override
  CreateSnapshotProvider getProviderOverride(
    covariant CreateSnapshotProvider provider,
  ) {
    return call(
      formulationId: provider.formulationId,
      note: provider.note,
      triggerType: provider.triggerType,
      snapshotData: provider.snapshotData,
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
  String? get name => r'createSnapshotProvider';
}

/// See also [createSnapshot].
class CreateSnapshotProvider extends AutoDisposeFutureProvider<void> {
  /// See also [createSnapshot].
  CreateSnapshotProvider({
    required int formulationId,
    required String note,
    required String triggerType,
    required String snapshotData,
  }) : this._internal(
         (ref) => createSnapshot(
           ref as CreateSnapshotRef,
           formulationId: formulationId,
           note: note,
           triggerType: triggerType,
           snapshotData: snapshotData,
         ),
         from: createSnapshotProvider,
         name: r'createSnapshotProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$createSnapshotHash,
         dependencies: CreateSnapshotFamily._dependencies,
         allTransitiveDependencies:
             CreateSnapshotFamily._allTransitiveDependencies,
         formulationId: formulationId,
         note: note,
         triggerType: triggerType,
         snapshotData: snapshotData,
       );

  CreateSnapshotProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.formulationId,
    required this.note,
    required this.triggerType,
    required this.snapshotData,
  }) : super.internal();

  final int formulationId;
  final String note;
  final String triggerType;
  final String snapshotData;

  @override
  Override overrideWith(
    FutureOr<void> Function(CreateSnapshotRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateSnapshotProvider._internal(
        (ref) => create(ref as CreateSnapshotRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        formulationId: formulationId,
        note: note,
        triggerType: triggerType,
        snapshotData: snapshotData,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _CreateSnapshotProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateSnapshotProvider &&
        other.formulationId == formulationId &&
        other.note == note &&
        other.triggerType == triggerType &&
        other.snapshotData == snapshotData;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, formulationId.hashCode);
    hash = _SystemHash.combine(hash, note.hashCode);
    hash = _SystemHash.combine(hash, triggerType.hashCode);
    hash = _SystemHash.combine(hash, snapshotData.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CreateSnapshotRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `formulationId` of this provider.
  int get formulationId;

  /// The parameter `note` of this provider.
  String get note;

  /// The parameter `triggerType` of this provider.
  String get triggerType;

  /// The parameter `snapshotData` of this provider.
  String get snapshotData;
}

class _CreateSnapshotProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with CreateSnapshotRef {
  _CreateSnapshotProviderElement(super.provider);

  @override
  int get formulationId => (origin as CreateSnapshotProvider).formulationId;
  @override
  String get note => (origin as CreateSnapshotProvider).note;
  @override
  String get triggerType => (origin as CreateSnapshotProvider).triggerType;
  @override
  String get snapshotData => (origin as CreateSnapshotProvider).snapshotData;
}

String _$deleteFormulationHash() => r'9fd38f5b2e741f75e861551b89dd2715883d7b80';

/// See also [deleteFormulation].
@ProviderFor(deleteFormulation)
const deleteFormulationProvider = DeleteFormulationFamily();

/// See also [deleteFormulation].
class DeleteFormulationFamily extends Family<AsyncValue<void>> {
  /// See also [deleteFormulation].
  const DeleteFormulationFamily();

  /// See also [deleteFormulation].
  DeleteFormulationProvider call(int id) {
    return DeleteFormulationProvider(id);
  }

  @override
  DeleteFormulationProvider getProviderOverride(
    covariant DeleteFormulationProvider provider,
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
  String? get name => r'deleteFormulationProvider';
}

/// See also [deleteFormulation].
class DeleteFormulationProvider extends AutoDisposeFutureProvider<void> {
  /// See also [deleteFormulation].
  DeleteFormulationProvider(int id)
    : this._internal(
        (ref) => deleteFormulation(ref as DeleteFormulationRef, id),
        from: deleteFormulationProvider,
        name: r'deleteFormulationProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$deleteFormulationHash,
        dependencies: DeleteFormulationFamily._dependencies,
        allTransitiveDependencies:
            DeleteFormulationFamily._allTransitiveDependencies,
        id: id,
      );

  DeleteFormulationProvider._internal(
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
    FutureOr<void> Function(DeleteFormulationRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteFormulationProvider._internal(
        (ref) => create(ref as DeleteFormulationRef),
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
    return _DeleteFormulationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteFormulationProvider && other.id == id;
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
mixin DeleteFormulationRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `id` of this provider.
  int get id;
}

class _DeleteFormulationProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with DeleteFormulationRef {
  _DeleteFormulationProviderElement(super.provider);

  @override
  int get id => (origin as DeleteFormulationProvider).id;
}

String _$formulationFormHash() => r'0579d5bd2ad222ad81827e2237d65a6baa647d5f';

/// See also [FormulationForm].
@ProviderFor(FormulationForm)
final formulationFormProvider =
    AutoDisposeNotifierProvider<FormulationForm, Formulation?>.internal(
      FormulationForm.new,
      name: r'formulationFormProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$formulationFormHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$FormulationForm = AutoDisposeNotifier<Formulation?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
