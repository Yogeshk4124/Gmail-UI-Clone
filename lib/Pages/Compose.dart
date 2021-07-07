import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Compose extends StatefulWidget {
  @override
  _ComposeState createState() => _ComposeState();
}

class _ComposeState extends State<Compose> {
  TextEditingController senderController = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    senderController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.arrow_back,
                  color: Colors.grey,
                ),
                Expanded(
                  child: Text('Compose'),
                ),
                Icon(
                  Icons.attachment,
                  color: Colors.grey,
                ),
                Icon(
                  Icons.send_outlined,
                  color: Colors.grey,
                ),
                Icon(
                  Icons.more_vert,
                  color: Colors.grey,
                ),
              ],
            ),
            Row(
              children: [
                Text('From'),
                Expanded(
                  child: TextField(
                    controller: senderController,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Text('From'),
                Expanded(
                  child: TextField(
                    controller: senderController,
                  ),
                )
              ],
            ),
            TextField(
              controller: senderController,
            ),
            TextField(
              controller: senderController,
            ),
          ],
        ),
      ),
    );
  }
}
