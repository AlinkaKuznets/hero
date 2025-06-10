
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero/domain/model/hero.dart';
import 'package:hero/domain/repository/hero_repository.dart';

class HeroesCubit extends Cubit<HeroesState> {
  final HeroRepository _heroRepository;

  final List<HeroClass> _loadedHeroes = [];

  HeroesCubit(this._heroRepository)
      : super(
          HeroesStateLoading(
            loadingPage: 0,
            data: [],
          ),
        );

  Future<void> loadData([int page = 0]) async {
    emit(
      HeroesStateLoading(
        loadingPage: page,
        data: state.data,
      ),
    );

    try {
      final heroes = await _heroRepository.getHeroes(page);

      _loadedHeroes.addAll(heroes);

      emit(HeroesStateReady(data: List.of(_loadedHeroes)));
    } catch (err, st) {
      emit(
        HeroesStateError(
          error: err,
          st: st,
          data: state.data,
        ),
      );
    }
  }
}

sealed class HeroesState {
  final List<HeroClass> data;

  HeroesState({required this.data});
}

class HeroesStateLoading extends HeroesState {
  final int loadingPage;

  HeroesStateLoading({required this.loadingPage, required super.data});
}

class HeroesStateError extends HeroesState {
  final Object? error;
  final StackTrace st;

  HeroesStateError({
    required this.error,
    required this.st,
    required super.data,
  });
}

class HeroesStateReady extends HeroesState {
  HeroesStateReady({required super.data});
}
