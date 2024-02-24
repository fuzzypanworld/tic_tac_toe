// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Game _$GameFromJson(Map<String, dynamic> json) {
  return _Game.fromJson(json);
}

/// @nodoc
mixin _$Game {
  String get id => throw _privateConstructorUsedError;
  String get player1Id => throw _privateConstructorUsedError;
  String? get player2Id => throw _privateConstructorUsedError;
  String? get currentPlayerId => throw _privateConstructorUsedError;
  List<List<String>> get board => throw _privateConstructorUsedError;
  String? get winner => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameCopyWith<Game> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameCopyWith<$Res> {
  factory $GameCopyWith(Game value, $Res Function(Game) then) =
      _$GameCopyWithImpl<$Res, Game>;
  @useResult
  $Res call(
      {String id,
      String player1Id,
      String? player2Id,
      String? currentPlayerId,
      List<List<String>> board,
      String? winner});
}

/// @nodoc
class _$GameCopyWithImpl<$Res, $Val extends Game>
    implements $GameCopyWith<$Res> {
  _$GameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? player1Id = null,
    Object? player2Id = freezed,
    Object? currentPlayerId = freezed,
    Object? board = null,
    Object? winner = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      player1Id: null == player1Id
          ? _value.player1Id
          : player1Id // ignore: cast_nullable_to_non_nullable
              as String,
      player2Id: freezed == player2Id
          ? _value.player2Id
          : player2Id // ignore: cast_nullable_to_non_nullable
              as String?,
      currentPlayerId: freezed == currentPlayerId
          ? _value.currentPlayerId
          : currentPlayerId // ignore: cast_nullable_to_non_nullable
              as String?,
      board: null == board
          ? _value.board
          : board // ignore: cast_nullable_to_non_nullable
              as List<List<String>>,
      winner: freezed == winner
          ? _value.winner
          : winner // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameImplCopyWith<$Res> implements $GameCopyWith<$Res> {
  factory _$$GameImplCopyWith(
          _$GameImpl value, $Res Function(_$GameImpl) then) =
      __$$GameImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String player1Id,
      String? player2Id,
      String? currentPlayerId,
      List<List<String>> board,
      String? winner});
}

/// @nodoc
class __$$GameImplCopyWithImpl<$Res>
    extends _$GameCopyWithImpl<$Res, _$GameImpl>
    implements _$$GameImplCopyWith<$Res> {
  __$$GameImplCopyWithImpl(_$GameImpl _value, $Res Function(_$GameImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? player1Id = null,
    Object? player2Id = freezed,
    Object? currentPlayerId = freezed,
    Object? board = null,
    Object? winner = freezed,
  }) {
    return _then(_$GameImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      player1Id: null == player1Id
          ? _value.player1Id
          : player1Id // ignore: cast_nullable_to_non_nullable
              as String,
      player2Id: freezed == player2Id
          ? _value.player2Id
          : player2Id // ignore: cast_nullable_to_non_nullable
              as String?,
      currentPlayerId: freezed == currentPlayerId
          ? _value.currentPlayerId
          : currentPlayerId // ignore: cast_nullable_to_non_nullable
              as String?,
      board: null == board
          ? _value._board
          : board // ignore: cast_nullable_to_non_nullable
              as List<List<String>>,
      winner: freezed == winner
          ? _value.winner
          : winner // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameImpl implements _Game {
  const _$GameImpl(
      {required this.id,
      required this.player1Id,
      required this.player2Id,
      required this.currentPlayerId,
      required final List<List<String>> board,
      required this.winner})
      : _board = board;

  factory _$GameImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameImplFromJson(json);

  @override
  final String id;
  @override
  final String player1Id;
  @override
  final String? player2Id;
  @override
  final String? currentPlayerId;
  final List<List<String>> _board;
  @override
  List<List<String>> get board {
    if (_board is EqualUnmodifiableListView) return _board;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_board);
  }

  @override
  final String? winner;

  @override
  String toString() {
    return 'Game(id: $id, player1Id: $player1Id, player2Id: $player2Id, currentPlayerId: $currentPlayerId, board: $board, winner: $winner)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.player1Id, player1Id) ||
                other.player1Id == player1Id) &&
            (identical(other.player2Id, player2Id) ||
                other.player2Id == player2Id) &&
            (identical(other.currentPlayerId, currentPlayerId) ||
                other.currentPlayerId == currentPlayerId) &&
            const DeepCollectionEquality().equals(other._board, _board) &&
            (identical(other.winner, winner) || other.winner == winner));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, player1Id, player2Id,
      currentPlayerId, const DeepCollectionEquality().hash(_board), winner);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameImplCopyWith<_$GameImpl> get copyWith =>
      __$$GameImplCopyWithImpl<_$GameImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameImplToJson(
      this,
    );
  }
}

abstract class _Game implements Game {
  const factory _Game(
      {required final String id,
      required final String player1Id,
      required final String? player2Id,
      required final String? currentPlayerId,
      required final List<List<String>> board,
      required final String? winner}) = _$GameImpl;

  factory _Game.fromJson(Map<String, dynamic> json) = _$GameImpl.fromJson;

  @override
  String get id;
  @override
  String get player1Id;
  @override
  String? get player2Id;
  @override
  String? get currentPlayerId;
  @override
  List<List<String>> get board;
  @override
  String? get winner;
  @override
  @JsonKey(ignore: true)
  _$$GameImplCopyWith<_$GameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
