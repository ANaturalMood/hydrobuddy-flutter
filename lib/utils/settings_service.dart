import 'package:shared_preferences/shared_preferences.dart';

class SettingsService {
  static SharedPreferences? _prefs;

  static Future<void> ensureInitialized() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  static SharedPreferences get _p {
    assert(_prefs != null, 'SettingsService not initialized');
    return _prefs!;
  }

  // Generic
  static double? getDouble(String key) => _p.getDouble(key);
  static Future<void> setDouble(String key, double value) =>
      _p.setDouble(key, value);
  static int? getInt(String key) => _p.getInt(key);
  static Future<void> setInt(String key, int value) => _p.setInt(key, value);
  static String? getString(String key) => _p.getString(key);
  static Future<void> setString(String key, String value) =>
      _p.setString(key, value);

  // Keys
  static const keyVolumeError = 'volumeError';
  static const keyWeightError = 'weightError';
  static const keyDefaultVolume = 'defaultVolume';
  static const keyDefaultConcUnit = 'defaultConcUnit';
  static const keyDefaultWeightUnit = 'defaultWeightUnit';
  static const keyCalcMode = 'calculationMode';
  static const keySolutionMode = 'solutionMode';
  static const keyEcModel = 'ecModel';
}
