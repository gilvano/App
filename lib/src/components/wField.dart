import 'package:flutter/material.dart';

class EditWidget extends StatelessWidget {
  final String label;

  const EditWidget(this.label);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: true,
      decoration: InputDecoration( 
        enabledBorder: const OutlineInputBorder(
        borderSide: const BorderSide(
          color: Color.fromRGBO(71, 130, 116, 1.0), 
          width: 3.0),
        ),       
        labelText: label,
        labelStyle: TextStyle(
          color: Color.fromRGBO(71, 130, 116, 75.0),
          fontFamily: "Inter",
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
