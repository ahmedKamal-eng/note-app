import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:projects/constants.dart';
import 'package:projects/views/models/note_model.dart';
import 'add_notes_state.dart';

class AddNotesCubit extends Cubit<AddNotesState> {
  AddNotesCubit() : super(AddNotesInitial());


  Color color =const Color(0xffac3931);

  addNote(NoteModel note) async {
    note.color=color.value;
    emit(AddNoteLoading());
    try {

      var noteBox = Hive.box<NoteModel>(kNotesBox);
      await noteBox.add(note);
      emit(AddNoteSuccess());

    } catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }
}
