import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  String label;
  Function function;
  CustomTextField(this.label,this.function);
  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 20, left: 10, right: 10),
        child: TextFormField(
            decoration: InputDecoration(
          //suffix: Icon(Icons.email),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          labelText: widget.label,
          fillColor: Colors.blue.withOpacity(0.1),
          filled: true,

        ),
          onSaved: widget.function,

        )
      );
  }
}
