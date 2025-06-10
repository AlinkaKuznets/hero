import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero/domain/cubit/heroes_cubit.dart';
import 'package:hero/hero_card.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final scrollController = ScrollController();
  int _page = 1;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final position = scrollController.position;
    if (position.pixels >= position.maxScrollExtent - 100 &&
        context.read<HeroesCubit>().state is HeroesStateReady) {
      context.read<HeroesCubit>().loadData(_page++);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HeroesCubit, HeroesState>(
        builder: (context, state) {
          return switch (state) {
            HeroesStateLoading state when state.loadingPage == 0 =>
              const Center(
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
            _ => state.data.isEmpty
                ? const Center(
                    child: Text('Упс, что-то пошло не так!'),
                  )
                : GridView.builder(
                    controller: scrollController,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: state.data.length +
                        (state is HeroesStateLoading ? 1 : 0),
                    itemBuilder: (ctx, index) => state is HeroesStateLoading &&
                            index == state.data.length
                        ? const CircularProgressIndicator()
                        : HeroCard(
                            state.data[index],
                          ),
                  ),
          };
        },
      ),
    );
  }
}
