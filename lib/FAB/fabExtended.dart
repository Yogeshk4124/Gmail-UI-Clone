import 'package:flutter/material.dart';

Widget buildExtendedFAB(context) => AnimatedContainer(
      duration: Duration(milliseconds: 200),
      curve: Curves.linear,
      width: 150,
      height: 50,
      child: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/compose');
        },
        backgroundColor: Colors.white,
        icon: Icon(
          Icons.edit,
          color: Colors.red,
        ),
        label: Center(
          child: Text(
            "Compose",
            style: TextStyle(fontSize: 15, color: Colors.red),
          ),
        ),
      ),
    );
