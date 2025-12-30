// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'season.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Season _$SeasonFromJson(Map<String, dynamic> json) => Season(
  name: json['name'] as String,
  seasonId: (json['seasonId'] as num).toInt(),
  competitionEditionId: (json['competitionEditionId'] as num).toInt(),
);

Map<String, dynamic> _$SeasonToJson(Season instance) => <String, dynamic>{
  'name': instance.name,
  'seasonId': instance.seasonId,
  'competitionEditionId': instance.competitionEditionId,
};
