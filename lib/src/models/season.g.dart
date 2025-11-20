// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'season.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Season _$SeasonFromJson(Map<String, dynamic> json) => Season(
  name: json['name'] as String,
  seasonId: (json['season_id'] as num).toInt(),
  competitionEditionId: (json['competition_edition_id'] as num).toInt(),
);

Map<String, dynamic> _$SeasonToJson(Season instance) => <String, dynamic>{
  'name': instance.name,
  'season_id': instance.seasonId,
  'competition_edition_id': instance.competitionEditionId,
};
