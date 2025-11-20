import 'package:json_annotation/json_annotation.dart';

part 'player_performance.g.dart';

@JsonSerializable()
class PlayerPerformance {
  final String player;
  @JsonKey(name: 'short_name')
  final String shortName;
  @JsonKey(name: 'player_id')
  final int playerId;
  final String birthdate;
  final String team;
  @JsonKey(name: 'team_id')
  final int teamId;
  final String match;
  @JsonKey(name: 'match_id')
  final int matchId;
  final String date;
  final String competition;
  @JsonKey(name: 'competition_id')
  final int competitionId;
  final String season;
  @JsonKey(name: 'season_id')
  final int seasonId;
  @JsonKey(name: 'competition_edition_id')
  final int competitionEditionId;
  final String position;
  @JsonKey(name: 'position_group')
  final String positionGroup;
  final double minutes;
  @JsonKey(name: 'physical_check_passed')
  final bool physicalCheckPassed;
  final double distance;
  @JsonKey(name: 'm_per_min')
  final double mPerMin;
  @JsonKey(name: 'running_distance')
  final double runningDistance;
  @JsonKey(name: 'hsr_distance')
  final double hsrDistance;
  @JsonKey(name: 'hsr_count')
  final int hsrCount;
  @JsonKey(name: 'sprint_distance')
  final double sprintDistance;
  @JsonKey(name: 'sprint_count')
  final int sprintCount;
  @JsonKey(name: 'hi_distance')
  final double hiDistance;
  @JsonKey(name: 'hi_count')
  final int hiCount;
  @JsonKey(name: 'psv_99')
  final double psv99;
  @JsonKey(name: 'medium_acceleration_count')
  final int mediumAccelerationCount;
  @JsonKey(name: 'high_acceleration_count')
  final int highAccelerationCount;
  @JsonKey(name: 'medium_deceleration_count')
  final int mediumDecelerationCount;
  @JsonKey(name: 'high_deceleration_count')
  final int highDecelerationCount;
  @JsonKey(name: 'explosive_acceleration_to_hsr_count')
  final int explosiveAccelerationToHsrCount;
  @JsonKey(name: 'time_to_hsr')
  final double timeToHsr;
  @JsonKey(name: 'time_to_hsr_post_cod')
  final double timeToHsrPostCod;
  @JsonKey(name: 'explosive_acceleration_to_sprint_count')
  final int explosiveAccelerationToSprintCount;
  @JsonKey(name: 'time_to_sprint')
  final double timeToSprint;
  @JsonKey(name: 'time_to_sprint_post_cod')
  final double timeToSprintPostCod;
  @JsonKey(name: 'change_of_direction_count')
  final int changeOfDirectionCount;
  @JsonKey(name: 'time_to_505_around_90')
  final double timeTo505Around90;
  @JsonKey(name: 'time_to_505_around_180')
  final double timeTo505Around180;

  PlayerPerformance({
    required this.player,
    required this.shortName,
    required this.playerId,
    required this.birthdate,
    required this.team,
    required this.teamId,
    required this.match,
    required this.matchId,
    required this.date,
    required this.competition,
    required this.competitionId,
    required this.season,
    required this.seasonId,
    required this.competitionEditionId,
    required this.position,
    required this.positionGroup,
    required this.minutes,
    required this.physicalCheckPassed,
    required this.distance,
    required this.mPerMin,
    required this.runningDistance,
    required this.hsrDistance,
    required this.hsrCount,
    required this.sprintDistance,
    required this.sprintCount,
    required this.hiDistance,
    required this.hiCount,
    required this.psv99,
    required this.mediumAccelerationCount,
    required this.highAccelerationCount,
    required this.mediumDecelerationCount,
    required this.highDecelerationCount,
    required this.explosiveAccelerationToHsrCount,
    required this.timeToHsr,
    required this.timeToHsrPostCod,
    required this.explosiveAccelerationToSprintCount,
    required this.timeToSprint,
    required this.timeToSprintPostCod,
    required this.changeOfDirectionCount,
    required this.timeTo505Around90,
    required this.timeTo505Around180,
  });

  factory PlayerPerformance.fromJson(Map<String, dynamic> json) =>
      _$PlayerPerformanceFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerPerformanceToJson(this);
}
