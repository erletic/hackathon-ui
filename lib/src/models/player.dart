import 'package:json_annotation/json_annotation.dart';

part 'player.g.dart';

@JsonSerializable()
class Player {
  final String name;
  final String shortName;
  final int playerId;
  final String birthdate;
  final String teamName;
  final String? imgurl;
  final int? marketvalue;

  // Performance attributes
  final double? minutes;
  final double? distance;
  final double? metersPerMinute;
  final double? runningDistance;
  final double? hsrDistance;
  final int? hsrCount;
  final double? sprintDistance;
  final int? sprintCount;
  final double? hiDistance;
  final int? hiCount;
  final double? psv99;
  final int? mediumAccelerationCount;
  final int? highAccelerationCount;
  final int? mediumDecelerationCount;
  final int? highDecelerationCount;
  final int? explosiveAccToHsrCount;
  final double? timeToHsr;
  final double? timeToHsrPostCod;
  final int? explosiveAccToSprintCount;
  final double? timeToSprint;
  final double? timeToSprintPostCod;

  Player({
    required this.name,
    required this.shortName,
    required this.playerId,
    required this.birthdate,
    required this.teamName,
    this.imgurl,
    this.marketvalue,
    this.minutes,
    this.distance,
    this.metersPerMinute,
    this.runningDistance,
    this.hsrDistance,
    this.hsrCount,
    this.sprintDistance,
    this.sprintCount,
    this.hiDistance,
    this.hiCount,
    this.psv99,
    this.mediumAccelerationCount,
    this.highAccelerationCount,
    this.mediumDecelerationCount,
    this.highDecelerationCount,
    this.explosiveAccToHsrCount,
    this.timeToHsr,
    this.timeToHsrPostCod,
    this.explosiveAccToSprintCount,
    this.timeToSprint,
    this.timeToSprintPostCod,
  });

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerToJson(this);
}
