import 'package:json_annotation/json_annotation.dart';

part 'season.g.dart';

@JsonSerializable()
class Season {
  final String name;
  final int seasonId;
  final int competitionEditionId;

  Season({
    required this.name,
    required this.seasonId,
    required this.competitionEditionId,
  });

  factory Season.fromJson(Map<String, dynamic> json) => _$SeasonFromJson(json);

  Map<String, dynamic> toJson() => _$SeasonToJson(this);
}
