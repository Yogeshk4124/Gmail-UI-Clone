import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  String text;
  IconData icon;

  CustomIconButton(this.text, this.icon);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 13),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              icon,
              size: 20,
            ),
            Text(text),
          ],
        ),
      ),
    );
  }
}
