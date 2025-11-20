import 'package:json_annotation/json_annotation.dart';

part 'player.g.dart';

@JsonSerializable()
class Player {
  final String name;
  @JsonKey(name: 'short_name')
  final String shortName;
  @JsonKey(name: 'player_id')
  final int playerId;
  final String birthdate;
  @JsonKey(name: 'team_id')
  final int teamId;

  Player({
    required this.name,
    required this.shortName,
    required this.playerId,
    required this.birthdate,
    required this.teamId,
  });

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerToJson(this);
}
