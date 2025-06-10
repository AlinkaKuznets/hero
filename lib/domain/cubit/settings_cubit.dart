import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero/data/source/local_setting_source.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final LocalSettingSource _settingSource;

  SettingsCubit(this._settingSource)
      : super(SettingsState(useNavBar: true, isDarkMode: false)) {
    loadSettings();
  }

  Future<void> loadSettings() async {
    final savedValue = await _settingSource.loadUseNavBar();
    final savedTheme = await _settingSource.loadUseDarkMode();
    emit(SettingsState(useNavBar: savedValue, isDarkMode: savedTheme));
  }

  Future<void> toggleNavigation(bool useNavBar) async {
    await _settingSource.saveUseNavBar(useNavBar);
    emit(SettingsState(useNavBar: useNavBar));
  }

  Future<void> toggleTheme(bool isDarkMode) async {
    await _settingSource.saveIsDarkMode(isDarkMode);
    emit(SettingsState(isDarkMode: isDarkMode));
  }
}

class SettingsState {
  final bool useNavBar;
  final bool isDarkMode;

  SettingsState({this.useNavBar = true, this.isDarkMode = false});
}
