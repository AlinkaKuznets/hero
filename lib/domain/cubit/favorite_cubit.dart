import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero/domain/model/hero.dart';
import 'package:hero/domain/repository/hero_repository.dart';

enum SortOrder { az, za }

class FavoriteCubit extends Cubit<FavoriteState> {
  final HeroRepository _heroRepository;
  SortOrder _currentOrder = SortOrder.az;

  FavoriteCubit(this._heroRepository) : super(FavoriteLoadingState());

  SortOrder get currentOrder => _currentOrder;

  Future<void> loadData() async {
    try {
      emit(FavoriteLoadingState());
      final fetchedFavorites = await _heroRepository.getFavoriteHeroes();
      _sortFavorites();
      emit(FavoriteReadyState(data: fetchedFavorites));
    } catch (err, st) {
      emit(FavoriteErrorState(error: err, st: st));
    }
  }

  Future<void> markHeroFavorite(HeroClass hero) async {
    try {
      await _heroRepository.markHeroFavorite(hero);
      loadData();
    } catch (err, st) {
      emit(FavoriteErrorState(error: err, st: st));
    }
  }

  void toggleSortOrder() async {
    _currentOrder = _currentOrder == SortOrder.az ? SortOrder.za : SortOrder.az;
    final fetchedFavorites = await _heroRepository.getFavoriteHeroes();
    _sortFavorites();
    emit(FavoriteReadyState(data: fetchedFavorites));
  }

  void _sortFavorites() async {
    final fetchedFavorites = await _heroRepository.getFavoriteHeroes();
    fetchedFavorites.sort((a, b) {
      final result = a.name.compareTo(b.name);
      return _currentOrder == SortOrder.az ? result : -result;
    });
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
