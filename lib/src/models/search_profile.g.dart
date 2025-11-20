// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PerformanceFilters _$PerformanceFiltersFromJson(
  Map<String, dynamic> json,
) => PerformanceFilters(
  minDistance: (json['min_distance'] as num?)?.toDouble(),
  maxDistance: (json['max_distance'] as num?)?.toDouble(),
  distanceWeight: (json['distance_weight'] as num?)?.toDouble() ?? 1.0,
  minMPerMin: (json['min_m_per_min'] as num?)?.toDouble(),
  maxMPerMin: (json['max_m_per_min'] as num?)?.toDouble(),
  mPerMinWeight: (json['m_per_min_weight'] as num?)?.toDouble() ?? 1.0,
  minRunningDistance: (json['min_running_distance'] as num?)?.toDouble(),
  maxRunningDistance: (json['max_running_distance'] as num?)?.toDouble(),
  runningDistanceWeight:
      (json['running_distance_weight'] as num?)?.toDouble() ?? 1.0,
  minHsrDistance: (json['min_hsr_distance'] as num?)?.toDouble(),
  maxHsrDistance: (json['max_hsr_distance'] as num?)?.toDouble(),
  hsrDistanceWeight: (json['hsr_distance_weight'] as num?)?.toDouble() ?? 1.0,
  minHsrCount: (json['min_hsr_count'] as num?)?.toInt(),
  maxHsrCount: (json['max_hsr_count'] as num?)?.toInt(),
  hsrCountWeight: (json['hsr_count_weight'] as num?)?.toDouble() ?? 1.0,
  minSprintDistance: (json['min_sprint_distance'] as num?)?.toDouble(),
  maxSprintDistance: (json['max_sprint_distance'] as num?)?.toDouble(),
  sprintDistanceWeight:
      (json['sprint_distance_weight'] as num?)?.toDouble() ?? 1.0,
  minSprintCount: (json['min_sprint_count'] as num?)?.toInt(),
  maxSprintCount: (json['max_sprint_count'] as num?)?.toInt(),
  sprintCountWeight: (json['sprint_count_weight'] as num?)?.toDouble() ?? 1.0,
  minHiDistance: (json['min_hi_distance'] as num?)?.toDouble(),
  maxHiDistance: (json['max_hi_distance'] as num?)?.toDouble(),
  hiDistanceWeight: (json['hi_distance_weight'] as num?)?.toDouble() ?? 1.0,
  minHiCount: (json['min_hi_count'] as num?)?.toInt(),
  maxHiCount: (json['max_hi_count'] as num?)?.toInt(),
  hiCountWeight: (json['hi_count_weight'] as num?)?.toDouble() ?? 1.0,
  minPsv99: (json['min_psv_99'] as num?)?.toDouble(),
  maxPsv99: (json['max_psv_99'] as num?)?.toDouble(),
  psv99Weight: (json['psv_99_weight'] as num?)?.toDouble() ?? 1.0,
  minMediumAccelerationCount: (json['min_medium_acceleration_count'] as num?)
      ?.toInt(),
  maxMediumAccelerationCount: (json['max_medium_acceleration_count'] as num?)
      ?.toInt(),
  minHighAccelerationCount: (json['min_high_acceleration_count'] as num?)
      ?.toInt(),
  maxHighAccelerationCount: (json['max_high_acceleration_count'] as num?)
      ?.toInt(),
  minMediumDecelerationCount: (json['min_medium_deceleration_count'] as num?)
      ?.toInt(),
  maxMediumDecelerationCount: (json['max_medium_deceleration_count'] as num?)
      ?.toInt(),
  minHighDecelerationCount: (json['min_high_deceleration_count'] as num?)
      ?.toInt(),
  maxHighDecelerationCount: (json['max_high_deceleration_count'] as num?)
      ?.toInt(),
  minExplosiveAccelerationToHsrCount:
      (json['min_explosive_acceleration_to_hsr_count'] as num?)?.toInt(),
  maxExplosiveAccelerationToHsrCount:
      (json['max_explosive_acceleration_to_hsr_count'] as num?)?.toInt(),
  minTimeToHsr: (json['min_time_to_hsr'] as num?)?.toDouble(),
  maxTimeToHsr: (json['max_time_to_hsr'] as num?)?.toDouble(),
  minTimeToHsrPostCod: (json['min_time_to_hsr_post_cod'] as num?)?.toDouble(),
  maxTimeToHsrPostCod: (json['max_time_to_hsr_post_cod'] as num?)?.toDouble(),
  minExplosiveAccelerationToSprintCount:
      (json['min_explosive_acceleration_to_sprint_count'] as num?)?.toInt(),
  maxExplosiveAccelerationToSprintCount:
      (json['max_explosive_acceleration_to_sprint_count'] as num?)?.toInt(),
  minTimeToSprint: (json['min_time_to_sprint'] as num?)?.toDouble(),
  maxTimeToSprint: (json['max_time_to_sprint'] as num?)?.toDouble(),
  minTimeToSprintPostCod: (json['min_time_to_sprint_post_cod'] as num?)
      ?.toDouble(),
  maxTimeToSprintPostCod: (json['max_time_to_sprint_post_cod'] as num?)
      ?.toDouble(),
  minChangeOfDirectionCount: (json['min_change_of_direction_count'] as num?)
      ?.toInt(),
  maxChangeOfDirectionCount: (json['max_change_of_direction_count'] as num?)
      ?.toInt(),
  minTimeTo505Around90: (json['min_time_to_505_around_90'] as num?)?.toDouble(),
  maxTimeTo505Around90: (json['max_time_to_505_around_90'] as num?)?.toDouble(),
  minTimeTo505Around180: (json['min_time_to_505_around_180'] as num?)
      ?.toDouble(),
  maxTimeTo505Around180: (json['max_time_to_505_around_180'] as num?)
      ?.toDouble(),
);

