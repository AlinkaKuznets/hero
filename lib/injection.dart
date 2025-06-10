import 'package:hero/data/repository/hero_repository_impl.dart';
import 'package:hero/data/repository/settings_repository_impl.dart';
import 'package:hero/data/source/rest_source.dart';
import 'package:hero/data/source/local_setting_source.dart';
import 'package:hero/data/source/local_storage_source.dart';
import 'package:hero/domain/cubit/favorite_cubit.dart';
import 'package:hero/domain/cubit/heroes_cubit.dart';
import 'package:hero/domain/cubit/settings_cubit.dart';
import 'package:hero/domain/cubit/single_heroes_cubit.dart';

final inj = Injection();

class Injection {
  final _restSource = RestSource();
  final _storageSource = LocalStorageSource();
  final _settingsSource = LocalSettingSource();
  late final _heroRepository = HeroRepositoryImpl(
    restSource: _restSource,
    storageSource: _storageSource,
  );
  late final _settingsRepository =
      SettingsRepositoryImpl(settingSource: _settingsSource);

  HeroesCubit get heroesCubit => HeroesCubit(_heroRepository);

  SingleHeroCubit get heroCubit => SingleHeroCubit(_heroRepository);

  FavoriteCubit get favoriteCubit => FavoriteCubit(_heroRepository);

  SettingsCubit get settingCubit => SettingsCubit(_settingsRepository);
}
