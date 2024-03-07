import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/simple_bloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/views/notes_view.dart';

import 'constants.dart';
import 'models/note_model.dart';
void main() async {
await Hive.initFlutter();

Bloc.observer =SimpleBlocObserver();
Hive.registerAdapter(NoteModelAdapter());
await Hive.openBox<NoteModel>(kNotesBox);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>NotesCubit(),
      child: MaterialApp(
        theme: ThemeData(
          brightness:Brightness.dark,
          fontFamily: 'poppins'
        ),
        debugShowCheckedModeBanner: false,
        home: const NotesView(),
      ),
    );
  }
}


