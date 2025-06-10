import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero/domain/cubit/favorite_cubit.dart';
import 'package:hero/domain/model/hero.dart';

class FavoriteButton extends StatefulWidget {
  final HeroClass hero;
  final Color iconColor;

  const FavoriteButton(
    this.hero, {
    super.key,
    this.iconColor = Colors.black,
  });

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 200),
    vsync: this,
  );
  late final Animation<double> _scaleAnimation = Tween<double>(
    begin: 1.0,
    end: 1.3,
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ),
  );

  @override
  void initState() {
    super.initState();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onFavoritePressed(BuildContext context) {
    _controller.forward();
    context.read<FavoriteCubit>().markHeroFavorite(widget.hero);
  }

  @override
  Widget build(BuildContext context) {
    final hero = widget.hero;
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, favoriteState) {
        final isFavorite = switch (favoriteState) {
          FavoriteReadyState() => favoriteState.data.contains(hero),
          _ => false,
        };
        return ScaleTransition(
          scale: _scaleAnimation,
          child: Align(
            alignment: Alignment.topRight,
            child: IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () => _onFavoritePressed(context),
              icon: Icon(
                isFavorite ? Icons.star : Icons.star_border,
                color: widget.iconColor,
                size: 32,
              ),
            ),
          ),
        );
      },
    );
  }
}
