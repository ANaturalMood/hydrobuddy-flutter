// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'substances_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$watchSubstancesHash() => r'7cc5884f652c558494f903884aceb37ef8e356dd';

/// See also [watchSubstances].
@ProviderFor(watchSubstances)
final watchSubstancesProvider =
    AutoDisposeFutureProvider<List<Substance>>.internal(
      watchSubstances,
      name: r'watchSubstancesProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$watchSubstancesHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchSubstancesRef = AutoDisposeFutureProviderRef<List<Substance>>;
String _$substanceByIdHash() => r'fa9be35bbc238fd5311ecd6d3f6727e9c1569f86';

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

/// See also [substanceById].
@ProviderFor(substanceById)
const substanceByIdProvider = SubstanceByIdFamily();

/// See also [substanceById].
class SubstanceByIdFamily extends Family<AsyncValue<Substance?>> {
  /// See also [substanceById].
  const SubstanceByIdFamily();

  /// See also [substanceById].
  SubstanceByIdProvider call(int id) {
    return SubstanceByIdProvider(id);
  }

  @override
  SubstanceByIdProvider getProviderOverride(
    covariant SubstanceByIdProvider provider,
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
  String? get name => r'substanceByIdProvider';
}

/// See also [substanceById].
class SubstanceByIdProvider extends AutoDisposeFutureProvider<Substance?> {
  /// See also [substanceById].
  SubstanceByIdProvider(int id)
    : this._internal(
        (ref) => substanceById(ref as SubstanceByIdRef, id),
        from: substanceByIdProvider,
        name: r'substanceByIdProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$substanceByIdHash,
        dependencies: SubstanceByIdFamily._dependencies,
        allTransitiveDependencies:
            SubstanceByIdFamily._allTransitiveDependencies,
        id: id,
      );

  SubstanceByIdProvider._internal(
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
    FutureOr<Substance?> Function(SubstanceByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SubstanceByIdProvider._internal(
        (ref) => create(ref as SubstanceByIdRef),
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
  AutoDisposeFutureProviderElement<Substance?> createElement() {
    return _SubstanceByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SubstanceByIdProvider && other.id == id;
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
mixin SubstanceByIdRef on AutoDisposeFutureProviderRef<Substance?> {
  /// The parameter `id` of this provider.
  int get id;
}

class _SubstanceByIdProviderElement
    extends AutoDisposeFutureProviderElement<Substance?>
    with SubstanceByIdRef {
  _SubstanceByIdProviderElement(super.provider);

  @override
  int get id => (origin as SubstanceByIdProvider).id;
}

String _$searchSubstancesHash() => r'296fe86c70de390673e6b7b892f51e8fc3f1c3f4';

/// See also [searchSubstances].
@ProviderFor(searchSubstances)
const searchSubstancesProvider = SearchSubstancesFamily();

/// See also [searchSubstances].
class SearchSubstancesFamily extends Family<AsyncValue<List<Substance>>> {
  /// See also [searchSubstances].
  const SearchSubstancesFamily();

  /// See also [searchSubstances].
  SearchSubstancesProvider call(String query) {
    return SearchSubstancesProvider(query);
  }

  @override
  SearchSubstancesProvider getProviderOverride(
    covariant SearchSubstancesProvider provider,
  ) {
    return call(provider.query);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'searchSubstancesProvider';
}

/// See also [searchSubstances].
class SearchSubstancesProvider
    extends AutoDisposeFutureProvider<List<Substance>> {
  /// See also [searchSubstances].
  SearchSubstancesProvider(String query)
    : this._internal(
        (ref) => searchSubstances(ref as SearchSubstancesRef, query),
        from: searchSubstancesProvider,
        name: r'searchSubstancesProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$searchSubstancesHash,
        dependencies: SearchSubstancesFamily._dependencies,
        allTransitiveDependencies:
            SearchSubstancesFamily._allTransitiveDependencies,
        query: query,
      );

  SearchSubstancesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final String query;

  @override
  Override overrideWith(
    FutureOr<List<Substance>> Function(SearchSubstancesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SearchSubstancesProvider._internal(
        (ref) => create(ref as SearchSubstancesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Substance>> createElement() {
    return _SearchSubstancesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchSubstancesProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SearchSubstancesRef on AutoDisposeFutureProviderRef<List<Substance>> {
  /// The parameter `query` of this provider.
  String get query;
}

class _SearchSubstancesProviderElement
    extends AutoDisposeFutureProviderElement<List<Substance>>
    with SearchSubstancesRef {
  _SearchSubstancesProviderElement(super.provider);

  @override
  String get query => (origin as SearchSubstancesProvider).query;
}

String _$deleteSubstanceHash() => r'8b0c195896cd3c2d5e5970bcfb03af9bd6503558';

/// See also [deleteSubstance].
@ProviderFor(deleteSubstance)
const deleteSubstanceProvider = DeleteSubstanceFamily();

/// See also [deleteSubstance].
class DeleteSubstanceFamily extends Family<AsyncValue<void>> {
  /// See also [deleteSubstance].
  const DeleteSubstanceFamily();

  /// See also [deleteSubstance].
  DeleteSubstanceProvider call(int id) {
    return DeleteSubstanceProvider(id);
  }

  @override
  DeleteSubstanceProvider getProviderOverride(
    covariant DeleteSubstanceProvider provider,
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
  String? get name => r'deleteSubstanceProvider';
}

/// See also [deleteSubstance].
class DeleteSubstanceProvider extends AutoDisposeFutureProvider<void> {
  /// See also [deleteSubstance].
  DeleteSubstanceProvider(int id)
    : this._internal(
        (ref) => deleteSubstance(ref as DeleteSubstanceRef, id),
        from: deleteSubstanceProvider,
        name: r'deleteSubstanceProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$deleteSubstanceHash,
        dependencies: DeleteSubstanceFamily._dependencies,
        allTransitiveDependencies:
            DeleteSubstanceFamily._allTransitiveDependencies,
        id: id,
      );

  DeleteSubstanceProvider._internal(
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
    FutureOr<void> Function(DeleteSubstanceRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteSubstanceProvider._internal(
        (ref) => create(ref as DeleteSubstanceRef),
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
    return _DeleteSubstanceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteSubstanceProvider && other.id == id;
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
mixin DeleteSubstanceRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `id` of this provider.
  int get id;
}

class _DeleteSubstanceProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with DeleteSubstanceRef {
  _DeleteSubstanceProviderElement(super.provider);

  @override
  int get id => (origin as DeleteSubstanceProvider).id;
}

String _$substanceFormHash() => r'504e1ba03b1737c41ed892744823c433bb6d81df';

/// See also [SubstanceForm].
@ProviderFor(SubstanceForm)
final substanceFormProvider =
    AutoDisposeAsyncNotifierProvider<SubstanceForm, void>.internal(
      SubstanceForm.new,
      name: r'substanceFormProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$substanceFormHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SubstanceForm = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
