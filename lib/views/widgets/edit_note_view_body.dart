import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/cubits/noteCubit/note_cubit.dart';
import 'package:projects/views/models/note_model.dart';
import 'package:projects/views/widgets/colors_list_view.dart';
import 'package:projects/views/widgets/custome_app_bar.dart';

import '../../constants.dart';
import 'custom_text_field.dart';
import 'edit_note_color_list.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({Key? key, required this.note}) : super(key: key);
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
          ),
          CustomAppBar(
            onPressed: (){
              widget.note.title= title ?? widget.note.title;
              widget.note.subTitle= content ?? widget.note.subTitle;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
            title: 'Edit Note',
            icon: Icons.check,
          ),
          SizedBox(
            height: 50,
          ),
          CustomTextField(
            onChanged: (value){
              title=value;
            },
            hint: widget.note.title,
          ),
          const SizedBox(
            height: 24,
          ),
          CustomTextField(
            onChanged: (value){
              content=value;
            },
            hint: widget.note.subTitle,
            maxLines: 5,
          ),
          const SizedBox(height: 15,),
          Text('pick note color',style: TextStyle(fontSize: 20),),
           EditNoteColorsList(note: widget.note,),
        ],
      ),
    );
  }
}

