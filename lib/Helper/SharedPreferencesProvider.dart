import 'cash_helper.dart';

class AppSharedPreferences {
  //token
  static String token = 'token';
  static String get getToken => CacheHelper.getData(key: token) ?? '';
  static saveToken(String value) =>
      CacheHelper.saveData(key: token, value: value);
  static bool get hasToken => CacheHelper.contains(token);
  static void get removeToken => CacheHelper.removeData(key: token);

  // guest

  static String isGuest = "isGuest";
  static String get getIsguest => CacheHelper.getData(key: isGuest) ?? "";
  static void saveIsGuest(bool value) =>
      CacheHelper.saveData(key: isGuest, value: value);

  static bool get hasIsGuest => CacheHelper.contains(isGuest);

  static void removeIsGuest() => CacheHelper.removeData(key: isGuest);
}