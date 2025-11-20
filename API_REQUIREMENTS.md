# API Requirements

## Overview
This document specifies the required REST API endpoints for the player performance application.

---

## Search Profile Endpoints

### GET /api/search-profiles
Retrieve all search profiles or a specific search profile.

**Query Parameters:**
- `id` (optional): Search profile ID

**Response (200 OK):**
```json
{
  "position": "CF",
  "position_group": "Center Forward",
  "min_age": 20,
  "max_age": 30,
  "performance_filters": {
    "min_distance": 10000.0,
    "max_distance": 12000.0,
    "min_sprint_count": 5,
    "max_sprint_count": 15,
    ...
  }
}
```

---

### POST /api/search-profiles
Create a new search profile.

**Request Body:**
```json
{
  "position": "CF",
  "position_group": "Center Forward",
  "min_age": 20,
  "max_age": 30,
  "performance_filters": {
    "min_distance": 10000.0,
    "max_distance": 12000.0,
    "min_sprint_count": 5,
    "max_sprint_count": 15,
    "min_hsr_distance": 700.0,
    "max_hsr_distance": 900.0,
    ...
  }
}
```

**Response (201 Created):**
```json
{
  "id": "123",
  "position": "CF",
  "position_group": "Center Forward",
  "min_age": 20,
  "max_age": 30,
  "performance_filters": { ... }
}
```

---

### PUT /api/search-profiles/{id}
Update an existing search profile.

**Path Parameters:**
- `id`: Search profile ID

**Request Body:**
```json
{
  "position": "CF",
  "position_group": "Center Forward",
  "min_age": 22,
  "max_age": 28,
  "performance_filters": {
    "min_distance": 10500.0,
    "max_distance": 11500.0,
    ...
  }
}
```

**Response (200 OK):**
```json
{
  "id": "123",
  "position": "CF",
  "position_group": "Center Forward",
  "min_age": 22,
  "max_age": 28,
  "performance_filters": { ... }
}
```

---

## Player Endpoints

### GET /api/players
Retrieve players matching a search profile.

**Query Parameters:**
- `search_profile_id` (required): Search profile ID to filter players

**Response (200 OK):**
```json
[
  {
    "name": "Aaron Ramsey",
    "short_name": "A. Ramsey",
    "player_id": 95,
    "birthdate": "1990-12-26",
    "team_id": 61
  },
  ...
]
```

---

### PUT /api/search-profiles/{search_profile_id}/players/{player_id}
Add a player to the shortlist for a specific search profile.

**Path Parameters:**
- `search_profile_id`: Search profile ID
- `player_id`: Player ID to add to shortlist

**Response (200 OK):**
```json
{
  "search_profile_id": "123",
  "player_id": 95,
  "on_shortlist": true
}
```

---

### DELETE /api/search-profiles/{search_profile_id}/players/{player_id}
Remove a player from the shortlist for a specific search profile.

**Path Parameters:**
- `search_profile_id`: Search profile ID
- `player_id`: Player ID to remove from shortlist

**Response (200 OK):**
```json
{
  "search_profile_id": "123",
  "player_id": 95,
  "on_shortlist": false
}
```

---

### GET /api/search-profiles/{search_profile_id}/players
Retrieve all players on the shortlist for a specific search profile.

**Path Parameters:**
- `search_profile_id`: Search profile ID

**Response (200 OK):**
```json
[
  {
    "name": "Aaron Ramsey",
    "short_name": "A. Ramsey",
    "player_id": 95,
    "birthdate": "1990-12-26",
    "team_id": 61
  },
  ...
]
```

---

## Player Performance Endpoints

### GET /api/player-performance
Retrieve player performance data based on filters.

**Query Parameters:**
- `player_id` (optional): Filter by player ID
- `match_id` (optional): Filter by match ID
- `team_id` (optional): Filter by team ID
- `competition_id` (optional): Filter by competition ID
- `season_id` (optional): Filter by season ID
- `date_from` (optional): Filter performances from date (YYYY-MM-DD)
- `date_to` (optional): Filter performances to date (YYYY-MM-DD)
- `search_profile_id` (optional): Apply search profile filters

**Response (200 OK):**
```json
[
  {
    "player": "Aaron Ramsey",
    "short_name": "A. Ramsey",
    "player_id": 95,
    "birthdate": "1990-12-26",
    "team": "Cardiff City",
    "team_id": 61,
    "match": "Leeds United v Cardiff City",
    "match_id": 1008942,
    "date": "2023-08-06",
    "competition": "ENG - Championship",
    "competition_id": 31,
    "season": "2023/2024",
    "season_id": 28,
    "competition_edition_id": 544,
    "position": "CF",
    "position_group": "Center Forward",
    "minutes": 83.12,
    "physical_check_passed": true,
    "distance": 10744.0,
    "m_per_min": 129.26,
    "running_distance": 2067.0,
    "hsr_distance": 728.0,
    "hsr_count": 71,
    "sprint_distance": 97.0,
    "sprint_count": 7,
    "hi_distance": 825.0,
    "hi_count": 78,
    "psv_99": 26.3,
    "medium_acceleration_count": 123,
    "high_acceleration_count": 8,
    "medium_deceleration_count": 97,
    "high_deceleration_count": 22,
    "explosive_acceleration_to_hsr_count": 7,
    "time_to_hsr": 0.77,
    "time_to_hsr_post_cod": 0.77,
    "explosive_acceleration_to_sprint_count": 1,
    "time_to_sprint": 1.69,
    "time_to_sprint_post_cod": 1.69,
    "change_of_direction_count": 65,
    "time_to_505_around_90": 2.23,
    "time_to_505_around_180": 2.54
  },
  ...
]
```

---

## Additional Endpoints (Optional)

### GET /api/teams
Retrieve team information.

**Response (200 OK):**
```json
[
  {
    "name": "Cardiff City",
    "team_id": 61
  },
  ...
]
```

### GET /api/competitions
Retrieve competition information.

**Response (200 OK):**
```json
[
  {
    "name": "ENG - Championship",
    "competition_id": 31
  },
  ...
]
```

### GET /api/seasons
Retrieve season information.

**Response (200 OK):**
```json
[
  {
    "name": "2023/2024",
    "season_id": 28,
    "competition_edition_id": 544
  },
  ...
]
```

### GET /api/matches
Retrieve match information.

**Response (200 OK):**
```json
[
  {
    "name": "Leeds United v Cardiff City",
    "match_id": 1008942,
    "date": "2023-08-06",
    "competition_id": 31,
    "season_id": 28
  },
  ...
]
```

---

## Error Responses

All endpoints should return appropriate HTTP status codes and error messages:

**400 Bad Request:**
```json
{
  "error": "Invalid request parameters",
  "details": "min_age must be less than max_age"
}
```

**404 Not Found:**
```json
{
  "error": "Resource not found",
  "details": "Search profile with id 123 does not exist"
}
```

**500 Internal Server Error:**
```json
{
  "error": "Internal server error",
  "details": "Database connection failed"
}
```

---

## Notes

- All date fields should use ISO 8601 format (YYYY-MM-DD)
- All numeric fields should be returned as numbers, not strings
- Boolean fields should be `true` or `false`
- All field names must use **lower_case** (snake_case) naming convention
- Performance filters in search profiles are all optional
- The `search_profile_id` parameter in GET /api/player-performance should apply all filters from the specified search profile
