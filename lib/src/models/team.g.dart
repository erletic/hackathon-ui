// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Team _$TeamFromJson(Map<String, dynamic> json) => Team(
  name: json['name'] as String,
  teamId: (json['team_id'] as num).toInt(),
);

Map<String, dynamic> _$TeamToJson(Team instance) => <String, dynamic>{
  'name': instance.name,
  'team_id': instance.teamId,
};
