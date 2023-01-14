import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:projects/cubits/addNoteCubit/add_notes_cubit.dart';
import 'package:projects/cubits/addNoteCubit/add_notes_state.dart';
import 'package:projects/cubits/noteCubit/note_cubit.dart';
import 'package:projects/views/widgets/custom_text_field.dart';

import '../../constants.dart';
import 'add_note_form.dart';
import 'custom_button.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>AddNotesCubit(),
      child: BlocConsumer<AddNotesCubit, AddNotesState>(
          listener: (context, state) {
        if (state is AddNoteFailure) {
          print('failed ${state.errorMessage} ');
        }
        if (state is AddNoteSuccess) {
          BlocProvider.of<NotesCubit>(context,listen: false).fetchAllNotes();
          Navigator.pop(context);
        }
      }, builder: (context, state) {
        return AbsorbPointer(
          absorbing:state is AddNoteLoading ? true: false,
          child: Padding(
            padding:EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: SingleChildScrollView(
              child: AddNoteForm(),
            ),
          ),
        );
      }),
    );
  }
}
