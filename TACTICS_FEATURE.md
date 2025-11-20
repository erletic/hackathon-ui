# Tactics & Formation Feature

## Overview

The tactics feature allows users to configure team tactics and formations with real-time visualization.

## Access

Click the **soccer ball icon** (⚽) in the top-right corner of the home screen to open the Tactics & Formation settings.

## Features

### Three Main Tabs

#### 1. **Offense Tab**

Configure offensive tactics:

- **Build Up Play**
  - Short Passing
  - Long Ball
  - Mixed
  - Possession

- **Chance Creation**
  - Direct Passing
  - Long Passes
  - Crossovers
  - Through Balls
  - Wing Play

- **Width Slider** (0-100)
  - Controls how wide the team spreads in attack
  - Narrow → Wide

- **Players in Box Slider** (1-10)
  - Number of players attacking the box
  - Few → Many

- **Set Pieces**
  - **Corners**: Mixed, Short, Long, Near Post, Far Post
  - **Free Kicks**: Mixed, Direct, Short, Cross

#### 2. **Defense Tab**

Configure defensive tactics:

- **Pressing Intensity**
  - None
  - Low
  - Medium
  - High
  - Aggressive

- **Defensive Width Slider** (0-100)
  - How compact the defensive line is
  - Compact → Wide

- **Defensive Depth**
  - Very Deep
  - Deep
  - Balanced
  - High
  - Very High

#### 3. **Formation Tab**

Choose from 8 different formations:

- **4-4-2** - Classic balanced formation
- **4-3-3** - Attacking formation with wingers
- **3-5-2** - Three at the back with wing-backs
- **4-2-3-1** - Modern formation with CAM
- **3-4-3** - Aggressive attacking formation
- **5-3-2** - Defensive formation
- **4-1-2-1-2** - Diamond midfield
- **4-1-4-1** - Flat midfield four

## Live Visualization

### Desktop Mode (>900px width)

- **Left Side**: Settings tabs with all controls
- **Right Side**: Live formation visualization

The formation field animates in real-time based on your tactical settings:

- **Pressing**: Players move up and down based on pressing intensity
- **Width**: Players spread wider or stay compact
- **Depth**: Defensive line moves higher or deeper

### Mobile Mode

- Swipe through tabs
- Formation preview shown in the Formation tab

## Animations

The formation field features dynamic animations:

- **Pressing Animation**: Players pulse up and down when pressing is enabled
  - Higher pressing intensity = more movement
  - Each line of players moves in a wave pattern

- **Width Adjustment**: Players spread horizontally based on width setting
  - Offensive width affects attack
  - Defensive width affects defense

- **Depth Adjustment**: Entire formation shifts up or down based on defensive depth
  - Very Deep: +40 units down
  - Very High: -40 units up

## Data Storage

All tactics settings are stored in **Riverpod state providers**:

- `offensiveTacticsProvider` - Offensive tactics state
- `defensiveTacticsProvider` - Defensive tactics state
- `formationProvider` - Current formation

No backend connection required - all data is stored locally in the app state.

## Files Created

### Models
- [lib/src/models/tactics.dart](lib/src/models/tactics.dart) - Data models for all tactics

### Providers
- [lib/src/providers/tactics_providers.dart](lib/src/providers/tactics_providers.dart) - Riverpod state providers

### Screens
- [lib/src/screens/tactics_screen.dart](lib/src/screens/tactics_screen.dart) - Main tactics screen with tabs

### Widgets
- [lib/src/widgets/formation_field.dart](lib/src/widgets/formation_field.dart) - Animated formation visualization

## Usage Example

```dart
// Access current tactics
final offensiveTactics = ref.watch(offensiveTacticsProvider);
final defensiveTactics = ref.watch(defensiveTacticsProvider);
final formation = ref.watch(formationProvider);

// Update tactics
ref.read(offensiveTacticsProvider.notifier).state =
  offensiveTactics.copyWith(width: 75);

ref.read(defensiveTacticsProvider.notifier).state =
  defensiveTactics.copyWith(pressing: PressingIntensity.high);

ref.read(formationProvider.notifier).state = Formation.f433;
```

## Future Enhancements

- Save/load tactics presets
- Share tactics with other users
- Tactics analysis and recommendations based on player data
- Backend integration for persistent storage
- Export tactics as image/PDF
