# Weight System Implementation

## Overview

Added weight parameters to all performance filters to allow users to prioritize certain metrics over others when searching for players.

## Changes Made

### 1. Model Updates ([lib/src/models/search_profile.dart](lib/src/models/search_profile.dart))

Added weight fields (0.0 - 5.0) for each metric:
- `distance_weight` (default: 1.0)
- `m_per_min_weight` (default: 1.0)
- `running_distance_weight` (default: 1.0)
- `hsr_distance_weight` (default: 1.0)
- `hsr_count_weight` (default: 1.0)
- `sprint_distance_weight` (default: 1.0)
- `sprint_count_weight` (default: 1.0)
- `hi_distance_weight` (default: 1.0)
- `hi_count_weight` (default: 1.0)
- `psv_99_weight` (default: 1.0)

All weights default to 1.0 (normal priority).

### 2. Weight Scale

- **0.0**: Not important
- **1.0**: Normal priority (default)
- **2.0**: Important
- **3.0**: Very important
- **4.0**: Critical
- **5.0**: Must-have

### 3. UI Updates Needed

To add weight sliders to the create search profile screen:

1. Add weight state variables in `_CreateSearchProfileScreenState`:
```dart
// Weight variables
double _distanceWeight = 1.0;
double _mPerMinWeight = 1.0;
double _runningDistanceWeight = 1.0;
double _hsrDistanceWeight = 1.0;
double _hsrCountWeight = 1.0;
double _sprintDistanceWeight = 1.0;
double _sprintCountWeight = 1.0;
double _hiDistanceWeight = 1.0;
double _hiCountWeight = 1.0;
double _psv99Weight = 1.0;
```

2. Update `_buildRangeCard` to include weight slider:
```dart
Widget _buildRangeCard(
  String title,
  String description,
  double? minValue,
  double? maxValue,
  Function(double?) onMinChanged,
  Function(double?) onMaxChanged,
  double minLimit,
  double maxLimit,
  double weight,  // Add this parameter
  Function(double) onWeightChanged,  // Add this parameter
) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Existing title and description...

          // Min/Max fields...

          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 8),

          // Weight slider
          Row(
            children: [
              Icon(
                Icons.scale,
                size: 20,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Text(
                'Priority Weight:',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: _getWeightColor(weight),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  _getWeightLabel(weight),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          Slider(
            value: weight,
            min: 0,
            max: 5,
            divisions: 10,
            label: weight.toStringAsFixed(1),
            onChanged: onWeightChanged,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Not Important', style: Theme.of(context).textTheme.bodySmall),
              Text('Must-Have', style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ],
      ),
    ),
  );
}

String _getWeightLabel(double weight) {
  if (weight < 0.5) return 'Not Important';
  if (weight < 1.5) return 'Normal';
  if (weight < 2.5) return 'Important';
  if (weight < 3.5) return 'Very Important';
  if (weight < 4.5) return 'Critical';
  return 'Must-Have';
}

Color _getWeightColor(double weight) {
  if (weight < 0.5) return Colors.grey;
  if (weight < 1.5) return Colors.blue;
  if (weight < 2.5) return Colors.green;
  if (weight < 3.5) return Colors.orange;
  if (weight < 4.5) return Colors.deepOrange;
  return Colors.red;
}
```

3. Update `_loadExistingProfile` to load weights:
```dart
void _loadExistingProfile(SearchProfile profile) {
  // Existing code...

  final filters = profile.performanceFilters;
  if (filters != null) {
    // Existing min/max loading...

    // Load weights
    _distanceWeight = filters.distanceWeight;
    _mPerMinWeight = filters.mPerMinWeight;
    _runningDistanceWeight = filters.runningDistanceWeight;
    _hsrDistanceWeight = filters.hsrDistanceWeight;
    _hsrCountWeight = filters.hsrCountWeight;
    _sprintDistanceWeight = filters.sprintDistanceWeight;
    _sprintCountWeight = filters.sprintCountWeight;
    _hiDistanceWeight = filters.hiDistanceWeight;
    _hiCountWeight = filters.hiCountWeight;
    _psv99Weight = filters.psv99Weight;
  }
}
```

4. Update `_saveProfile` to include weights:
```dart
performanceFilters: _hasPerformanceFilters()
    ? PerformanceFilters(
        minDistance: _minDistance,
        maxDistance: _maxDistance,
        distanceWeight: _distanceWeight,  // Add weight
        minMPerMin: _minMPerMin,
        maxMPerMin: _maxMPerMin,
        mPerMinWeight: _mPerMinWeight,  // Add weight
        // ... continue for all metrics
      )
    : null,
```

5. Update all `_buildRangeCard` calls in `_buildPerformanceTab`:
```dart
_buildRangeCard(
  'Distance',
  'Total distance covered (meters)',
  _minDistance,
  _maxDistance,
  (min) => setState(() => _minDistance = min),
  (max) => setState(() => _maxDistance = max),
  0,
  15000,
  _distanceWeight,  // Add weight parameter
  (weight) => setState(() => _distanceWeight = weight),  // Add weight callback
),
```

## Backend Usage

The backend can use these weights to:

1. **Score Calculation**: Multiply each metric's match score by its weight
2. **Ranking**: Players with higher weighted scores rank higher
3. **Filtering**: Prioritize showing players that match high-weight criteria

Example scoring algorithm:
```python
def calculate_player_score(player, search_profile):
    total_score = 0
    total_weight = 0

    filters = search_profile.performance_filters

    # Distance score
    if filters.min_distance and filters.max_distance:
        if filters.min_distance <= player.distance <= filters.max_distance:
            total_score += 100 * filters.distance_weight
        total_weight += filters.distance_weight

    # Repeat for all metrics...

    return total_score / total_weight if total_weight > 0 else 0
```

## Benefits

- **Flexible Searching**: Users can define what matters most for their needs
- **Better Results**: Players matching high-priority criteria rank higher
- **Scout Customization**: Different scouts can prioritize different attributes
- **Position-Specific**: Weights can vary by position (e.g., GK prioritizes different metrics than CF)

## Visual Feedback

The UI provides color-coded labels for easy understanding:
- Grey: Not Important
- Blue: Normal
- Green: Important
- Orange: Very Important
- Deep Orange: Critical
- Red: Must-Have
