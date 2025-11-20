# Mock Data Setup

The app is currently configured to use **mock data** until the backend is ready.

## Switching Between Mock and Real Data

### Using Mock Data (Default)

The app is currently set to use mock data. To verify or change this:

1. Open [lib/src/config/app_config.dart](lib/src/config/app_config.dart)
2. Check the `useMockData` constant:

```dart
class AppConfig {
  static const bool useMockData = true;  // Using mock data
  static const String apiBaseUrl = 'http://localhost:3000';
}
```

### Switching to Real Backend

When your backend is ready:

1. Open [lib/src/config/app_config.dart](lib/src/config/app_config.dart)
2. Set `useMockData` to `false`:

```dart
class AppConfig {
  static const bool useMockData = false;  // Using real backend
  static const String apiBaseUrl = 'http://localhost:3000';  // Update if needed
}
```

3. Update `apiBaseUrl` if your backend is running on a different URL

That's it! The app will automatically switch to using the real API endpoints.

## Mock Data Provided

### Search Profiles
- **CF (Center Forward)**: Age 20-30, distance 10000-12000m, sprints 5-15
- **CM (Central Midfield)**: Age 22-28, distance 11000-13000m, HSR 700-1000m
- **CB (Center Back)**: Age 24-32, distance 9000-11000m

### Players
12 mock players with realistic data:
- Aaron Ramsey
- Harry Kane
- Marcus Rashford
- Phil Foden
- Bukayo Saka
- Declan Rice
- Jude Bellingham
- Cole Palmer
- Ollie Watkins
- Ivan Toney
- Alexander Isak
- Mohamed Salah

Each search profile displays a different subset of players based on position.

## Adding More Mock Data

To add more mock data, edit [lib/src/data/mock_data.dart](lib/src/data/mock_data.dart):

```dart
static List<Player> getPlayers() {
  return [
    Player(
      name: 'Your Player Name',
      shortName: 'Y. Player',
      playerId: 112,
      birthdate: '1995-01-01',
      teamId: 72,
    ),
    // Add more players...
  ];
}
```

## File Structure

```
lib/src/
├── config/
│   └── app_config.dart          # Toggle mock/real data here
├── data/
│   └── mock_data.dart           # Mock data definitions
├── providers/
│   ├── mock_providers.dart      # Mock data providers (Riverpod)
│   ├── api_providers.dart       # Real API providers
│   ├── search_profile_providers.dart
│   └── player_providers.dart
```

## Testing Both Modes

You can easily test switching between modes:

1. Run the app with mock data (`useMockData = true`)
2. Verify all features work
3. Change to real backend (`useMockData = false`)
4. Hot reload (press 'r' in terminal or save the file)
5. The app will now use real API calls

No need to restart the app!
