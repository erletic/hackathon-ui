import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/tactics.dart';
import '../providers/tactics_providers.dart';
import '../widgets/formation_field.dart';

class TacticsScreen extends ConsumerStatefulWidget {
  const TacticsScreen({super.key});

  @override
  ConsumerState<TacticsScreen> createState() => _TacticsScreenState();
}

class _TacticsScreenState extends ConsumerState<TacticsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 900;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tactics & Formation'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.sports_soccer), text: 'Offense'),
            Tab(icon: Icon(Icons.shield), text: 'Defense'),
            Tab(icon: Icon(Icons.grid_on), text: 'Formation'),
          ],
        ),
      ),
      body: isDesktop
          ? Row(
              children: [
                Expanded(
                  flex: 5,
                  child: _buildTabContent(),
                ),
                const VerticalDivider(width: 1),
                Expanded(
                  flex: 4,
                  child: _buildFormationVisualization(),
                ),
              ],
            )
          : _buildTabContent(),
    );
  }

  Widget _buildTabContent() {
    return TabBarView(
      controller: _tabController,
      children: [
        _buildOffenseTab(),
        _buildDefenseTab(),
        _buildFormationTab(),
      ],
    );
  }

  Widget _buildOffenseTab() {
    final tactics = ref.watch(offensiveTacticsProvider);

    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Build Up Play',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<BuildUpPlay>(
                  value: tactics.buildUpPlay,
                  decoration: const InputDecoration(
                    labelText: 'Build Up Style',
                    border: OutlineInputBorder(),
                  ),
                  items: BuildUpPlay.values.map((style) {
                    return DropdownMenuItem(
                      value: style,
                      child: Text(_buildUpPlayName(style)),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      ref.read(offensiveTacticsProvider.notifier).state =
                          tactics.copyWith(buildUpPlay: value);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Chance Creation',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<ChanceCreation>(
                  value: tactics.chanceCreation,
                  decoration: const InputDecoration(
                    labelText: 'Attacking Style',
                    border: OutlineInputBorder(),
                  ),
                  items: ChanceCreation.values.map((style) {
                    return DropdownMenuItem(
                      value: style,
                      child: Text(_chanceCreationName(style)),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      ref.read(offensiveTacticsProvider.notifier).state =
                          tactics.copyWith(chanceCreation: value);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Width',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  'How wide the team spreads in attack',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Slider(
                  value: tactics.width,
                  min: 0,
                  max: 100,
                  divisions: 10,
                  label: tactics.width.round().toString(),
                  onChanged: (value) {
                    ref.read(offensiveTacticsProvider.notifier).state =
                        tactics.copyWith(width: value);
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Narrow', style: Theme.of(context).textTheme.bodySmall),
                    Text('Wide', style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Players in Box',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  'Number of players attacking the box',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Slider(
                  value: tactics.playersInBox,
                  min: 1,
                  max: 10,
                  divisions: 9,
                  label: tactics.playersInBox.round().toString(),
                  onChanged: (value) {
                    ref.read(offensiveTacticsProvider.notifier).state =
                        tactics.copyWith(playersInBox: value);
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Few', style: Theme.of(context).textTheme.bodySmall),
                    Text('Many', style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Set Pieces',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: tactics.corners,
                  decoration: const InputDecoration(
                    labelText: 'Corners',
                    border: OutlineInputBorder(),
                  ),
                  items: ['Mixed', 'Short', 'Long', 'Near Post', 'Far Post']
                      .map((style) {
                    return DropdownMenuItem(
                      value: style,
                      child: Text(style),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      ref.read(offensiveTacticsProvider.notifier).state =
                          tactics.copyWith(corners: value);
                    }
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: tactics.freeKicks,
                  decoration: const InputDecoration(
                    labelText: 'Free Kicks',
                    border: OutlineInputBorder(),
                  ),
                  items: ['Mixed', 'Direct', 'Short', 'Cross']
                      .map((style) {
                    return DropdownMenuItem(
                      value: style,
                      child: Text(style),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      ref.read(offensiveTacticsProvider.notifier).state =
                          tactics.copyWith(freeKicks: value);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDefenseTab() {
    final tactics = ref.watch(defensiveTacticsProvider);

    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pressing',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<PressingIntensity>(
                  value: tactics.pressing,
                  decoration: const InputDecoration(
                    labelText: 'Pressing Intensity',
                    border: OutlineInputBorder(),
                  ),
                  items: PressingIntensity.values.map((intensity) {
                    return DropdownMenuItem(
                      value: intensity,
                      child: Text(_pressingName(intensity)),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      ref.read(defensiveTacticsProvider.notifier).state =
                          tactics.copyWith(pressing: value);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Defensive Width',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  'How compact the defensive line is',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Slider(
                  value: tactics.width,
                  min: 0,
                  max: 100,
                  divisions: 10,
                  label: tactics.width.round().toString(),
                  onChanged: (value) {
                    ref.read(defensiveTacticsProvider.notifier).state =
                        tactics.copyWith(width: value);
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Compact', style: Theme.of(context).textTheme.bodySmall),
                    Text('Wide', style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Defensive Depth',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<DefensiveDepth>(
                  value: tactics.depth,
                  decoration: const InputDecoration(
                    labelText: 'Defensive Line',
                    border: OutlineInputBorder(),
                  ),
                  items: DefensiveDepth.values.map((depth) {
                    return DropdownMenuItem(
                      value: depth,
                      child: Text(_depthName(depth)),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      ref.read(defensiveTacticsProvider.notifier).state =
                          tactics.copyWith(depth: value);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFormationTab() {
    final formation = ref.watch(formationProvider);

    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Formation',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: Formation.values.map((form) {
                    final isSelected = form == formation;
                    return ChoiceChip(
                      label: Text(form.displayName),
                      selected: isSelected,
                      onSelected: (selected) {
                        if (selected) {
                          ref.read(formationProvider.notifier).state = form;
                        }
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        if (MediaQuery.of(context).size.width <= 900)
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Formation Preview',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                  AspectRatio(
                    aspectRatio: 0.7,
                    child: _buildFormationVisualization(),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildFormationVisualization() {
    final formation = ref.watch(formationProvider);
    final offensiveTactics = ref.watch(offensiveTacticsProvider);
    final defensiveTactics = ref.watch(defensiveTacticsProvider);

    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: FormationField(
            formation: formation,
            offensiveTactics: offensiveTactics,
            defensiveTactics: defensiveTactics,
          ),
        ),
      ),
    );
  }

  String _buildUpPlayName(BuildUpPlay style) {
    switch (style) {
      case BuildUpPlay.shortPassing:
        return 'Short Passing';
      case BuildUpPlay.longBall:
        return 'Long Ball';
      case BuildUpPlay.mixed:
        return 'Mixed';
      case BuildUpPlay.possession:
        return 'Possession';
    }
  }

  String _chanceCreationName(ChanceCreation style) {
    switch (style) {
      case ChanceCreation.directPassing:
        return 'Direct Passing';
      case ChanceCreation.longPasses:
        return 'Long Passes';
      case ChanceCreation.crossovers:
        return 'Crossovers';
      case ChanceCreation.throughBalls:
        return 'Through Balls';
      case ChanceCreation.wingPlay:
        return 'Wing Play';
    }
  }

  String _pressingName(PressingIntensity intensity) {
    switch (intensity) {
      case PressingIntensity.none:
        return 'None';
      case PressingIntensity.low:
        return 'Low';
      case PressingIntensity.medium:
        return 'Medium';
      case PressingIntensity.high:
        return 'High';
      case PressingIntensity.aggressive:
        return 'Aggressive';
    }
  }

  String _depthName(DefensiveDepth depth) {
    switch (depth) {
      case DefensiveDepth.veryDeep:
        return 'Very Deep';
      case DefensiveDepth.deep:
        return 'Deep';
      case DefensiveDepth.balanced:
        return 'Balanced';
      case DefensiveDepth.high:
        return 'High';
      case DefensiveDepth.veryHigh:
        return 'Very High';
    }
  }
}
