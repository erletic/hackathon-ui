// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'competition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Competition _$CompetitionFromJson(Map<String, dynamic> json) => Competition(
  name: json['name'] as String,
  competitionId: (json['competition_id'] as num).toInt(),
);

Map<String, dynamic> _$CompetitionToJson(Competition instance) =>
    <String, dynamic>{
      'name': instance.name,
      'competition_id': instance.competitionId,
    };
