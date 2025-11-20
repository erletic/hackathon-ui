# API Usage Examples

## Setup

First, initialize the API configuration in your app's main function:

```dart
import 'package:hackathon_ui/src/network/api_config.dart';

void main() {
  // Initialize with default base URL (http://localhost:3000)
  ApiConfig.initialize();

  // Or with custom base URL
  // ApiConfig.initialize(customBaseUrl: 'https://api.yourdomain.com');

  runApp(MyApp());
}
```

---

## Search Profile Examples

### Get a Search Profile

```dart
import 'package:hackathon_ui/src/network/api_config.dart';

final repository = ApiConfig.searchProfileRepository;

// Get specific search profile
final profile = await repository.getSearchProfile('123');
if (profile != null) {
  print('Position: ${profile.position}');
  print('Age range: ${profile.minAge} - ${profile.maxAge}');
}
```

### Get All Search Profiles

```dart
final profiles = await repository.getAllSearchProfiles();
for (final profile in profiles) {
  print('Position: ${profile.position}');
}
```

### Create a Search Profile

```dart
import 'package:hackathon_ui/src/models/search_profile.dart';

final newProfile = SearchProfile(
  position: 'CF',
  positionGroup: 'Center Forward',
  minAge: 20,
  maxAge: 30,
  performanceFilters: PerformanceFilters(
    minDistance: 10000.0,
    maxDistance: 12000.0,
    minSprintCount: 5,
    maxSprintCount: 15,
  ),
);

final created = await repository.createSearchProfile(newProfile);
if (created != null) {
  print('Created profile with position: ${created.position}');
}
```

### Update a Search Profile

```dart
final updatedProfile = SearchProfile(
  position: 'CF',
  positionGroup: 'Center Forward',
  minAge: 22,
  maxAge: 28,
  performanceFilters: PerformanceFilters(
    minDistance: 10500.0,
    maxDistance: 11500.0,
  ),
);

final result = await repository.updateSearchProfile('123', updatedProfile);
if (result != null) {
  print('Updated successfully');
}
```

### Manage Shortlist

```dart
// Add player to shortlist
final added = await repository.addPlayerToShortlist('123', 95);
if (added) {
  print('Player added to shortlist');
}

// Remove player from shortlist
final removed = await repository.removePlayerFromShortlist('123', 95);
if (removed) {
  print('Player removed from shortlist');
}

// Get all shortlisted players
final shortlist = await repository.getShortlistedPlayers('123');
print('Shortlist has ${shortlist.length} players');
```

---

## Player Examples

### Get Players by Search Profile

```dart
import 'package:hackathon_ui/src/network/api_config.dart';

final repository = ApiConfig.playerRepository;

final players = await repository.getPlayersBySearchProfile('123');
for (final player in players) {
  print('${player.name} (${player.shortName})');
  print('Player ID: ${player.playerId}');
  print('Birthdate: ${player.birthdate}');
}
```

---

## Player Performance Examples

### Get Player Performances with Filters

```dart
import 'package:hackathon_ui/src/network/api_config.dart';

final repository = ApiConfig.playerPerformanceRepository;

// Get performances for specific player
final performances = await repository.getPlayerPerformances(
  playerId: 95,
);

for (final perf in performances) {
  print('Match: ${perf.match}');
  print('Distance: ${perf.distance}m');
  print('Sprint count: ${perf.sprintCount}');
}
```

### Get Performances by Date Range

```dart
final performances = await repository.getPlayerPerformances(
  dateFrom: '2023-08-01',
  dateTo: '2023-12-31',
);
```

### Get Performances by Search Profile

```dart
final performances = await repository.getPlayerPerformances(
  searchProfileId: '123',
);
```

### Get Performances with Multiple Filters

```dart
final performances = await repository.getPlayerPerformances(
  playerId: 95,
  competitionId: 31,
  seasonId: 28,
  dateFrom: '2023-08-01',
  dateTo: '2023-12-31',
);

for (final perf in performances) {
  print('${perf.player} - ${perf.match}');
  print('Distance: ${perf.distance}m');
  print('M/min: ${perf.mPerMin}');
  print('HSR Distance: ${perf.hsrDistance}m');
  print('Sprint Count: ${perf.sprintCount}');
  print('PSV-99: ${perf.psv99}');
  print('---');
}
```

---

## Error Handling

All repository methods handle errors gracefully and return empty lists or null values on failure. For more granular error handling, you can catch DioExceptions in the service layer:

```dart
import 'package:dio/dio.dart';
import 'package:hackathon_ui/src/network/api_config.dart';

try {
  final players = await ApiConfig.playerRepository.getPlayersBySearchProfile('123');
  // Process players
} catch (e) {
  if (e is DioException) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        print('Connection timeout');
        break;
      case DioExceptionType.receiveTimeout:
        print('Receive timeout');
        break;
      case DioExceptionType.badResponse:
        print('Bad response: ${e.response?.statusCode}');
        break;
      default:
        print('Network error: ${e.message}');
    }
  }
}
```

---

## Using Services Directly

If you need more control, you can use the service layer directly:

```dart
import 'package:hackathon_ui/src/network/app_http_client.dart';
import 'package:hackathon_ui/src/services/player_service.dart';

final client = AppHttpClient(baseUrl: 'http://localhost:3000');
final service = PlayerService(client);

try {
  final players = await service.getPlayersBySearchProfile('123');
  // Process players
} on DioException catch (e) {
  // Handle specific errors
  print('Error: ${e.message}');
}
```

---

## Custom HTTP Client Configuration

```dart
final client = AppHttpClient(
  baseUrl: 'http://localhost:3000',
  connectTimeout: Duration(seconds: 10),
  receiveTimeout: Duration(seconds: 10),
);
```

---

## Adding Authentication

To add authentication headers, modify the `AppHttpClient` initialization:

```dart
// In app_http_client.dart, you can add an authorization token:
void setAuthToken(String token) {
  _dio.options.headers['Authorization'] = 'Bearer $token';
}

void clearAuthToken() {
  _dio.options.headers.remove('Authorization');
}
```

Then use it in your app:

```dart
ApiConfig.httpClient.setAuthToken('your-jwt-token');
```
