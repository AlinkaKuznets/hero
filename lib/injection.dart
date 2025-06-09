import 'package:hero/data/repository/hero_repository_impl.dart';
import 'package:hero/data/source/rest_source.dart';
import 'package:hero/data/source/setting_source.dart';
import 'package:hero/data/source/storage_source.dart';
import 'package:hero/domain/cubit/favorite_cubit.dart';
import 'package:hero/domain/cubit/heroes_cubit.dart';
import 'package:hero/domain/cubit/settings_cubit.dart';
import 'package:hero/domain/cubit/single_heroes_cubit.dart';

final inj = Injection();

class Injection {
  final _restSource = RestSource();
  final _storageSource = StorageSource();
  final _settingsSource = SettingSource();
  late final _heroRepository = HeroRepositoryImpl(
    restSource: _restSource,
    storageSource: _storageSource,
  );

  HeroesCubit get heroesCubit => HeroesCubit(_heroRepository);

  SingleHeroCubit get heroCubit => SingleHeroCubit(_heroRepository);

  FavoriteCubit get favoriteCubit => FavoriteCubit(_heroRepository);

  SettingsCubit get settingCubit => SettingsCubit(_settingsSource);
}
