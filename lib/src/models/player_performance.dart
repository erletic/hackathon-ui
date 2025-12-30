import 'package:json_annotation/json_annotation.dart';

part 'player_performance.g.dart';

@JsonSerializable()
class PlayerPerformance {
  final String player;
  final String shortName;
  final int playerId;
  final String birthdate;
  final String team;
  final int teamId;
  final String match;
  final int matchId;
  final String date;
  final String competition;
  final int competitionId;
  final String season;
  final int seasonId;
  final int competitionEditionId;
  final String position;
  final String positionGroup;
  final double minutes;
  final bool physicalCheckPassed;
  final double distance;
  final double mPerMin;
  final double runningDistance;
  final double hsrDistance;
  final int hsrCount;
  final double sprintDistance;
  final int sprintCount;
  final double hiDistance;
  final int hiCount;
  final double psv99;
  final int mediumAccelerationCount;
  final int highAccelerationCount;
  final int mediumDecelerationCount;
  final int highDecelerationCount;
  final int explosiveAccelerationToHsrCount;
  final double timeToHsr;
  final double timeToHsrPostCod;
  final int explosiveAccelerationToSprintCount;
  final double timeToSprint;
  final double timeToSprintPostCod;
  final int changeOfDirectionCount;
  final double timeTo505Around90;
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