Map<String, dynamic> _$PerformanceFiltersToJson(PerformanceFilters instance) =>
    <String, dynamic>{
      'min_distance': instance.minDistance,
      'max_distance': instance.maxDistance,
      'distance_weight': instance.distanceWeight,
      'min_m_per_min': instance.minMPerMin,
      'max_m_per_min': instance.maxMPerMin,
      'm_per_min_weight': instance.mPerMinWeight,
      'min_running_distance': instance.minRunningDistance,
      'max_running_distance': instance.maxRunningDistance,
      'running_distance_weight': instance.runningDistanceWeight,
      'min_hsr_distance': instance.minHsrDistance,
      'max_hsr_distance': instance.maxHsrDistance,
      'hsr_distance_weight': instance.hsrDistanceWeight,
      'min_hsr_count': instance.minHsrCount,
      'max_hsr_count': instance.maxHsrCount,
      'hsr_count_weight': instance.hsrCountWeight,
      'min_sprint_distance': instance.minSprintDistance,
      'max_sprint_distance': instance.maxSprintDistance,
      'sprint_distance_weight': instance.sprintDistanceWeight,
      'min_sprint_count': instance.minSprintCount,
      'max_sprint_count': instance.maxSprintCount,
      'sprint_count_weight': instance.sprintCountWeight,
      'min_hi_distance': instance.minHiDistance,
      'max_hi_distance': instance.maxHiDistance,
      'hi_distance_weight': instance.hiDistanceWeight,
      'min_hi_count': instance.minHiCount,
      'max_hi_count': instance.maxHiCount,
      'hi_count_weight': instance.hiCountWeight,
      'min_psv_99': instance.minPsv99,
      'max_psv_99': instance.maxPsv99,
      'psv_99_weight': instance.psv99Weight,
      'min_medium_acceleration_count': instance.minMediumAccelerationCount,
      'max_medium_acceleration_count': instance.maxMediumAccelerationCount,
      'min_high_acceleration_count': instance.minHighAccelerationCount,
      'max_high_acceleration_count': instance.maxHighAccelerationCount,
      'min_medium_deceleration_count': instance.minMediumDecelerationCount,
      'max_medium_deceleration_count': instance.maxMediumDecelerationCount,
      'min_high_deceleration_count': instance.minHighDecelerationCount,
      'max_high_deceleration_count': instance.maxHighDecelerationCount,
      'min_explosive_acceleration_to_hsr_count':
          instance.minExplosiveAccelerationToHsrCount,
      'max_explosive_acceleration_to_hsr_count':
          instance.maxExplosiveAccelerationToHsrCount,
      'min_time_to_hsr': instance.minTimeToHsr,
      'max_time_to_hsr': instance.maxTimeToHsr,
      'min_time_to_hsr_post_cod': instance.minTimeToHsrPostCod,
      'max_time_to_hsr_post_cod': instance.maxTimeToHsrPostCod,
      'min_explosive_acceleration_to_sprint_count':
          instance.minExplosiveAccelerationToSprintCount,
      'max_explosive_acceleration_to_sprint_count':
          instance.maxExplosiveAccelerationToSprintCount,
      'min_time_to_sprint': instance.minTimeToSprint,
      'max_time_to_sprint': instance.maxTimeToSprint,
      'min_time_to_sprint_post_cod': instance.minTimeToSprintPostCod,
      'max_time_to_sprint_post_cod': instance.maxTimeToSprintPostCod,
      'min_change_of_direction_count': instance.minChangeOfDirectionCount,
      'max_change_of_direction_count': instance.maxChangeOfDirectionCount,
      'min_time_to_505_around_90': instance.minTimeTo505Around90,
      'max_time_to_505_around_90': instance.maxTimeTo505Around90,
      'min_time_to_505_around_180': instance.minTimeTo505Around180,
      'max_time_to_505_around_180': instance.maxTimeTo505Around180,
    };

SearchProfile _$SearchProfileFromJson(Map<String, dynamic> json) =>
    SearchProfile(
      position: json['position'] as String?,
      positionGroup: json['position_group'] as String?,
      minAge: (json['min_age'] as num?)?.toInt(),
      maxAge: (json['max_age'] as num?)?.toInt(),
      performanceFilters: json['performance_filters'] == null
          ? null
          : PerformanceFilters.fromJson(
              json['performance_filters'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$SearchProfileToJson(SearchProfile instance) =>
    <String, dynamic>{
      'position': instance.position,
      'position_group': instance.positionGroup,
      'min_age': instance.minAge,
      'max_age': instance.maxAge,
      'performance_filters': instance.performanceFilters,
    };
