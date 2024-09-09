import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero/domain/cubit/favorite_cubit.dart';
import 'package:hero/hero_card.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        return switch (state) {
          FavoriteLoadingState() => const Center(
              child: CircularProgressIndicator(),
            ),
          FavoriteErrorState() => Center(
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
          FavoriteReadyState() => GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: state.data.length,
              itemBuilder: (ctx, index) => HeroCard(state.data[index]),
            ),
        };
      },
    );
  }
}
