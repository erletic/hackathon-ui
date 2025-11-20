# Search Profile Creation Feature

## Overview

Create and edit search profiles with comprehensive filters for finding players based on position, age, and detailed performance metrics.

## Access

### Create New Profile
- Click the **+ (Add) icon** in the top-right corner of the home screen
- Or click **"Create Search Profile"** button when no profiles exist

### Edit Existing Profile
- **Long-press** on any search profile tab to edit it

## Features

### Two Main Tabs

#### 1. **Basic Tab**

Configure basic player criteria:

- **Specific Position** (optional)
  - GK (Goalkeeper)
  - CB, LB, RB (Defenders)
  - LWB, RWB (Wing Backs)
  - CDM, CM, CAM (Midfielders)
  - LM, RM, LW, RW (Wingers)
  - CF, ST (Forwards)
  - Can be left empty for any position

- **Position Group** (optional)
  - Goalkeeper
  - Defender
  - Midfielder
  - Forward
  - Center Forward
  - Winger
  - Wing Back
  - Broader category than specific position

- **Age Range**
  - Min Age (15-50)
  - Max Age (15-50)
  - Both are optional
  - Validation ensures max ≥ min

#### 2. **Performance Tab**

Configure performance metric filters (all optional):

##### Distance Metrics
- **Distance** (0-15,000m)
  - Total distance covered in a match

- **Meters per Minute** (0-200 m/min)
  - Average speed during play

- **Running Distance** (0-5,000m)
  - Distance at running speed

##### High-Speed Metrics
- **HSR Distance** (0-2,000m)
  - High-speed running distance

- **HSR Count** (0-200)
  - Number of high-speed runs

- **Sprint Distance** (0-500m)
  - Distance at sprint speed

- **Sprint Count** (0-50)
  - Number of sprints

##### High-Intensity Metrics
- **HI Distance** (0-2,000m)
  - High-intensity distance

- **HI Count** (0-200)
  - High-intensity action count

##### Other Metrics
- **PSV-99** (0-40)
  - Peak sprint velocity

Each metric has:
- **Min** and **Max** fields
- Validation for range limits
- Validation that max ≥ min
- All metrics are optional

## Form Validation

The form includes comprehensive validation:

- Age range validation (15-50 years)
- Max age must be ≥ min age
- Performance metrics within specified ranges
- Min/max validation for all range filters
- Invalid inputs show error messages below fields

## User Actions

### Save/Cancel

At the bottom of the screen:

- **Cancel Button** (Outlined)
  - Discards changes and returns to home screen

- **Create/Update Button** (Filled)
  - Creates new profile or updates existing one
  - Shows validation errors if form is invalid
  - Shows success message on completion
  - Returns to home screen

## Success Messages

- **Create**: "Search profile created successfully" (green)
- **Update**: "Search profile updated successfully" (green)

## Data Flow

### Mock Mode (Current)
- All changes are stored in Riverpod state
- No backend connection
- Data persists during app session
- Success messages shown to user

### Real Backend (Future)
- Profile will be sent to POST/PUT endpoint
- Response will be saved to state
- Error handling for network issues

## Files

### Screens
- [lib/src/screens/create_search_profile_screen.dart](lib/src/screens/create_search_profile_screen.dart) - Main creation/editing screen

### Updated
- [lib/src/screens/home_screen.dart](lib/src/screens/home_screen.dart) - Added navigation to create/edit screen

## Usage Examples

### Creating a Profile

1. Click the **+** icon in the app bar
2. **Basic Tab**:
   - Select position: "CF" (Center Forward)
   - Position group: "Forward"
   - Min age: 20
   - Max age: 30
3. **Performance Tab**:
   - Distance: min 10,000m, max 12,000m
   - Sprint count: min 5, max 15
   - HSR distance: min 700m, max 900m
4. Click **Create**
5. Success message appears
6. Return to home screen

### Editing a Profile

1. **Long-press** on a search profile tab
2. Edit any fields as needed
3. Click **Update**
4. Success message appears
5. Return to home screen with updated profile

## Tips

- **Leave fields empty** for no filter on that metric
- **Use position group** for broader searches
- **Combine metrics** to create very specific searches
- **Long-press tabs** to quickly edit profiles
- All performance filters are **AND** conditions (player must match all specified filters)

## Future Enhancements

- Delete profile functionality
- Duplicate profile
- Save as template
- Import/export profiles
- Profile statistics (how many players match)
- Preset templates for common positions
- Advanced filters (acceleration, deceleration, etc.)
