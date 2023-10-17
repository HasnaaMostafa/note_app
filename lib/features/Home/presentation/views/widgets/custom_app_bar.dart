import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/theme/cubit/theme_cubit.dart';

import '../../../../../core/theme/light_theme.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, top: 30, left: 25),
      child: Row(
        children: <Widget>[
          const Text(
            "Notes",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              BlocProvider.of<ThemeCubit>(context).toggleTheme();
            },
            icon: BlocBuilder<ThemeCubit, ThemeData>(
              builder: (context, theme) {
                return theme == LightTheme.getTheme()
                    ? const Icon(Icons.nightlight_round_outlined)
                    : const Icon(Icons.wb_sunny_outlined);
              },
            ),
          ),
        ],
      ),
    );
  }
}
