import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  //! Initialize the shared preferences instance.
  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  //! Save a value to shared preferences.
  static Future<bool> saveData(
      {required String key, required dynamic value}) async {
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else if (value is double) {
      return await sharedPreferences.setDouble(key, value);
    } else {
      return false;
    }
  }

  //! Get a String value from shared preferences.
  static String? getDataString({required String key}) {
    return sharedPreferences.getString(key);
  }

  //! Get an integer value from shared preferences.
  static int? getDataInt({required String key}) {
    return sharedPreferences.getInt(key);
  }

  //! Get a boolean value from shared preferences.
  static bool? getDataBool({required String key}) {
    return sharedPreferences.getBool(key);
  }

  //! Get a double value from shared preferences.
  static double? getDataDouble({required String key}) {
    return sharedPreferences.getDouble(key);
  }

  //! Remove a value from shared preferences.
  static Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  //! Clear all data from shared preferences.
  static Future<bool> clearAll() async {
    return await sharedPreferences.clear();
  }
}
