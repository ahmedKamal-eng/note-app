import 'package:flutter/material.dart';

import '../../constants.dart';
import '../models/note_model.dart';
import 'colors_list_view.dart';


class EditNoteColorsList extends StatefulWidget {
  EditNoteColorsList({Key? key,required this.note}) : super(key: key);
  NoteModel note;
  @override
  State<EditNoteColorsList> createState() => _EditNoteColorsListState();
}

class _EditNoteColorsListState extends State<EditNoteColorsList> {
  int currentIndex=0;
  @override
  void initState(){
    currentIndex=kColors.indexOf(Color(widget.note.color));
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 40 * 2,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: GestureDetector(child: ColorItem(isActive: currentIndex==index?true:false,color: kColors[index],),
            onTap: (){
              currentIndex=index;
              widget.note.color=kColors[index].value;
              setState((){});
            },
          ),
        ),
        itemCount: kColors.length,
      ),
    );;
  }
}
