import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/tactics.dart';

final offensiveTacticsProvider = StateProvider<OffensiveTactics>((ref) {
  return OffensiveTactics(
    buildUpPlay: BuildUpPlay.mixed,
    chanceCreation: ChanceCreation.directPassing,
    width: 50,
    playersInBox: 5,
    corners: 'Mixed',
    freeKicks: 'Mixed',
  );
});

final defensiveTacticsProvider = StateProvider<DefensiveTactics>((ref) {
  return DefensiveTactics(
    pressing: PressingIntensity.medium,
    width: 50,
    depth: DefensiveDepth.balanced,
  );
});

final formationProvider = StateProvider<Formation>((ref) => Formation.f433);
