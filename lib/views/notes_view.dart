
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/cubits/noteCubit/note_cubit.dart';
import 'package:projects/views/widgets/add_note_bottom_sheet.dart';
import 'package:projects/views/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(child: Icon(Icons.add),onPressed: (){
        showModalBottomSheet(
            isScrollControlled: true,// to
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)
            ),
            context: context, builder: (context){
          return AddNoteBottomSheet();
        });
      },),
      body:NotesViewBody()
    );
  }
}
