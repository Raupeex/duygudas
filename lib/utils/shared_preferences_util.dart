import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtil {
  static const String avatarKey = 'user_avatar';
  static const String userNameKey = 'user_name';
  static const String userEmailKey = 'user_email';
  static const String userTokenKey = 'user_token';
  static const String lastPageKey = 'last_page';

  static Future<void> saveAvatar(String avatarPath) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(avatarKey, avatarPath);
  }

  static Future<String> getAvatar() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(avatarKey) ?? 'assets/images/fox.png';
  }

  static Future<void> saveUserName(String userName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(userNameKey, userName);
  }

  static Future<String?> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(userNameKey);
  }

  static Future<void> saveUserEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(userEmailKey, email);
  }

  static Future<String?> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(userEmailKey);
  }

  static Future<void> saveUserToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(userTokenKey, token);
  }

  static Future<String?> getUserToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(userTokenKey);
  }

  static Future<void> saveLastPage(String page) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(lastPageKey, page);
  }

  static Future<String?> getLastPage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(lastPageKey);
  }

  static Future<void> clearPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
