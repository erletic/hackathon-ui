import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/search_profile.dart';
import '../config/app_config.dart';

class CreateSearchProfileScreen extends ConsumerStatefulWidget {
  final SearchProfile? existingProfile;

  const CreateSearchProfileScreen({super.key, this.existingProfile});

  @override
  ConsumerState<CreateSearchProfileScreen> createState() =>
      _CreateSearchProfileScreenState();
}

class _CreateSearchProfileScreenState
    extends ConsumerState<CreateSearchProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _formKey = GlobalKey<FormState>();

  // Basic filters
  String? _position;
  String? _positionGroup;
  int? _minAge;
  int? _maxAge;

  // Performance filters
  double? _minDistance;
  double? _maxDistance;
  double _distanceWeight = 1.0;

  double? _minMPerMin;
  double? _maxMPerMin;
  double _mPerMinWeight = 1.0;

  double? _minRunningDistance;
  double? _maxRunningDistance;
  double _runningDistanceWeight = 1.0;

  double? _minHsrDistance;
  double? _maxHsrDistance;
  double _hsrDistanceWeight = 1.0;

  int? _minHsrCount;
  int? _maxHsrCount;
  double _hsrCountWeight = 1.0;

  double? _minSprintDistance;
  double? _maxSprintDistance;
  double _sprintDistanceWeight = 1.0;

  int? _minSprintCount;
  int? _maxSprintCount;
  double _sprintCountWeight = 1.0;

  double? _minHiDistance;
  double? _maxHiDistance;
  double _hiDistanceWeight = 1.0;

  int? _minHiCount;
  int? _maxHiCount;
  double _hiCountWeight = 1.0;

  double? _minPsv99;
  double? _maxPsv99;
  double _psv99Weight = 1.0;

  final List<String> _positions = [
    'GK',
    'CB',
    'LB',
    'RB',
    'LWB',
    'RWB',
    'CDM',
    'CM',
    'CAM',
    'LM',
    'RM',
    'LW',
    'RW',
    'CF',
    'ST',
  ];

  final List<String> _positionGroups = [
    'Goalkeeper',
    'Defender',
    'Midfielder',
    'Forward',
    'Center Forward',
    'Winger',
    'Wing Back',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    if (widget.existingProfile != null) {
      _loadExistingProfile(widget.existingProfile!);
    }
  }

  void _loadExistingProfile(SearchProfile profile) {
    _position = profile.position;
    _positionGroup = profile.positionGroup;
    _minAge = profile.minAge;
    _maxAge = profile.maxAge;

    final filters = profile.performanceFilters;
    if (filters != null) {
      _minDistance = filters.minDistance;
      _maxDistance = filters.maxDistance;
      _distanceWeight = filters.distanceWeight;

      _minMPerMin = filters.minMPerMin;
      _maxMPerMin = filters.maxMPerMin;
      _mPerMinWeight = filters.mPerMinWeight;

      _minRunningDistance = filters.minRunningDistance;
      _maxRunningDistance = filters.maxRunningDistance;
      _runningDistanceWeight = filters.runningDistanceWeight;

      _minHsrDistance = filters.minHsrDistance;
      _maxHsrDistance = filters.maxHsrDistance;
      _hsrDistanceWeight = filters.hsrDistanceWeight;

      _minHsrCount = filters.minHsrCount;
      _maxHsrCount = filters.maxHsrCount;
      _hsrCountWeight = filters.hsrCountWeight;

      _minSprintDistance = filters.minSprintDistance;
      _maxSprintDistance = filters.maxSprintDistance;
      _sprintDistanceWeight = filters.sprintDistanceWeight;

      _minSprintCount = filters.minSprintCount;
      _maxSprintCount = filters.maxSprintCount;
      _sprintCountWeight = filters.sprintCountWeight;

      _minHiDistance = filters.minHiDistance;
      _maxHiDistance = filters.maxHiDistance;
      _hiDistanceWeight = filters.hiDistanceWeight;

      _minHiCount = filters.minHiCount;
      _maxHiCount = filters.maxHiCount;
      _hiCountWeight = filters.hiCountWeight;

      _minPsv99 = filters.minPsv99;
      _maxPsv99 = filters.maxPsv99;
      _psv99Weight = filters.psv99Weight;
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.existingProfile != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Edit Search Profile' : 'Create Search Profile'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.person), text: 'Basic'),
            Tab(icon: Icon(Icons.speed), text: 'Performance'),
          ],
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [_buildBasicTab(), _buildPerformanceTab()],
              ),
            ),
            _buildActionButtons(isEdit),
          ],
        ),
      ),
    );
  }

  Widget _buildBasicTab() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Position', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  initialValue: _position,
                  decoration: const InputDecoration(
                    labelText: 'Specific Position',
                    border: OutlineInputBorder(),
                    helperText: 'Leave empty for any position',
                  ),
                  items: [
                    const DropdownMenuItem<String>(
                      value: null,
                      child: Text('Any Position'),
                    ),
                    ..._positions.map((pos) {
                      return DropdownMenuItem(value: pos, child: Text(pos));
                    }),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _position = value;
                    });
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  initialValue: _positionGroup,
                  decoration: const InputDecoration(
                    labelText: 'Position Group',
                    border: OutlineInputBorder(),
                    helperText: 'Broader position category',
                  ),
                  items: [
                    const DropdownMenuItem<String>(
                      value: null,
                      child: Text('Any Position Group'),
                    ),
                    ..._positionGroups.map((group) {
                      return DropdownMenuItem(value: group, child: Text(group));
                    }),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _positionGroup = value;
                    });
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
                  'Age Range',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        initialValue: _minAge?.toString(),
                        decoration: const InputDecoration(
                          labelText: 'Min Age',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          setState(() {
                            _minAge = int.tryParse(value);
                          });
                        },
                        validator: (value) {
                          if (value != null && value.isNotEmpty) {
                            final age = int.tryParse(value);
                            if (age == null) return 'Enter valid number';
                            if (age < 15 || age > 50) return '15-50 only';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        initialValue: _maxAge?.toString(),
                        decoration: const InputDecoration(
                          labelText: 'Max Age',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          setState(() {
                            _maxAge = int.tryParse(value);
                          });
                        },
                        validator: (value) {
                          if (value != null && value.isNotEmpty) {
                            final age = int.tryParse(value);
                            if (age == null) return 'Enter valid number';
                            if (age < 15 || age > 50) return '15-50 only';
                            if (_minAge != null && age < _minAge!) {
                              return 'Must be ≥ min age';
                            }
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPerformanceTab() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildRangeCard(
          'Distance',
          'Total distance covered (meters)',
          _minDistance,
          _maxDistance,
          (min) => setState(() => _minDistance = min),
          (max) => setState(() => _maxDistance = max),
          0,
          15000,
          _distanceWeight,
          (weight) => setState(() => _distanceWeight = weight),
        ),
        const SizedBox(height: 16),
        _buildRangeCard(
          'Meters per Minute',
          'Average speed (m/min)',
          _minMPerMin,
          _maxMPerMin,
          (min) => setState(() => _minMPerMin = min),
          (max) => setState(() => _maxMPerMin = max),
          0,
          200,
          _mPerMinWeight,
          (weight) => setState(() => _mPerMinWeight = weight),
        ),
        const SizedBox(height: 16),
        _buildRangeCard(
          'Running Distance',
          'Distance at running speed (meters)',
          _minRunningDistance,
          _maxRunningDistance,
          (min) => setState(() => _minRunningDistance = min),
          (max) => setState(() => _maxRunningDistance = max),
          0,
          5000,
          _runningDistanceWeight,
          (weight) => setState(() => _runningDistanceWeight = weight),
        ),
        const SizedBox(height: 16),
        _buildRangeCard(
          'HSR Distance',
          'High-speed running distance (meters)',
          _minHsrDistance,
          _maxHsrDistance,
          (min) => setState(() => _minHsrDistance = min),
          (max) => setState(() => _maxHsrDistance = max),
          0,
          2000,
          _hsrDistanceWeight,
          (weight) => setState(() => _hsrDistanceWeight = weight),
        ),
        const SizedBox(height: 16),
        _buildIntRangeCard(
          'HSR Count',
          'Number of high-speed runs',
          _minHsrCount,
          _maxHsrCount,
          (min) => setState(() => _minHsrCount = min),
          (max) => setState(() => _maxHsrCount = max),
          0,
          200,
          _hsrCountWeight,
          (weight) => setState(() => _hsrCountWeight = weight),
        ),
        const SizedBox(height: 16),
        _buildRangeCard(
          'Sprint Distance',
          'Distance at sprint speed (meters)',
          _minSprintDistance,
          _maxSprintDistance,
          (min) => setState(() => _minSprintDistance = min),
          (max) => setState(() => _maxSprintDistance = max),
          0,
          500,
          _sprintDistanceWeight,
          (weight) => setState(() => _sprintDistanceWeight = weight),
        ),
        const SizedBox(height: 16),
        _buildIntRangeCard(
          'Sprint Count',
          'Number of sprints',
          _minSprintCount,
          _maxSprintCount,
          (min) => setState(() => _minSprintCount = min),
          (max) => setState(() => _maxSprintCount = max),
          0,
          50,
          _sprintCountWeight,
          (weight) => setState(() => _sprintCountWeight = weight),
        ),
        const SizedBox(height: 16),
        _buildRangeCard(
          'HI Distance',
          'High-intensity distance (meters)',
          _minHiDistance,
          _maxHiDistance,
          (min) => setState(() => _minHiDistance = min),
          (max) => setState(() => _maxHiDistance = max),
          0,
          2000,
          _hiDistanceWeight,
          (weight) => setState(() => _hiDistanceWeight = weight),
        ),
        const SizedBox(height: 16),
        _buildIntRangeCard(
          'HI Count',
          'High-intensity action count',
          _minHiCount,
          _maxHiCount,
          (min) => setState(() => _minHiCount = min),
          (max) => setState(() => _maxHiCount = max),
          0,
          200,
          _hiCountWeight,
          (weight) => setState(() => _hiCountWeight = weight),
        ),
        const SizedBox(height: 16),
        _buildRangeCard(
          'PSV-99',
          'Peak sprint velocity',
          _minPsv99,
          _maxPsv99,
          (min) => setState(() => _minPsv99 = min),
          (max) => setState(() => _maxPsv99 = max),
          0,
          40,
          _psv99Weight,
          (weight) => setState(() => _psv99Weight = weight),
        ),
      ],
    );
  }

  Widget _buildRangeCard(
    String title,
    String description,
    double? minValue,
    double? maxValue,
    Function(double?) onMinChanged,
    Function(double?) onMaxChanged,
    double minLimit,
    double maxLimit,
    double weight,
    Function(double) onWeightChanged,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(description, style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    initialValue: minValue?.toString(),
                    decoration: const InputDecoration(
                      labelText: 'Min',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    onChanged: (value) {
                      onMinChanged(double.tryParse(value));
                    },
                    validator: (value) {
                      if (value != null && value.isNotEmpty) {
                        final val = double.tryParse(value);
                        if (val == null) return 'Invalid';
                        if (val < minLimit || val > maxLimit) {
                          return '$minLimit-$maxLimit';
                        }
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    initialValue: maxValue?.toString(),
                    decoration: const InputDecoration(
                      labelText: 'Max',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    onChanged: (value) {
                      onMaxChanged(double.tryParse(value));
                    },
                    validator: (value) {
                      if (value != null && value.isNotEmpty) {
                        final val = double.tryParse(value);
                        if (val == null) return 'Invalid';
                        if (val < minLimit || val > maxLimit) {
                          return '$minLimit-$maxLimit';
                        }
                        if (minValue != null && val < minValue) {
                          return '≥ min';
                        }
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 8),
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
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
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
                Text(
                  'Not Important',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text('Must-Have', style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIntRangeCard(
    String title,
    String description,
    int? minValue,
    int? maxValue,
    Function(int?) onMinChanged,
    Function(int?) onMaxChanged,
    int minLimit,
    int maxLimit,
    double weight,
    Function(double) onWeightChanged,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(description, style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    initialValue: minValue?.toString(),
                    decoration: const InputDecoration(
                      labelText: 'Min',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      onMinChanged(int.tryParse(value));
                    },
                    validator: (value) {
                      if (value != null && value.isNotEmpty) {
                        final val = int.tryParse(value);
                        if (val == null) return 'Invalid';
                        if (val < minLimit || val > maxLimit) {
                          return '$minLimit-$maxLimit';
                        }
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    initialValue: maxValue?.toString(),
                    decoration: const InputDecoration(
                      labelText: 'Max',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      onMaxChanged(int.tryParse(value));
                    },
                    validator: (value) {
                      if (value != null && value.isNotEmpty) {
                        final val = int.tryParse(value);
                        if (val == null) return 'Invalid';
                        if (val < minLimit || val > maxLimit) {
                          return '$minLimit-$maxLimit';
                        }
                        if (minValue != null && val < minValue) {
                          return '≥ min';
                        }
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 8),
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
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
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
                Text(
                  'Not Important',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
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

  Widget _buildActionButtons(bool isEdit) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel'),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: FilledButton(
                onPressed: _saveProfile,
                child: Text(isEdit ? 'Update' : 'Create'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _saveProfile() {
    if (!_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fix the errors in the form'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final profile = SearchProfile(
      position: _position,
      positionGroup: _positionGroup,
      minAge: _minAge,
      maxAge: _maxAge,
      performanceFilters: _hasPerformanceFilters()
          ? PerformanceFilters(
              minDistance: _minDistance,
              maxDistance: _maxDistance,
              distanceWeight: _distanceWeight,
              minMPerMin: _minMPerMin,
              maxMPerMin: _maxMPerMin,
              mPerMinWeight: _mPerMinWeight,
              minRunningDistance: _minRunningDistance,
              maxRunningDistance: _maxRunningDistance,
              runningDistanceWeight: _runningDistanceWeight,
              minHsrDistance: _minHsrDistance,
              maxHsrDistance: _maxHsrDistance,
              hsrDistanceWeight: _hsrDistanceWeight,
              minHsrCount: _minHsrCount,
              maxHsrCount: _maxHsrCount,
              hsrCountWeight: _hsrCountWeight,
              minSprintDistance: _minSprintDistance,
              maxSprintDistance: _maxSprintDistance,
              sprintDistanceWeight: _sprintDistanceWeight,
              minSprintCount: _minSprintCount,
              maxSprintCount: _maxSprintCount,
              sprintCountWeight: _sprintCountWeight,
              minHiDistance: _minHiDistance,
              maxHiDistance: _maxHiDistance,
              hiDistanceWeight: _hiDistanceWeight,
              minHiCount: _minHiCount,
              maxHiCount: _maxHiCount,
              hiCountWeight: _hiCountWeight,
              minPsv99: _minPsv99,
              maxPsv99: _maxPsv99,
              psv99Weight: _psv99Weight,
            )
          : null,
    );

    if (AppConfig.useMockData) {
      // In mock mode, just show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            widget.existingProfile != null
                ? 'Search profile updated successfully'
                : 'Search profile created successfully',
          ),
          backgroundColor: Colors.green,
        ),
      );
    }

    Navigator.of(context).pop(profile);
  }

  bool _hasPerformanceFilters() {
    return _minDistance != null ||
        _maxDistance != null ||
        _minMPerMin != null ||
        _maxMPerMin != null ||
        _minRunningDistance != null ||
        _maxRunningDistance != null ||
        _minHsrDistance != null ||
        _maxHsrDistance != null ||
        _minHsrCount != null ||
        _maxHsrCount != null ||
        _minSprintDistance != null ||
        _maxSprintDistance != null ||
        _minSprintCount != null ||
        _maxSprintCount != null ||
        _minHiDistance != null ||
        _maxHiDistance != null ||
        _minHiCount != null ||
        _maxHiCount != null ||
        _minPsv99 != null ||
        _maxPsv99 != null;
  }
}
