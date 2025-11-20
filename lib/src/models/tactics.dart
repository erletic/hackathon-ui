enum BuildUpPlay {
  shortPassing,
  longBall,
  mixed,
  possession,
}

enum ChanceCreation {
  directPassing,
  longPasses,
  crossovers,
  throughBalls,
  wingPlay,
}

enum PressingIntensity {
  none,
  low,
  medium,
  high,
  aggressive,
}

enum DefensiveDepth {
  veryDeep,
  deep,
  balanced,
  high,
  veryHigh,
}

class OffensiveTactics {
  final BuildUpPlay buildUpPlay;
  final ChanceCreation chanceCreation;
  final double width;
  final double playersInBox;
  final String corners;
  final String freeKicks;

  OffensiveTactics({
    required this.buildUpPlay,
    required this.chanceCreation,
    this.width = 50,
    this.playersInBox = 5,
    this.corners = 'Mixed',
    this.freeKicks = 'Mixed',
  });

  OffensiveTactics copyWith({
    BuildUpPlay? buildUpPlay,
    ChanceCreation? chanceCreation,
    double? width,
    double? playersInBox,
    String? corners,
    String? freeKicks,
  }) {
    return OffensiveTactics(
      buildUpPlay: buildUpPlay ?? this.buildUpPlay,
      chanceCreation: chanceCreation ?? this.chanceCreation,
      width: width ?? this.width,
      playersInBox: playersInBox ?? this.playersInBox,
      corners: corners ?? this.corners,
      freeKicks: freeKicks ?? this.freeKicks,
    );
  }
}

class DefensiveTactics {
  final PressingIntensity pressing;
  final double width;
  final DefensiveDepth depth;

  DefensiveTactics({
    required this.pressing,
    this.width = 50,
    required this.depth,
  });

  DefensiveTactics copyWith({
    PressingIntensity? pressing,
    double? width,
    DefensiveDepth? depth,
  }) {
    return DefensiveTactics(
      pressing: pressing ?? this.pressing,
      width: width ?? this.width,
      depth: depth ?? this.depth,
    );
  }
}

enum Formation {
  f442,
  f433,
  f352,
  f4231,
  f343,
  f532,
  f41212,
  f4141,
}

extension FormationExtension on Formation {
  String get displayName {
    switch (this) {
      case Formation.f442:
        return '4-4-2';
      case Formation.f433:
        return '4-3-3';
      case Formation.f352:
        return '3-5-2';
      case Formation.f4231:
        return '4-2-3-1';
      case Formation.f343:
        return '3-4-3';
      case Formation.f532:
        return '5-3-2';
      case Formation.f41212:
        return '4-1-2-1-2';
      case Formation.f4141:
        return '4-1-4-1';
    }
  }

  List<List<int>> get positions {
    switch (this) {
      case Formation.f442:
        return [
          [2, 2],
          [4],
          [4],
          [1]
        ];
      case Formation.f433:
        return [
          [3],
          [3],
          [4],
          [1]
        ];
      case Formation.f352:
        return [
          [2],
          [5],
          [3],
          [1]
        ];
      case Formation.f4231:
        return [
          [1],
          [3],
          [2],
          [4],
          [1]
        ];
      case Formation.f343:
        return [
          [3],
          [4],
          [3],
          [1]
        ];
      case Formation.f532:
        return [
          [2],
          [3],
          [5],
          [1]
        ];
      case Formation.f41212:
        return [
          [2],
          [1],
          [2],
          [1],
          [4],
          [1]
        ];
      case Formation.f4141:
        return [
          [1],
          [4],
          [1],
          [4],
          [1]
        ];
    }
  }
}
