


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/cubits/noteCubit/note_cubit.dart';
import 'package:projects/cubits/noteCubit/notes_state.dart';
import 'package:projects/views/models/note_model.dart';
import 'package:projects/views/widgets/note_item.dart';
import 'package:flutter/material.dart';
class NotesListView extends StatelessWidget {
  const NotesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NotesCubit cubit=NotesCubit();
    return BlocBuilder<NotesCubit,NotesState>(
      builder: (context,state) {
        List<NoteModel> notes =BlocProvider.of<NotesCubit>(context).notes!;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
            itemCount: notes.length,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (context,index){

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child:  NoteItem(note: notes[index],),
                );
          },

          ),
        );
      }
    );
  }
}
