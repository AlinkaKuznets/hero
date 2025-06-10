import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero/domain/cubit/favorite_cubit.dart';
import 'package:hero/domain/cubit/single_heroes_cubit.dart';
import 'package:hero/favorite_button.dart';
import 'package:hero/injection.dart';

class HeroScreen extends StatelessWidget {
  const HeroScreen({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => inj.heroCubit..loadData(id),
      child: BlocBuilder<SingleHeroCubit, HeroState>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            actions: switch (state) {
              HeroStateSelected() => [
                  BlocBuilder<FavoriteCubit, FavoriteState>(
                    builder: (context, favoriteState) {
                      final isSelected = switch (favoriteState) {
                        FavoriteReadyState() =>
                          favoriteState.data.contains(state.data),
                        _ => false,
                      };
                      return FavoriteButton(state.data,
                          iconColor: Colors.white);
                    },
                  )
                ],
              _ => null,
            },
            backgroundColor: const Color.fromARGB(255, 101, 5, 5),
            foregroundColor: const Color.fromARGB(255, 251, 216, 216),
          ),
          body: switch (state) {
            HeroStateLoading() => const Center(
                child: CircularProgressIndicator(),
              ),
            HeroStateError() => Center(
                child: Column(
                  children: [
                    Text(
                      state.error.toString(),
                    ),
                    Text(
                      state.st.toString(),
                    ),
                  ],
                ),
              ),
            HeroStateSelected() => SingleChildScrollView(
                child: Column(
                  children: [
                    Image.network(
                      state.data.image,
                      height: 330,
                      width: double.maxFinite,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      state.data.name,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 101, 5, 5),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'SPECIES: ',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                state.data.species,
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              const Text(
                                'LOCATION: ',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                state.data.location.name,
                                style: const TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              const Text(
                                'NUMBER OF EPISODE: ',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                state.data.episode.length.toString(),
                                style: const TextStyle(fontSize: 18),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
          },
        ),
      ),
    );
  }
}
