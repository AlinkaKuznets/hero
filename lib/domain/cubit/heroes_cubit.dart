import 'package:hero/domain/model/hero.dart';
import 'package:hero/domain/repository/hero_repository.dart';
import 'package:bloc/bloc.dart';

class HeroesCubit extends Cubit<HeroesState> {
  final HeroRepository _heroRepository;

  HeroesCubit(this._heroRepository) : super(HeroesStateLoading());

  Future<void> loadData() async {
    try {
      emit(HeroesStateLoading());

      final data = await _heroRepository.getHeroes();

      emit(HeroesStateReady(data: data));
    } catch (err, st) {
      emit(HeroesStateError(error: err, st: st));
    }
  }
}

sealed class HeroesState {}

class HeroesStateLoading extends HeroesState {}

class HeroesStateError extends HeroesState {
  final Object? error;
  final StackTrace st;

  HeroesStateError({
    required this.error,
    required this.st,
  });
}

class HeroesStateReady extends HeroesState {
  final List<HeroClass> data;

  HeroesStateReady({required this.data});
}
