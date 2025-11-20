// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Player _$PlayerFromJson(Map<String, dynamic> json) => Player(
  name: json['name'] as String,
  shortName: json['short_name'] as String,
  playerId: (json['player_id'] as num).toInt(),
  birthdate: json['birthdate'] as String,
  teamId: (json['team_id'] as num).toInt(),
);

Map<String, dynamic> _$PlayerToJson(Player instance) => <String, dynamic>{
  'name': instance.name,
  'short_name': instance.shortName,
  'player_id': instance.playerId,
  'birthdate': instance.birthdate,
  'team_id': instance.teamId,
};
