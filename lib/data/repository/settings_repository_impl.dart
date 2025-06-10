import 'package:hero/data/source/local_setting_source.dart';
import 'package:hero/domain/repository/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final LocalSettingSource _settingSource;

  SettingsRepositoryImpl({
    required LocalSettingSource settingSource,
  }) : _settingSource = settingSource;

  @override
  Future<bool> loadUseNavBar() async {
    return _settingSource.loadUseNavBar();
  }

  @override
  Future<void> saveUseNavBar(bool useNavBar) async {
    return _settingSource.saveUseNavBar(useNavBar);
  }

  @override
  Future<bool> loadUseDarkMode() async {
    return _settingSource.loadUseDarkMode();
  }

  @override
  Future<void> saveIsDarkMode(bool isDarkMode) async {
    return _settingSource.saveIsDarkMode(isDarkMode);
  }
}
