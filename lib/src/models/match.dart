import 'package:json_annotation/json_annotation.dart';

part 'match.g.dart';

@JsonSerializable()
class Match {
  final String name;
  final int matchId;
  final String date;
  final int competitionId;
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
