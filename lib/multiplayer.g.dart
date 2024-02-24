// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multiplayer.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$gameHash() => r'29c016126328ce50848b4f74c42b524dc9b94a09';

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

/// See also [game].
@ProviderFor(game)
const gameProvider = GameFamily();

/// See also [game].
class GameFamily extends Family<AsyncValue<Game?>> {
  /// See also [game].
  const GameFamily();

  /// See also [game].
  GameProvider call({
    required String gameId,
  }) {
    return GameProvider(
      gameId: gameId,
    );
  }

  @override
  GameProvider getProviderOverride(
    covariant GameProvider provider,
  ) {
    return call(
      gameId: provider.gameId,
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
  String? get name => r'gameProvider';
}

/// See also [game].
class GameProvider extends AutoDisposeFutureProvider<Game?> {
  /// See also [game].
  GameProvider({
    required String gameId,
  }) : this._internal(
          (ref) => game(
            ref as GameRef,
            gameId: gameId,
          ),
          from: gameProvider,
          name: r'gameProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$gameHash,
          dependencies: GameFamily._dependencies,
          allTransitiveDependencies: GameFamily._allTransitiveDependencies,
          gameId: gameId,
        );

  GameProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.gameId,
  }) : super.internal();

  final String gameId;

  @override
  Override overrideWith(
    FutureOr<Game?> Function(GameRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GameProvider._internal(
        (ref) => create(ref as GameRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        gameId: gameId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Game?> createElement() {
    return _GameProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GameProvider && other.gameId == gameId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, gameId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GameRef on AutoDisposeFutureProviderRef<Game?> {
  /// The parameter `gameId` of this provider.
  String get gameId;
}

class _GameProviderElement extends AutoDisposeFutureProviderElement<Game?>
    with GameRef {
  _GameProviderElement(super.provider);

  @override
  String get gameId => (origin as GameProvider).gameId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
