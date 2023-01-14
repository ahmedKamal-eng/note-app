import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';
import '../../cubits/addNoteCubit/add_notes_cubit.dart';

class ColorsListView extends StatefulWidget {
  const ColorsListView({Key? key}) : super(key: key);

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40 * 2,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: GestureDetector(child: ColorItem(isActive: currentIndex==index?true:false,color: kColors[index],),
            onTap: (){
            currentIndex=index;
            BlocProvider.of<AddNotesCubit>(context).color=kColors[index];
            setState((){});
            },
          ),
        ),
        itemCount: kColors.length,
      ),
    );
  }
}

class ColorItem extends StatelessWidget {
  const ColorItem({Key? key,required this.isActive,required this.color}) : super(key: key);
  final bool isActive;
  final Color color;

  @override
  Widget build(BuildContext context) {
  return isActive ? CircleAvatar(
    radius: 40,
    backgroundColor: Colors.white,
    child:  CircleAvatar(
      radius: 38,
      backgroundColor: color,
    ),
  ) :  CircleAvatar(
  radius: 38,
  backgroundColor: color,
  );
  }
}
