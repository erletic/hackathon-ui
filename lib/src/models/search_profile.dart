import 'package:json_annotation/json_annotation.dart';

part 'search_profile.g.dart';

@JsonSerializable()
class PerformanceFilters {
  @JsonKey(name: 'min_distance')
  final double? minDistance;
  @JsonKey(name: 'max_distance')
  final double? maxDistance;

  @JsonKey(name: 'min_m_per_min')
  final double? minMPerMin;
  @JsonKey(name: 'max_m_per_min')
  final double? maxMPerMin;

  @JsonKey(name: 'min_running_distance')
  final double? minRunningDistance;
  @JsonKey(name: 'max_running_distance')
  final double? maxRunningDistance;

  @JsonKey(name: 'min_hsr_distance')
  final double? minHsrDistance;
  @JsonKey(name: 'max_hsr_distance')
  final double? maxHsrDistance;

  @JsonKey(name: 'min_hsr_count')
  final int? minHsrCount;
  @JsonKey(name: 'max_hsr_count')
  final int? maxHsrCount;

  @JsonKey(name: 'min_sprint_distance')
  final double? minSprintDistance;
  @JsonKey(name: 'max_sprint_distance')
  final double? maxSprintDistance;

  @JsonKey(name: 'min_sprint_count')
  final int? minSprintCount;
  @JsonKey(name: 'max_sprint_count')
  final int? maxSprintCount;

  @JsonKey(name: 'min_hi_distance')
  final double? minHiDistance;
  @JsonKey(name: 'max_hi_distance')
  final double? maxHiDistance;

  @JsonKey(name: 'min_hi_count')
  final int? minHiCount;
  @JsonKey(name: 'max_hi_count')
  final int? maxHiCount;

  @JsonKey(name: 'min_psv_99')
  final double? minPsv99;
  @JsonKey(name: 'max_psv_99')
  final double? maxPsv99;

  @JsonKey(name: 'min_medium_acceleration_count')
  final int? minMediumAccelerationCount;
  @JsonKey(name: 'max_medium_acceleration_count')
  final int? maxMediumAccelerationCount;

  @JsonKey(name: 'min_high_acceleration_count')
  final int? minHighAccelerationCount;
  @JsonKey(name: 'max_high_acceleration_count')
  final int? maxHighAccelerationCount;

  @JsonKey(name: 'min_medium_deceleration_count')
  final int? minMediumDecelerationCount;
  @JsonKey(name: 'max_medium_deceleration_count')
  final int? maxMediumDecelerationCount;

  @JsonKey(name: 'min_high_deceleration_count')
  final int? minHighDecelerationCount;
  @JsonKey(name: 'max_high_deceleration_count')
  final int? maxHighDecelerationCount;

  @JsonKey(name: 'min_explosive_acceleration_to_hsr_count')
  final int? minExplosiveAccelerationToHsrCount;
  @JsonKey(name: 'max_explosive_acceleration_to_hsr_count')
  final int? maxExplosiveAccelerationToHsrCount;

  @JsonKey(name: 'min_time_to_hsr')
  final double? minTimeToHsr;
  @JsonKey(name: 'max_time_to_hsr')
  final double? maxTimeToHsr;

  @JsonKey(name: 'min_time_to_hsr_post_cod')
  final double? minTimeToHsrPostCod;
  @JsonKey(name: 'max_time_to_hsr_post_cod')
  final double? maxTimeToHsrPostCod;

  @JsonKey(name: 'min_explosive_acceleration_to_sprint_count')
  final int? minExplosiveAccelerationToSprintCount;
  @JsonKey(name: 'max_explosive_acceleration_to_sprint_count')
  final int? maxExplosiveAccelerationToSprintCount;

  @JsonKey(name: 'min_time_to_sprint')
  final double? minTimeToSprint;
  @JsonKey(name: 'max_time_to_sprint')
  final double? maxTimeToSprint;

  @JsonKey(name: 'min_time_to_sprint_post_cod')
  final double? minTimeToSprintPostCod;
  @JsonKey(name: 'max_time_to_sprint_post_cod')
  final double? maxTimeToSprintPostCod;

  @JsonKey(name: 'min_change_of_direction_count')
  final int? minChangeOfDirectionCount;
  @JsonKey(name: 'max_change_of_direction_count')
  final int? maxChangeOfDirectionCount;

  @JsonKey(name: 'min_time_to_505_around_90')
  final double? minTimeTo505Around90;
  @JsonKey(name: 'max_time_to_505_around_90')
  final double? maxTimeTo505Around90;

  @JsonKey(name: 'min_time_to_505_around_180')
  final double? minTimeTo505Around180;
  @JsonKey(name: 'max_time_to_505_around_180')
  final double? maxTimeTo505Around180;

  PerformanceFilters({
    this.minDistance,
    this.maxDistance,
    this.minMPerMin,
    this.maxMPerMin,
    this.minRunningDistance,
    this.maxRunningDistance,
    this.minHsrDistance,
    this.maxHsrDistance,
    this.minHsrCount,
    this.maxHsrCount,
    this.minSprintDistance,
    this.maxSprintDistance,
    this.minSprintCount,
    this.maxSprintCount,
    this.minHiDistance,
    this.maxHiDistance,
    this.minHiCount,
    this.maxHiCount,
    this.minPsv99,
    this.maxPsv99,
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
  });

  factory PerformanceFilters.fromJson(Map<String, dynamic> json) =>
      _$PerformanceFiltersFromJson(json);

  Map<String, dynamic> toJson() => _$PerformanceFiltersToJson(this);
}

@JsonSerializable()
class SearchProfile {
  final String? position;
  @JsonKey(name: 'position_group')
  final String? positionGroup;

  @JsonKey(name: 'min_age')
  final int? minAge;
  @JsonKey(name: 'max_age')
  final int? maxAge;

  @JsonKey(name: 'performance_filters')
  final PerformanceFilters? performanceFilters;

  SearchProfile({
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
