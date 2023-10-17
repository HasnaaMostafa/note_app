import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/bloc_observer/bloc_observer.dart';
import 'core/constants/constants.dart';
import 'core/theme/cubit/theme_cubit.dart';
import 'features/Home/presentation/views/home_view.dart';
import 'features/Home/presentation/views_models/note_cubit/note_cubit.dart';
import 'features/Note/data/models/note_model.dart';
import 'features/Note/presentation/views_models/add_note_cubit/add_note_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  Bloc.observer = MyBlocObserver();

  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNoteBox);

  runApp(MyApp(sharedPreferences: sharedPreferences));
}

class MyApp extends StatelessWidget {
  final SharedPreferences? sharedPreferences;
  const MyApp({super.key, this.sharedPreferences});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) => NoteCubit()..fetchNotes()),
        BlocProvider(
          create: (BuildContext context) => AddNoteCubit(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(sharedPreferences!),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, theme) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: theme,
            home: const HomeView(),
          );
        },
      ),
    );
  }
}
