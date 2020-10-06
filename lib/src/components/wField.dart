import 'package:flutter/material.dart';

class EditWidget extends StatelessWidget {
  final String label;

  const EditWidget(this.label);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(        
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(71, 130, 116, 0),
            width: 3.0,
            style: BorderStyle.solid,
          ),
        ),
        labelText: label,
        labelStyle: TextStyle(
          color: Color.fromRGBO(71, 130, 116, 25.0),
          fontFamily: "Inter",
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
