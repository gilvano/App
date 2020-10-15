import 'package:flutter/material.dart';

class TileMenu extends StatelessWidget {
  const TileMenu({this.label, this.iconData, this.onTap});

  final String label;
  final IconData iconData;
  final VoidCallback onTap;  

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          letterSpacing: 0.8,
          color: Colors.white,
        ),
      ),
      leading: Icon(
        iconData,
        color: Colors.white,
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
    );
  }
}
