

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../constants.dart';
import '../../views/models/note_model.dart';
import 'notes_state.dart';



class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NoteModel>? notes;

  fetchAllNotes()  {
      var noteBox = Hive.box<NoteModel>(kNotesBox);
      notes=noteBox.values.toList();
      emit(NoteSuccess());
  }


}