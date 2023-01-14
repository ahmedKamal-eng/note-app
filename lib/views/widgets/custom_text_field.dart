import 'package:flutter/material.dart';

import '../../constants.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({this.hint,this.maxLines=1,this.onSaved,this.onChanged});
   final String? hint;
   final int maxLines;
   final void Function(String?)? onSaved;
   final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'field is required';
        }else{
          return null;
        }
      },
      maxLines: maxLines,
      cursorColor: kPrimaryColor,
      cursorWidth: 4,
      decoration: InputDecoration(

          hintText: hint,
          hintStyle: const TextStyle(color: kPrimaryColor),
          border: buildBorder(),
          focusedBorder: buildBorder(kPrimaryColor, 3.0),
          enabledBorder: buildBorder()),
    );
  }
}

OutlineInputBorder buildBorder([color, width]) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        width: width ?? 1,
        color: color ?? Colors.white,
      ));
}
