import 'package:json_annotation/json_annotation.dart';

part 'match.g.dart';

@JsonSerializable()
class Match {
  final String name;
  @JsonKey(name: 'match_id')
  final int matchId;
  final String date;
  @JsonKey(name: 'competition_id')
  final int competitionId;
  @JsonKey(name: 'season_id')
  final int seasonId;

  Match({
    required this.name,
    required this.matchId,
    required this.date,
    required this.competitionId,
    required this.seasonId,
  });

  factory Match.fromJson(Map<String, dynamic> json) => _$MatchFromJson(json);

  Map<String, dynamic> toJson() => _$MatchToJson(this);
}
