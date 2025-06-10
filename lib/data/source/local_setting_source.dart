import 'package:shared_preferences/shared_preferences.dart';

class LocalSettingSource {
  static const _navBarKey = 'type_navBar';
  static const _themeKey = 'type_Theme';

  Future<bool> loadUseNavBar() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final storedNavBar = preferences.getBool(_navBarKey);
    if (storedNavBar == null) return true;

    return storedNavBar;
  }

  Future<void> saveUseNavBar(bool useNavBar) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool(_navBarKey, useNavBar);
  }

  Future<bool> loadUseDarkMode() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final storedTheme = preferences.getBool(_themeKey);

    if (storedTheme == null) return false;
    return storedTheme;
  }

  Future<void> saveIsDarkMode(bool isDarkMode) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool(_themeKey, isDarkMode);
  }
}
