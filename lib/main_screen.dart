import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero/domain/cubit/heroes_cubit.dart';
import 'package:hero/hero_card.dart';
import 'package:hero/injection.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => inj.heroesCubit..loadData(),
      child: Scaffold(
        body: BlocBuilder<HeroesCubit, HeroesState>(
          builder: (context, state) {
            return switch (state) {
              HeroesStateLoading() => const Center(
                  child: CircularProgressIndicator(),
                ),
              HeroesStateError() => Center(
                  child: Column(
                    children: [
                      Text(
                        state.error.toString(),
                      ),
                      Text(state.st.toString()),
                    ],
                  ),
                ),
              HeroesStateReady() => state.data.isEmpty
                  ? const Center(
                      child: Text('Упс, что-то пошло не так!'),
                    )
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemBuilder: (ctx, index) => HeroCard(state.data[index]),
                    ),
            };
          },
        ),
      ),
    );
  }
}

