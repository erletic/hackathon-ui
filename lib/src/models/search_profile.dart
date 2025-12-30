import 'package:json_annotation/json_annotation.dart';

part 'search_profile.g.dart';

@JsonSerializable()
class PerformanceFilters {
  final double? minDistance;
  final double? maxDistance;
  final double distanceWeight;

  final double? minMPerMin;
  final double? maxMPerMin;
  final double mPerMinWeight;

  final double? minRunningDistance;
  final double? maxRunningDistance;
  final double runningDistanceWeight;

  final double? minHsrDistance;
  final double? maxHsrDistance;
  final double hsrDistanceWeight;

  final int? minHsrCount;
  final int? maxHsrCount;
  final double hsrCountWeight;

  final double? minSprintDistance;
  final double? maxSprintDistance;
  final double sprintDistanceWeight;

  final int? minSprintCount;
  final int? maxSprintCount;
  final double sprintCountWeight;

  final double? minHiDistance;
  final double? maxHiDistance;
  final double hiDistanceWeight;

  final int? minHiCount;
  final int? maxHiCount;
  final double hiCountWeight;

  final double? minPsv99;
  final double? maxPsv99;
  final double psv99Weight;

  final int? minMediumAccelerationCount;
  final int? maxMediumAccelerationCount;

  final int? minHighAccelerationCount;
  final int? maxHighAccelerationCount;

  final int? minMediumDecelerationCount;
  final int? maxMediumDecelerationCount;

  final int? minHighDecelerationCount;
  final int? maxHighDecelerationCount;

  final int? minExplosiveAccelerationToHsrCount;
  final int? maxExplosiveAccelerationToHsrCount;

  final double? minTimeToHsr;
  final double? maxTimeToHsr;

  final double? minTimeToHsrPostCod;
  final double? maxTimeToHsrPostCod;

  final int? minExplosiveAccelerationToSprintCount;
  final int? maxExplosiveAccelerationToSprintCount;

  final double? minTimeToSprint;
  final double? maxTimeToSprint;

  final double? minTimeToSprintPostCod;
  final double? maxTimeToSprintPostCod;

  final int? minChangeOfDirectionCount;
  final int? maxChangeOfDirectionCount;

  final double? minTimeTo505Around90;
  final double? maxTimeTo505Around90;

  final double? minTimeTo505Around180;
  final double? maxTimeTo505Around180;

  final List<int>? favoritePlayers;

  PerformanceFilters({
    this.minDistance,
    this.maxDistance,
    this.distanceWeight = 1.0,
    this.minMPerMin,
    this.maxMPerMin,
    this.mPerMinWeight = 1.0,
    this.minRunningDistance,
    this.maxRunningDistance,
    this.runningDistanceWeight = 1.0,
    this.minHsrDistance,
    this.maxHsrDistance,
    this.hsrDistanceWeight = 1.0,
    this.minHsrCount,
    this.maxHsrCount,
    this.hsrCountWeight = 1.0,
    this.minSprintDistance,
    this.maxSprintDistance,
    this.sprintDistanceWeight = 1.0,
    this.minSprintCount,
    this.maxSprintCount,
    this.sprintCountWeight = 1.0,
    this.minHiDistance,
    this.maxHiDistance,
    this.hiDistanceWeight = 1.0,
    this.minHiCount,
    this.maxHiCount,
    this.hiCountWeight = 1.0,
    this.minPsv99,
    this.maxPsv99,
    this.psv99Weight = 1.0,
    this.minMediumAccelerationCount,
    this.maxMediumAccelerationCount,
    this.minHighAccelerationCount,
    this.maxHighAccelerationCount,
    this.minMediumDecelerationCount,
    this.maxMediumDecelerationCount,
    this.minHighDecelerationCount,
    this.maxHighDecelerationCount,
    this.minExplosiveAccelerationToHsrCount,
    this.maxExplosiveAccelerationToHsrCount,
    this.minTimeToHsr,
    this.maxTimeToHsr,
    this.minTimeToHsrPostCod,
    this.maxTimeToHsrPostCod,
    this.minExplosiveAccelerationToSprintCount,
    this.maxExplosiveAccelerationToSprintCount,
    this.minTimeToSprint,
    this.maxTimeToSprint,
    this.minTimeToSprintPostCod,
    this.maxTimeToSprintPostCod,
    this.minChangeOfDirectionCount,
    this.maxChangeOfDirectionCount,
    this.minTimeTo505Around90,
    this.maxTimeTo505Around90,
    this.minTimeTo505Around180,
    this.maxTimeTo505Around180,
    this.favoritePlayers,
  });

  factory PerformanceFilters.fromJson(Map<String, dynamic> json) =>
      _$PerformanceFiltersFromJson(json);

  Map<String, dynamic> toJson() => _$PerformanceFiltersToJson(this);
}

@JsonSerializable()
class SearchProfile {
  final String? name;
  final int? id;
  final String? position;
  final String? positionGroup;

  final int? minAge;
  final int? maxAge;

  final PerformanceFilters? performanceFilters;

  SearchProfile({
    this.id,
    this.name,
    this.position,
    this.positionGroup,
    this.minAge,
    this.maxAge,
    this.performanceFilters,
  });

  factory SearchProfile.fromJson(Map<String, dynamic> json) =>
      _$SearchProfileFromJson(json);

  Map<String, dynamic> toJson() => _$SearchProfileToJson(this);
}
