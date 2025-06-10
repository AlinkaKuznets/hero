import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero/domain/repository/settings_repository.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SettingsRepository _settingsRepository;

  SettingsCubit(this._settingsRepository)
      : super(SettingsState(
          useNavBar: true,
          isDarkMode: false,
        )) {
    loadSettings();
  }

  Future<void> loadSettings() async {
    final savedValue = await _settingsRepository.loadUseNavBar();
    final savedTheme = await _settingsRepository.loadUseDarkMode();
    emit(SettingsState(useNavBar: savedValue, isDarkMode: savedTheme));
  }

  Future<void> toggleNavigation(bool useNavBar) async {
    await _settingsRepository.saveUseNavBar(useNavBar);
    emit(SettingsState(
      useNavBar: useNavBar,
      isDarkMode: state.isDarkMode,
    ));
  }

  Future<void> toggleTheme(bool isDarkMode) async {
    await _settingsRepository.saveIsDarkMode(isDarkMode);
    emit(SettingsState(
      isDarkMode: isDarkMode,
      useNavBar: state.useNavBar,
    ));
  }
}

class SettingsState {
  final bool useNavBar;
  final bool isDarkMode;

  SettingsState({
    this.useNavBar = true,
    this.isDarkMode = false,
  });
}
