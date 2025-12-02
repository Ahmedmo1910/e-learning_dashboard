import 'package:shared_preferences/shared_preferences.dart';

const String _tokeKey = 'token';

class ApiPrefHelper {
  static Future<void> saveToken(String tokenValue) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString(_tokeKey, tokenValue);
  }

  static Future<String?> getToken() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(_tokeKey);
  }

  static Future<void> removeToken() async {
    final pref = await SharedPreferences.getInstance();
    pref.remove(_tokeKey);
  }
}
