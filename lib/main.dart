import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/constants.dart';
import 'package:projects/cubits/addNoteCubit/add_notes_cubit.dart';
import 'package:projects/simple_bloc_observer.dart';
import 'package:projects/views/models/note_model.dart';
import 'package:projects/views/notes_view.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'cubits/noteCubit/note_cubit.dart';


void main()  async{
  WidgetsFlutterBinding.ensureInitialized();



  await Hive.initFlutter();

  Bloc.observer =SimpleBlocObserver();

  Hive.registerAdapter(NoteModelAdapter());
  // box like collection in firebase
  await Hive.openBox<NoteModel>(kNotesBox);
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>NotesCubit(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Poppins'

        ),
        home: NotesView(),
      ),
    );
  }
}
