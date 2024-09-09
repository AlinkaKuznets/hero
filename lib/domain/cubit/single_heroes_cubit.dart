import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero/domain/model/hero.dart';
import 'package:hero/domain/repository/hero_repository.dart';

class SingleHeroCubit extends Cubit<HeroState> {
  final HeroRepository _singleHeroRepository;

  SingleHeroCubit(this._singleHeroRepository) : super(HeroStateLoading());

  Future<void> loadData(int id) async {
    try {
      emit(HeroStateLoading());

      final data = await _singleHeroRepository.getHero(id);

      emit(HeroStateSelected(data: data));
    } catch (err, st) {
      emit(HeroStateError(
        error: err,
        st: st,
      ));
    }
  }
}

sealed class HeroState {}

class HeroStateLoading extends HeroState {}

class HeroStateError extends HeroState {
  final Object? error;
  final StackTrace? st;

  HeroStateError({
    required this.error,
    required this.st,
  });
}

class HeroStateSelected extends HeroState {
  final HeroClass data;

  HeroStateSelected({required this.data});
}
