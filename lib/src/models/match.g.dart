// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Match _$MatchFromJson(Map<String, dynamic> json) => Match(
  name: json['name'] as String,
  matchId: (json['matchId'] as num).toInt(),
  date: json['date'] as String,
  competitionId: (json['competitionId'] as num).toInt(),
  seasonId: (json['seasonId'] as num).toInt(),
);

Map<String, dynamic> _$MatchToJson(Match instance) => <String, dynamic>{
  'name': instance.name,
  'matchId': instance.matchId,
  'date': instance.date,
  'competitionId': instance.competitionId,
  'seasonId': instance.seasonId,
};
