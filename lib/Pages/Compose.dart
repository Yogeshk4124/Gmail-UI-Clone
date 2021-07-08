import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black87,
            size: 25,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "Compose",
          style: GoogleFonts.poppins(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.attachment,
              color: Colors.black.withOpacity(0.7),
              size: 22,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.send,
              color: Colors.black.withOpacity(0.7),
              size: 22,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
              color: Colors.black.withOpacity(0.7),
              size: 22,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(left: 12.0, right: 12, top: 15),
          child: Column(
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: [
              //     GestureDetector(
              //       onTap: () {
              //         Navigator.of(context).pop();
              //       },
              //       child: Icon(
              //         Icons.arrow_back,
              //         color: Colors.black87,
              //         size: 25,
              //       ),
              //     ),
              //     Expanded(
              //       child: Container(
              //         padding: EdgeInsets.only(left: 20),
              //         child: Text(
              //           'Compose',
              //           style: GoogleFonts.poppins(
              //               color: Colors.black, fontSize: 22),
              //         ),
              //       ),
              //     ),
              //     Container(
              //       padding: EdgeInsets.only(left: 20),
              //       child: Icon(
              //         Icons.attachment,
              //         color: Colors.black.withOpacity(0.7),
              //         size: 24,
              //       ),
              //     ),
              //     Container(
              //       padding: EdgeInsets.only(left: 20),
              //       child: Icon(
              //         Icons.send,
              //         color: Colors.black.withOpacity(0.7),
              //         size: 24,
              //       ),
              //     ),
              //     Container(
              //       padding: EdgeInsets.only(left: 10),
              //       child: Icon(
              //         Icons.more_vert,
              //         color: Colors.black.withOpacity(0.7),
              //         size: 24,
              //       ),
              //     )
              //   ],
              // ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      "From",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withOpacity(0.6),
                          fontSize: 17),
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
                color: Colors.grey[500],
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
                          color: Colors.black.withOpacity(0.6),
                          fontWeight: FontWeight.w400,
                          fontSize: 17),
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
                          child: Icon(Icons.keyboard_arrow_down)),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.grey[500],
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
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.w400,
                            fontSize: 17),
                      ),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Visibility(
                visible: isVisible,
                child: Container(
                  color: Colors.grey[500],
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
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.w400,
                            fontSize: 17),
                      ),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Visibility(
                visible: isVisible,
                child: Container(
                  color: Colors.grey[500],
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
                color: Colors.grey[500],
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
