abstract class SettingsRepository {
  Future<bool> loadUseNavBar();

  Future<void> saveUseNavBar(bool useNavBar);

  Future<bool> loadUseDarkMode();

  Future<void> saveIsDarkMode(bool isDarkMode);
}
