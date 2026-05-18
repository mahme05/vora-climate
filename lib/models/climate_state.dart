
enum FanSpeed { low, medium, high }

enum AcMode { cooling, heating, dry, eco }

class ClimateState {
  final double currentTemp;
  final double humidity;
  final double targetTemp;
  final bool isPoweredOn;
  final FanSpeed fanSpeed;
  final AcMode mode;

  const ClimateState({
    required this.currentTemp,
    required this.humidity,
    required this.targetTemp,
    required this.isPoweredOn,
    required this.fanSpeed,
    required this.mode,
  });

  ClimateState copyWith({
    double? currentTemp,
    double? humidity,
    double? targetTemp,
    bool? isPoweredOn,
    FanSpeed? fanSpeed,
    AcMode? mode,
  }) {
    return ClimateState(
      currentTemp: currentTemp ?? this.currentTemp,
      humidity: humidity ?? this.humidity,
      targetTemp: targetTemp ?? this.targetTemp,
      isPoweredOn: isPoweredOn ?? this.isPoweredOn,
      fanSpeed: fanSpeed ?? this.fanSpeed,
      mode: mode ?? this.mode,
    );
  }

  String get modeLabel {
    switch (mode) {
      case AcMode.cooling:
        return 'Cooling';
      case AcMode.heating:
        return 'Heating';
      case AcMode.dry:
        return 'Dry';
      case AcMode.eco:
        return 'Eco';
    }
  }

  String get fanSpeedLabel {
    switch (fanSpeed) {
      case FanSpeed.low:
        return 'Low';
      case FanSpeed.medium:
        return 'Med';
      case FanSpeed.high:
        return 'High';
    }
  }
}
