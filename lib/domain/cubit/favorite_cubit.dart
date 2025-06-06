import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero/domain/model/hero.dart';
import 'package:hero/domain/repository/hero_repository.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final HeroRepository _heroRepository;

  FavoriteCubit(this._heroRepository) : super(FavoriteLoadingState());

  void loadData() {
    try {
      emit(FavoriteLoadingState());
      final data = _heroRepository.getFavoriteHeroes();
      emit(FavoriteReadyState(data: data));
    } catch (err, st) {
      emit(FavoriteErrorState(error: err, st: st));
    }
  }

  //TODO: refactor
  Future<void> markHeroFavorite(HeroClass hero) async {
    try {
      await _heroRepository.markHeroFavorite(hero);
      loadData();
    } catch (err, st) {
      emit(FavoriteErrorState(error: err, st: st));
    }
  }
}

sealed class FavoriteState {}

class FavoriteLoadingState extends FavoriteState {}

class FavoriteErrorState extends FavoriteState {
  Object? error;
  final StackTrace? st;

  FavoriteErrorState({required this.error, required this.st});
}

class FavoriteReadyState extends FavoriteState {
  final List<HeroClass> data;

  FavoriteReadyState({required this.data});
}
