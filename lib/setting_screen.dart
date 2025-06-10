import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero/domain/cubit/settings_cubit.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return Column(
          children: [
            const SizedBox(height: 16),
            const Text(
              'Настройка навигации',
              style: TextStyle(
                color: Color.fromARGB(255, 101, 5, 5),
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Боковое меню',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Switch(
                  value: state.useNavBar,
                  activeColor: const Color.fromARGB(255, 101, 5, 5),
                  onChanged: (newValue) {
                    context.read<SettingsCubit>().toggleNavigation(newValue);
                  },
                ),
                const Text('Нижнее меню',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Настройка темы',
              style: TextStyle(
                color: Color.fromARGB(255, 101, 5, 5),
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Светлая тема',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Switch(
                  value: state.isDarkMode,
                  activeColor: const Color.fromARGB(255, 101, 5, 5),
                  onChanged: (newValue) {
                    context.read<SettingsCubit>().toggleTheme(newValue);
                  },
                ),
                const Text('Темная тема',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ],
            )
          ],
        );
      },
    );
  }
}
