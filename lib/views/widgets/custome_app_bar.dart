import 'package:flutter/material.dart';

import 'custom_icon.dart';

class CustomAppBar extends StatelessWidget {

  final String title;
  final  IconData icon;
  final void Function()? onPressed;
 CustomAppBar({required this.title,required this.icon,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
     
      children: [
          Text(title,style: TextStyle(fontSize: 30),),
             Spacer(),
             CustomIcon(onPressed: onPressed,icon:icon)
      ],
    );
  }
}
