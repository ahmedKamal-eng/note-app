
import 'package:flutter/material.dart';

import '../../constants.dart';

class CustomButton extends StatelessWidget {
   CustomButton({this.onTap,this.isLoading=true});

  final void Function()? onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:onTap,
      child: Padding(
        padding:  EdgeInsets.symmetric(
            vertical: 15,
            horizontal: MediaQuery.of(context).size.width * .38),
        child:isLoading ? CircularProgressIndicator(color: Colors.black,) :Text(
          'Add',
          style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: kPrimaryColor,
      ),
    );
  }
}
