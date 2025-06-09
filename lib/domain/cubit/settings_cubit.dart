import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero/data/source/setting_source.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SettingSource _settingSource;

  SettingsCubit(this._settingSource) : super(SettingsState(true)) {
    loadSettings();
  }

  Future<void> loadSettings() async {
    final savedValue = await _settingSource.loadUseNavBar();
    emit(SettingsState(savedValue));
  }

  Future<void> toggleNavigation(bool useNavBar) async {
    await _settingSource.saveUseNavBar(useNavBar);
    emit(SettingsState(useNavBar));
  }
}

class SettingsState {
  final bool useNavBar;

  SettingsState(this.useNavBar);
}
