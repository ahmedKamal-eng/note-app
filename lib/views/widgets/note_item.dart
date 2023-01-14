
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:projects/views/edit_note_view.dart';
import 'package:projects/views/models/note_model.dart';

import '../../cubits/noteCubit/note_cubit.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({Key? key,required this.note}) : super(key: key);

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (c)=>EditNoteView(note: note,)));
      },
      child: Container(
        padding: const EdgeInsets.only(top: 24,bottom: 24,left: 16),
        decoration: BoxDecoration(
            color: Color(note.color),
            borderRadius: BorderRadius.circular(16)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(note.title,style: TextStyle(color: Colors.black,fontSize: 26,fontWeight: FontWeight.bold),),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(note.subTitle,style: TextStyle(color: Colors.black.withOpacity(.4),fontSize: 20),),
              ),
              trailing: IconButton(onPressed: (){
                note.delete();
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              },icon: Icon(FontAwesomeIcons.trash,color: Colors.black,size: 30,),),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16,top: 20),
              child: Text(note.date,style: TextStyle(color: Colors.black.withOpacity(.8),fontSize: 20, ),),
            )
          ],
        ),
      ),
    );
  }
}
