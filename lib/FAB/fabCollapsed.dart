import 'package:flutter/material.dart';

Widget buildCollapsedFAB(context) => AnimatedContainer(
      duration: Duration(milliseconds: 200),
      curve: Curves.linear,
      width: 50,
      height: 50,
      child: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/compose');
        },
        backgroundColor: Colors.white,
        icon: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Icon(Icons.edit, color: Colors.red),
        ),
        label: SizedBox(),
      ),
    );
