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
  minMPerMin: (json['min_m_per_min'] as num?)?.toDouble(),
  maxMPerMin: (json['max_m_per_min'] as num?)?.toDouble(),
  minRunningDistance: (json['min_running_distance'] as num?)?.toDouble(),
  maxRunningDistance: (json['max_running_distance'] as num?)?.toDouble(),
  minHsrDistance: (json['min_hsr_distance'] as num?)?.toDouble(),
  maxHsrDistance: (json['max_hsr_distance'] as num?)?.toDouble(),
  minHsrCount: (json['min_hsr_count'] as num?)?.toInt(),
  maxHsrCount: (json['max_hsr_count'] as num?)?.toInt(),
  minSprintDistance: (json['min_sprint_distance'] as num?)?.toDouble(),
  maxSprintDistance: (json['max_sprint_distance'] as num?)?.toDouble(),
  minSprintCount: (json['min_sprint_count'] as num?)?.toInt(),
  maxSprintCount: (json['max_sprint_count'] as num?)?.toInt(),
  minHiDistance: (json['min_hi_distance'] as num?)?.toDouble(),
  maxHiDistance: (json['max_hi_distance'] as num?)?.toDouble(),
  minHiCount: (json['min_hi_count'] as num?)?.toInt(),
  maxHiCount: (json['max_hi_count'] as num?)?.toInt(),
  minPsv99: (json['min_psv_99'] as num?)?.toDouble(),
  maxPsv99: (json['max_psv_99'] as num?)?.toDouble(),
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
      'min_m_per_min': instance.minMPerMin,
      'max_m_per_min': instance.maxMPerMin,
      'min_running_distance': instance.minRunningDistance,
      'max_running_distance': instance.maxRunningDistance,
      'min_hsr_distance': instance.minHsrDistance,
      'max_hsr_distance': instance.maxHsrDistance,
      'min_hsr_count': instance.minHsrCount,
      'max_hsr_count': instance.maxHsrCount,
      'min_sprint_distance': instance.minSprintDistance,
      'max_sprint_distance': instance.maxSprintDistance,
      'min_sprint_count': instance.minSprintCount,
      'max_sprint_count': instance.maxSprintCount,
      'min_hi_distance': instance.minHiDistance,
      'max_hi_distance': instance.maxHiDistance,
      'min_hi_count': instance.minHiCount,
      'max_hi_count': instance.maxHiCount,
      'min_psv_99': instance.minPsv99,
      'max_psv_99': instance.maxPsv99,
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
