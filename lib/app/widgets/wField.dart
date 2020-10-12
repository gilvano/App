import 'package:flutter/material.dart';

class EditWidget extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType inputType;
  final bool isFieldSenha;

  const EditWidget(this.label, this.inputType, this.isFieldSenha,
      {this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: inputType,
      controller: controller,
      obscureText: isFieldSenha,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 3.0,
          ),
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
