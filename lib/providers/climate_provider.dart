import 'package:flutter/foundation.dart';
import '../models/climate_state.dart';

class ClimateProvider extends ChangeNotifier {
  ClimateState _state = const ClimateState(
    currentTemp: 24.0,
    humidity: 45.0,
    targetTemp: 22,
    isPoweredOn: true,
    fanSpeed: FanSpeed.medium,
    mode: AcMode.cooling,
  );

  ClimateState get state => _state;

  void increaseTemp() {
    if (!_state.isPoweredOn) return;
    if (_state.targetTemp >= 32.0) return;

    _state = _state.copyWith(targetTemp: _state.targetTemp + 1);
    notifyListeners();
  }

  void decreaseTemp() {
    if (!_state.isPoweredOn) return;
    if (_state.targetTemp <= 16.0) return;

    _state = _state.copyWith(targetTemp: _state.targetTemp - 1);
    notifyListeners();
  }

  void togglePower() {
    _state = _state.copyWith(isPoweredOn: !_state.isPoweredOn);
    notifyListeners();
  }

  void setFanSpeed(FanSpeed speed) {
    if (!_state.isPoweredOn) return;
    _state = _state.copyWith(fanSpeed: speed);
    notifyListeners();
  }

  void setMode(AcMode mode) {
    if (!_state.isPoweredOn) return;
    _state = _state.copyWith(mode: mode);
    notifyListeners();
  }
}
