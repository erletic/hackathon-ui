import 'package:json_annotation/json_annotation.dart';

part 'competition.g.dart';

@JsonSerializable()
class Competition {
  final String name;
  @JsonKey(name: 'competition_id')
  final int competitionId;

  Competition({
    required this.name,
    required this.competitionId,
  });

  factory Competition.fromJson(Map<String, dynamic> json) =>
      _$CompetitionFromJson(json);

  Map<String, dynamic> toJson() => _$CompetitionToJson(this);
}
