// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameImpl _$$GameImplFromJson(Map<String, dynamic> json) => _$GameImpl(
      id: json['id'] as String,
      player1Id: json['player1Id'] as String,
      player2Id: json['player2Id'] as String?,
      currentPlayerId: json['currentPlayerId'] as String?,
      board: (json['board'] as List<dynamic>)
          .map((e) => (e as List<dynamic>).map((e) => e as String).toList())
          .toList(),
      winner: json['winner'] as String?,
    );

Map<String, dynamic> _$$GameImplToJson(_$GameImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'player1Id': instance.player1Id,
      'player2Id': instance.player2Id,
      'currentPlayerId': instance.currentPlayerId,
      'board': instance.board,
      'winner': instance.winner,
    };
