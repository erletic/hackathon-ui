import 'package:json_annotation/json_annotation.dart';

part 'season.g.dart';

@JsonSerializable()
class Season {
  final String name;
  @JsonKey(name: 'season_id')
  final int seasonId;
  @JsonKey(name: 'competition_edition_id')
  final int competitionEditionId;

  Season({
    required this.name,
    required this.seasonId,
    required this.competitionEditionId,
  });

  factory Season.fromJson(Map<String, dynamic> json) => _$SeasonFromJson(json);

  Map<String, dynamic> toJson() => _$SeasonToJson(this);
}
