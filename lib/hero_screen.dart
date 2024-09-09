import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero/domain/cubit/favorite_cubit.dart';
import 'package:hero/domain/cubit/single_heroes_cubit.dart';
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
                      return IconButton(
                        onPressed: () {
                          context
                              .read<FavoriteCubit>()
                              .markHeroFavorite(state.data);
                        },
                        icon: isSelected
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : const Icon(
                                Icons.favorite_border,
                              ),
                      );
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
            HeroStateSelected() => Column(
                children: [
                  SizedBox(
                    height: 300,
                    child: PageView(
                      children: state.data.images
                          .map(
                            (e) => Image.network(
                              e,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                }
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                );
                              },
                              fit: BoxFit.fill,
                            ),
                          )
                          .toList(),
                    ),
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
                  Text(
                    'Appearance: ${state.data.biography.alignment}',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'First appearence: ${state.data.biography.firstAppearance}',
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
          },
        ),
      ),
    );
  }
}
