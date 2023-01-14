import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  IconData icon;
  final void Function()? onPressed;
  CustomIcon({required this.icon,this.onPressed});


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.05),
        borderRadius: BorderRadius.circular(16),
      ),
      child: IconButton(
          onPressed:onPressed,
          icon: Icon(
            icon,
            size: 30,
          )),
    );
  }
}
