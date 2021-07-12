import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gmail/styles.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../DarkTheme.dart';

class Compose extends StatefulWidget {
  @override
  _ComposeState createState() => _ComposeState();
}

class _ComposeState extends State<Compose> {
  TextEditingController senderController = new TextEditingController();
  TextEditingController receiverController = new TextEditingController();
  TextEditingController subjectController = new TextEditingController();
  TextEditingController msgController = new TextEditingController();
  TextEditingController ccController = new TextEditingController();
  TextEditingController bccController = new TextEditingController();
  final List<String> option = [
    "email1@gmail.com",
    "email2@gmail.com",
    "email3@gmail.com",
    "email4@gmail.com",
    "email5@gmail.com",
    "email6@gmail.com"
  ];
  late String selected;
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    selected = "email1@gmail.com";
  }

  @override
  void dispose() {
    super.dispose();
    senderController.dispose();
    receiverController.dispose();
    subjectController.dispose();
    msgController.dispose();
    ccController.dispose();
    bccController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Styles.themeData(themeChange.darkTheme, context).accentColor,
            size: 25,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "Compose",
          style: GoogleFonts.poppins(
            color: Styles.themeData(themeChange.darkTheme, context)
                .secondaryHeaderColor,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.only(left: 18),
              child: Icon(
                Icons.attachment,
                color: Styles.themeData(themeChange.darkTheme, context)
                    .accentColor,
                size: 22,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.only(left: 18),
              child: Icon(
                Icons.send,
                color: Styles.themeData(themeChange.darkTheme, context)
                    .accentColor,
                size: 22,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.only(left: 15, right: 10),
              child: Icon(
                Icons.more_vert,
                color: Styles.themeData(themeChange.darkTheme, context)
                    .accentColor,
                size: 22,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(left: 12.0, right: 12, top: 15),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      "From",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color:
                              Styles.themeData(themeChange.darkTheme, context)
                                  .hintColor,
                          fontSize: 18),
                    ),
                  ),
                  Expanded(
                    child: DropdownButton<String>(
                      value: selected,
                      isExpanded: true,
                      underline: Container(
                        width: 0,
                        height: 0,
                      ),
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: option.map(
                        (e) {
                          return DropdownMenuItem<String>(
                            value: e,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Text('$e', textAlign: TextAlign.start),
                            ),
                          );
                        },
                      ).toList(),
                      onChanged: (val) {
                        setState(() {
                          selected = val.toString();
                        });
                      },
                    ),
                  ),
                ],
              ),
              Container(
                color: Colors.grey.shade400,
                height: .5,
              ),
              TextField(
                textAlignVertical: TextAlignVertical.top,
                controller: receiverController,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                  prefixIcon: Container(
                    width: 1,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "To",
                      style: TextStyle(
                          color:
                              Styles.themeData(themeChange.darkTheme, context)
                                  .hintColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 18),
                    ),
                  ),
                  border: InputBorder.none,
                  suffixIcon: Visibility(
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    visible: !isVisible,
                    child: GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            isVisible = true;
                          },
                        );
                      },
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          color:
                              Styles.themeData(themeChange.darkTheme, context)
                                  .hintColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.grey.shade400,
                height: .5,
              ),
              Visibility(
                visible: isVisible,
                child: TextField(
                  textAlignVertical: TextAlignVertical.top,
                  controller: ccController,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Container(
                      width: 1,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Cc",
                        style: TextStyle(
                            color:
                                Styles.themeData(themeChange.darkTheme, context)
                                    .hintColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 18),
                      ),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Visibility(
                visible: isVisible,
                child: Container(
                  color: Colors.grey.shade400,
                  height: .5,
                ),
              ),
              Visibility(
                visible: isVisible,
                child: TextField(
                  textAlignVertical: TextAlignVertical.top,
                  controller: bccController,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Container(
                      width: 1,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Bcc",
                        style: TextStyle(
                            color:
                                Styles.themeData(themeChange.darkTheme, context)
                                    .hintColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 18),
                      ),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Visibility(
                visible: isVisible,
                child: Container(
                  color: Colors.grey.shade400,
                  height: .5,
                ),
              ),
              TextField(
                textAlignVertical: TextAlignVertical.top,
                controller: subjectController,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: "Subject"),
              ),
              Container(
                color: Colors.grey.shade400,
                height: .5,
              ),
              Expanded(
                child: TextField(
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  controller: msgController,
                  expands: true,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  decoration: InputDecoration(hintText: "Compose email"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
