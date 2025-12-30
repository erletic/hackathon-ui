// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PerformanceFilters _$PerformanceFiltersFromJson(
  Map<String, dynamic> json,
) => PerformanceFilters(
  minDistance: (json['minDistance'] as num?)?.toDouble(),
  maxDistance: (json['maxDistance'] as num?)?.toDouble(),
  distanceWeight: (json['distanceWeight'] as num?)?.toDouble() ?? 1.0,
  minMPerMin: (json['minMPerMin'] as num?)?.toDouble(),
  maxMPerMin: (json['maxMPerMin'] as num?)?.toDouble(),
  mPerMinWeight: (json['mPerMinWeight'] as num?)?.toDouble() ?? 1.0,
  minRunningDistance: (json['minRunningDistance'] as num?)?.toDouble(),
  maxRunningDistance: (json['maxRunningDistance'] as num?)?.toDouble(),
  runningDistanceWeight:
      (json['runningDistanceWeight'] as num?)?.toDouble() ?? 1.0,
  minHsrDistance: (json['minHsrDistance'] as num?)?.toDouble(),
  maxHsrDistance: (json['maxHsrDistance'] as num?)?.toDouble(),
  hsrDistanceWeight: (json['hsrDistanceWeight'] as num?)?.toDouble() ?? 1.0,
  minHsrCount: (json['minHsrCount'] as num?)?.toInt(),
  maxHsrCount: (json['maxHsrCount'] as num?)?.toInt(),
  hsrCountWeight: (json['hsrCountWeight'] as num?)?.toDouble() ?? 1.0,
  minSprintDistance: (json['minSprintDistance'] as num?)?.toDouble(),
  maxSprintDistance: (json['maxSprintDistance'] as num?)?.toDouble(),
  sprintDistanceWeight:
      (json['sprintDistanceWeight'] as num?)?.toDouble() ?? 1.0,
  minSprintCount: (json['minSprintCount'] as num?)?.toInt(),
  maxSprintCount: (json['maxSprintCount'] as num?)?.toInt(),
  sprintCountWeight: (json['sprintCountWeight'] as num?)?.toDouble() ?? 1.0,
  minHiDistance: (json['minHiDistance'] as num?)?.toDouble(),
  maxHiDistance: (json['maxHiDistance'] as num?)?.toDouble(),
  hiDistanceWeight: (json['hiDistanceWeight'] as num?)?.toDouble() ?? 1.0,
  minHiCount: (json['minHiCount'] as num?)?.toInt(),
  maxHiCount: (json['maxHiCount'] as num?)?.toInt(),
  hiCountWeight: (json['hiCountWeight'] as num?)?.toDouble() ?? 1.0,
  minPsv99: (json['minPsv99'] as num?)?.toDouble(),
  maxPsv99: (json['maxPsv99'] as num?)?.toDouble(),
  psv99Weight: (json['psv99Weight'] as num?)?.toDouble() ?? 1.0,
  minMediumAccelerationCount: (json['minMediumAccelerationCount'] as num?)
      ?.toInt(),
  maxMediumAccelerationCount: (json['maxMediumAccelerationCount'] as num?)
      ?.toInt(),
  minHighAccelerationCount: (json['minHighAccelerationCount'] as num?)?.toInt(),
  maxHighAccelerationCount: (json['maxHighAccelerationCount'] as num?)?.toInt(),
  minMediumDecelerationCount: (json['minMediumDecelerationCount'] as num?)
      ?.toInt(),
  maxMediumDecelerationCount: (json['maxMediumDecelerationCount'] as num?)
      ?.toInt(),
  minHighDecelerationCount: (json['minHighDecelerationCount'] as num?)?.toInt(),
  maxHighDecelerationCount: (json['maxHighDecelerationCount'] as num?)?.toInt(),
  minExplosiveAccelerationToHsrCount:
      (json['minExplosiveAccelerationToHsrCount'] as num?)?.toInt(),
  maxExplosiveAccelerationToHsrCount:
      (json['maxExplosiveAccelerationToHsrCount'] as num?)?.toInt(),
  minTimeToHsr: (json['minTimeToHsr'] as num?)?.toDouble(),
  maxTimeToHsr: (json['maxTimeToHsr'] as num?)?.toDouble(),
  minTimeToHsrPostCod: (json['minTimeToHsrPostCod'] as num?)?.toDouble(),
  maxTimeToHsrPostCod: (json['maxTimeToHsrPostCod'] as num?)?.toDouble(),
  minExplosiveAccelerationToSprintCount:
      (json['minExplosiveAccelerationToSprintCount'] as num?)?.toInt(),
  maxExplosiveAccelerationToSprintCount:
      (json['maxExplosiveAccelerationToSprintCount'] as num?)?.toInt(),
  minTimeToSprint: (json['minTimeToSprint'] as num?)?.toDouble(),
  maxTimeToSprint: (json['maxTimeToSprint'] as num?)?.toDouble(),
  minTimeToSprintPostCod: (json['minTimeToSprintPostCod'] as num?)?.toDouble(),
  maxTimeToSprintPostCod: (json['maxTimeToSprintPostCod'] as num?)?.toDouble(),
  minChangeOfDirectionCount: (json['minChangeOfDirectionCount'] as num?)
      ?.toInt(),
  maxChangeOfDirectionCount: (json['maxChangeOfDirectionCount'] as num?)
      ?.toInt(),
  minTimeTo505Around90: (json['minTimeTo505Around90'] as num?)?.toDouble(),
  maxTimeTo505Around90: (json['maxTimeTo505Around90'] as num?)?.toDouble(),
  minTimeTo505Around180: (json['minTimeTo505Around180'] as num?)?.toDouble(),
  maxTimeTo505Around180: (json['maxTimeTo505Around180'] as num?)?.toDouble(),
  favoritePlayers: (json['favoritePlayers'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
);

Map<String, dynamic> _$PerformanceFiltersToJson(PerformanceFilters instance) =>
    <String, dynamic>{
      'minDistance': instance.minDistance,
      'maxDistance': instance.maxDistance,
      'distanceWeight': instance.distanceWeight,
      'minMPerMin': instance.minMPerMin,
      'maxMPerMin': instance.maxMPerMin,
      'mPerMinWeight': instance.mPerMinWeight,
      'minRunningDistance': instance.minRunningDistance,
      'maxRunningDistance': instance.maxRunningDistance,
      'runningDistanceWeight': instance.runningDistanceWeight,
      'minHsrDistance': instance.minHsrDistance,
      'maxHsrDistance': instance.maxHsrDistance,
      'hsrDistanceWeight': instance.hsrDistanceWeight,
      'minHsrCount': instance.minHsrCount,
      'maxHsrCount': instance.maxHsrCount,
      'hsrCountWeight': instance.hsrCountWeight,
      'minSprintDistance': instance.minSprintDistance,
      'maxSprintDistance': instance.maxSprintDistance,
      'sprintDistanceWeight': instance.sprintDistanceWeight,
      'minSprintCount': instance.minSprintCount,
      'maxSprintCount': instance.maxSprintCount,
      'sprintCountWeight': instance.sprintCountWeight,
      'minHiDistance': instance.minHiDistance,
      'maxHiDistance': instance.maxHiDistance,
      'hiDistanceWeight': instance.hiDistanceWeight,
      'minHiCount': instance.minHiCount,
      'maxHiCount': instance.maxHiCount,
      'hiCountWeight': instance.hiCountWeight,
      'minPsv99': instance.minPsv99,
      'maxPsv99': instance.maxPsv99,
      'psv99Weight': instance.psv99Weight,
      'minMediumAccelerationCount': instance.minMediumAccelerationCount,
      'maxMediumAccelerationCount': instance.maxMediumAccelerationCount,
      'minHighAccelerationCount': instance.minHighAccelerationCount,
      'maxHighAccelerationCount': instance.maxHighAccelerationCount,
      'minMediumDecelerationCount': instance.minMediumDecelerationCount,
      'maxMediumDecelerationCount': instance.maxMediumDecelerationCount,
      'minHighDecelerationCount': instance.minHighDecelerationCount,
      'maxHighDecelerationCount': instance.maxHighDecelerationCount,
      'minExplosiveAccelerationToHsrCount':
          instance.minExplosiveAccelerationToHsrCount,
      'maxExplosiveAccelerationToHsrCount':
          instance.maxExplosiveAccelerationToHsrCount,
      'minTimeToHsr': instance.minTimeToHsr,
      'maxTimeToHsr': instance.maxTimeToHsr,
      'minTimeToHsrPostCod': instance.minTimeToHsrPostCod,
      'maxTimeToHsrPostCod': instance.maxTimeToHsrPostCod,
      'minExplosiveAccelerationToSprintCount':
          instance.minExplosiveAccelerationToSprintCount,
      'maxExplosiveAccelerationToSprintCount':
          instance.maxExplosiveAccelerationToSprintCount,
      'minTimeToSprint': instance.minTimeToSprint,
      'maxTimeToSprint': instance.maxTimeToSprint,
      'minTimeToSprintPostCod': instance.minTimeToSprintPostCod,
      'maxTimeToSprintPostCod': instance.maxTimeToSprintPostCod,
      'minChangeOfDirectionCount': instance.minChangeOfDirectionCount,
      'maxChangeOfDirectionCount': instance.maxChangeOfDirectionCount,
      'minTimeTo505Around90': instance.minTimeTo505Around90,
      'maxTimeTo505Around90': instance.maxTimeTo505Around90,
      'minTimeTo505Around180': instance.minTimeTo505Around180,
      'maxTimeTo505Around180': instance.maxTimeTo505Around180,
      'favoritePlayers': instance.favoritePlayers,
    };

SearchProfile _$SearchProfileFromJson(Map<String, dynamic> json) =>
    SearchProfile(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      position: json['position'] as String?,
      positionGroup: json['positionGroup'] as String?,
      minAge: (json['minAge'] as num?)?.toInt(),
      maxAge: (json['maxAge'] as num?)?.toInt(),
      performanceFilters: json['performanceFilters'] == null
          ? null
          : PerformanceFilters.fromJson(
              json['performanceFilters'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$SearchProfileToJson(SearchProfile instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'position': instance.position,
      'positionGroup': instance.positionGroup,
      'minAge': instance.minAge,
      'maxAge': instance.maxAge,
      'performanceFilters': instance.performanceFilters,
    };
