import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:teachers_dashboard/constants.dart';

class SecureStorage {
  static const _storage = FlutterSecureStorage();

  static Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
    required String expiry,
  }) async {
    await _storage.write(key: kToken, value: accessToken);
    await _storage.write(key: kRToken, value: refreshToken);
    await _storage.write(key: kEXToken, value: expiry);
    await _storage.write(key: kIsLoggedIn, value: 'true');
  }

  static Future<String?> getAccessToken() async =>
      await _storage.read(key: kToken);

  static Future<String?> getRefreshToken() async =>
      await _storage.read(key: kRToken);

  static Future<String?> getExpiry() async =>
      await _storage.read(key: kEXToken);

  static Future<bool> isLoggedIn() async =>
      (await _storage.read(key: kIsLoggedIn)) == 'true';

  static Future<void> logout() async {
    await _storage.deleteAll();
  }
}
