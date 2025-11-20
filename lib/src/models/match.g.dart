// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Match _$MatchFromJson(Map<String, dynamic> json) => Match(
  name: json['name'] as String,
  matchId: (json['match_id'] as num).toInt(),
  date: json['date'] as String,
  competitionId: (json['competition_id'] as num).toInt(),
  seasonId: (json['season_id'] as num).toInt(),
);

Map<String, dynamic> _$MatchToJson(Match instance) => <String, dynamic>{
  'name': instance.name,
  'match_id': instance.matchId,
  'date': instance.date,
  'competition_id': instance.competitionId,
  'season_id': instance.seasonId,
};
