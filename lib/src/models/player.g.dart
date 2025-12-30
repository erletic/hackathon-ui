// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Player _$PlayerFromJson(Map<String, dynamic> json) => Player(
  name: json['name'] as String,
  shortName: json['shortName'] as String,
  playerId: (json['playerId'] as num).toInt(),
  birthdate: json['birthdate'] as String,
  teamName: json['teamName'] as String,
  imgurl: json['imgurl'] as String?,
  marketvalue: (json['marketvalue'] as num?)?.toInt(),
  minutes: (json['minutes'] as num?)?.toDouble(),
  distance: (json['distance'] as num?)?.toDouble(),
  metersPerMinute: (json['metersPerMinute'] as num?)?.toDouble(),
  runningDistance: (json['runningDistance'] as num?)?.toDouble(),
  hsrDistance: (json['hsrDistance'] as num?)?.toDouble(),
  hsrCount: (json['hsrCount'] as num?)?.toInt(),
  sprintDistance: (json['sprintDistance'] as num?)?.toDouble(),
  sprintCount: (json['sprintCount'] as num?)?.toInt(),
  hiDistance: (json['hiDistance'] as num?)?.toDouble(),
  hiCount: (json['hiCount'] as num?)?.toInt(),
  psv99: (json['psv99'] as num?)?.toDouble(),
  mediumAccelerationCount: (json['mediumAccelerationCount'] as num?)?.toInt(),
  highAccelerationCount: (json['highAccelerationCount'] as num?)?.toInt(),
  mediumDecelerationCount: (json['mediumDecelerationCount'] as num?)?.toInt(),
  highDecelerationCount: (json['highDecelerationCount'] as num?)?.toInt(),
  explosiveAccToHsrCount: (json['explosiveAccToHsrCount'] as num?)?.toInt(),
  timeToHsr: (json['timeToHsr'] as num?)?.toDouble(),
  timeToHsrPostCod: (json['timeToHsrPostCod'] as num?)?.toDouble(),
  explosiveAccToSprintCount: (json['explosiveAccToSprintCount'] as num?)
      ?.toInt(),
  timeToSprint: (json['timeToSprint'] as num?)?.toDouble(),
  timeToSprintPostCod: (json['timeToSprintPostCod'] as num?)?.toDouble(),
);

Map<String, dynamic> _$PlayerToJson(Player instance) => <String, dynamic>{
  'name': instance.name,
  'shortName': instance.shortName,
  'playerId': instance.playerId,
  'birthdate': instance.birthdate,
  'teamName': instance.teamName,
  'imgurl': instance.imgurl,
  'marketvalue': instance.marketvalue,
  'minutes': instance.minutes,
  'distance': instance.distance,
  'metersPerMinute': instance.metersPerMinute,
  'runningDistance': instance.runningDistance,
  'hsrDistance': instance.hsrDistance,
  'hsrCount': instance.hsrCount,
  'sprintDistance': instance.sprintDistance,
  'sprintCount': instance.sprintCount,
  'hiDistance': instance.hiDistance,
  'hiCount': instance.hiCount,
  'psv99': instance.psv99,
  'mediumAccelerationCount': instance.mediumAccelerationCount,
  'highAccelerationCount': instance.highAccelerationCount,
  'mediumDecelerationCount': instance.mediumDecelerationCount,
  'highDecelerationCount': instance.highDecelerationCount,
  'explosiveAccToHsrCount': instance.explosiveAccToHsrCount,
  'timeToHsr': instance.timeToHsr,
  'timeToHsrPostCod': instance.timeToHsrPostCod,
  'explosiveAccToSprintCount': instance.explosiveAccToSprintCount,
  'timeToSprint': instance.timeToSprint,
  'timeToSprintPostCod': instance.timeToSprintPostCod,
};
