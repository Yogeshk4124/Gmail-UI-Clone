import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gmail/Pages/MailPage.dart';
import 'package:http/http.dart' as http;

import '../FAB/fabCollapsed.dart';
import '../FAB/fabExtended.dart';
import '../models/mail.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  late AnimationController _animationController;
  bool isPlaying = false;
  TextEditingController searchController = new TextEditingController();
  SlidableController _slidableController = new SlidableController();
  List<mail> mails = [];
  ScrollController _scrollController = new ScrollController();
  bool isFAB = false;
  int currentSelected = 1;

  void fetchImage() async {
    var response =
        await http.get(Uri.parse('https://randomuser.me/api/?results=10'));
    try {
      var json = jsonDecode(response.body);
      var link;
      for (int i = 0; i < 10; i++) {
        link = json['results'][i]['picture']['large'];
        mails.add(
          new mail(
              content: "New Login to Cloud We noticed some unusual",
              date: "26 Jan 2020",
              subject: "Cloud Login",
              senderName:
                  "New Login to Cloud We noticed some unusual" + "Google",
              senderMail: "google@google.com",
              time: "12:23 am",
              profile: link.toString(),
              receiverMails: ["mymail@gmail.com"],
              read: Random().nextInt(2) == 1 ? true : false),
        );
      }
    } catch (e) {
      print("error " + ":" + e.toString());
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: Duration(milliseconds: 450), vsync: this);
    fetchImage();
    _scrollController.addListener(() {
      if (_scrollController.offset > 50) {
        setState(() {
          isFAB = true;
        });
      } else {
        setState(() {
          isFAB = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
    searchController.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      floatingActionButton:
          isFAB ? buildCollapsedFAB(context) : buildExtendedFAB(context),
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(0.0),
                padding: EdgeInsets.all(0.0),
                height: 90,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.rectangle,
                      border: Border(
                          bottom: BorderSide(
                              color: Colors.grey.shade500, width: .2))),
                  child: Text(
                    'Gmail',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 22,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'ProductSans',
                    ),
                  ),
                ),
              ),
              Container(
                height: 45,
                margin: EdgeInsets.only(right: 10),
                color: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: currentSelected == 1
                          ? Colors.red.shade100
                          : Colors.white,
                      onPrimary:
                          currentSelected == 1 ? Colors.red : Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        currentSelected = 1;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(Icons.all_inbox),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'All inboxes',
                          style: TextStyle(
                              color: currentSelected == 1
                                  ? Colors.red
                                  : Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'ProductSans'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(),
              Container(
                height: 45,
                margin: EdgeInsets.only(right: 10),
                color: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: currentSelected == 2
                          ? Colors.red.shade100
                          : Colors.white,
                      onPrimary:
                          currentSelected == 2 ? Colors.red : Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        currentSelected = 2;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(Icons.inbox),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Primary',
                          style: TextStyle(
                              color: currentSelected == 2
                                  ? Colors.red
                                  : Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'ProductSans'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 45,
                margin: EdgeInsets.only(right: 10),
                color: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: currentSelected == 3
                          ? Colors.blue.shade100
                          : Colors.white,
                      onPrimary:
                          currentSelected == 3 ? Colors.blue : Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        currentSelected = 3;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(Icons.people_alt_outlined),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Social',
                          style: TextStyle(
                              color: currentSelected == 3
                                  ? Colors.blue
                                  : Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'ProductSans'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 45,
                margin: EdgeInsets.only(right: 10),
                color: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: currentSelected == 4
                          ? Colors.green.shade100
                          : Colors.white,
                      onPrimary:
                          currentSelected == 4 ? Colors.green : Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        currentSelected = 4;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(Icons.local_offer_outlined),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Promotions',
                          style: TextStyle(
                              color: currentSelected == 4
                                  ? Colors.green
                                  : Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'ProductSans'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 18, top: 18, bottom: 12),
                child: Text(
                  'ALL LABELS',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black.withOpacity(.84),
                      fontWeight: FontWeight.w500,
                      fontFamily: 'ProductSans'),
                ),
              ),
              Container(
                height: 45,
                margin: EdgeInsets.only(right: 10),
                color: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: currentSelected == 5
                          ? Colors.grey.shade300
                          : Colors.white,
                      onPrimary: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        currentSelected = 5;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(Icons.star_outline),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Starred',
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'ProductSans'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 45,
                margin: EdgeInsets.only(right: 10),
                color: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: currentSelected == 6
                          ? Colors.grey.shade300
                          : Colors.white,
                      onPrimary: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        currentSelected = 6;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(Icons.access_time),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Snoozed',
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'ProductSans'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 45,
                margin: EdgeInsets.only(right: 10),
                color: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: currentSelected == 7
                          ? Colors.grey.shade300
                          : Colors.white,
                      onPrimary: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        currentSelected = 7;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(Icons.label_important_outline),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Important',
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'ProductSans'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 45,
                margin: EdgeInsets.only(right: 10),
                color: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: currentSelected == 8
                          ? Colors.grey.shade300
                          : Colors.white,
                      onPrimary: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        currentSelected = 8;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(Icons.send),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Sent',
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'ProductSans'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 45,
                margin: EdgeInsets.only(right: 10),
                color: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: currentSelected == 9
                          ? Colors.grey.shade300
                          : Colors.white,
                      onPrimary: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        currentSelected = 9;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(Icons.schedule_send_outlined),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Scheduled',
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'ProductSans'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 45,
                margin: EdgeInsets.only(right: 10),
                color: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: currentSelected == 10
                          ? Colors.grey.shade300
                          : Colors.white,
                      onPrimary: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        currentSelected = 10;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(Icons.outbox),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Outbox',
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'ProductSans'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 45,
                margin: EdgeInsets.only(right: 10),
                color: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: currentSelected == 11
                          ? Colors.grey.shade300
                          : Colors.white,
                      onPrimary: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        currentSelected = 11;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(Icons.insert_drive_file_outlined),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Drafts',
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'ProductSans'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 45,
                margin: EdgeInsets.only(right: 10),
                color: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: currentSelected == 12
                          ? Colors.grey.shade300
                          : Colors.white,
                      onPrimary: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        currentSelected = 12;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(Icons.mail_outline),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'All mail',
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'ProductSans'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 45,
                margin: EdgeInsets.only(right: 10),
                color: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: currentSelected == 13
                          ? Colors.grey.shade300
                          : Colors.white,
                      onPrimary: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        currentSelected = 13;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(Icons.report_gmailerrorred_outlined),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Spam',
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'ProductSans'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 45,
                margin: EdgeInsets.only(right: 10),
                color: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: currentSelected == 14
                          ? Colors.grey.shade300
                          : Colors.white,
                      onPrimary: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        currentSelected = 14;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(CupertinoIcons.delete),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Bin',
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'ProductSans'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 18, top: 18, bottom: 12),
                child: Text(
                  'GOOGLE APPS',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black.withOpacity(.84),
                      fontWeight: FontWeight.w500,
                      fontFamily: 'ProductSans'),
                ),
              ),
              Container(
                height: 45,
                margin: EdgeInsets.only(right: 10),
                color: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: currentSelected == 15
                          ? Colors.grey.shade300
                          : Colors.white,
                      onPrimary: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        currentSelected = 15;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(Icons.calendar_today),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Calendar',
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'ProductSans'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 45,
                margin: EdgeInsets.only(right: 10),
                color: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: currentSelected == 16
                          ? Colors.grey.shade300
                          : Colors.white,
                      onPrimary: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        currentSelected = 16;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(Icons.account_circle_outlined),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Contacts',
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'ProductSans'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(),
              Container(
                height: 45,
                margin: EdgeInsets.only(right: 10),
                color: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: currentSelected == 17
                          ? Colors.grey.shade300
                          : Colors.white,
                      onPrimary: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        currentSelected = 17;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(Icons.settings_outlined),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Settings',
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'ProductSans'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 45,
                margin: EdgeInsets.only(right: 10),
                color: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: currentSelected == 18
                          ? Colors.grey.shade300
                          : Colors.white,
                      onPrimary: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        currentSelected = 18;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(Icons.help_outline_outlined),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Help and feedback',
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'ProductSans'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.mail,
              size: 25,
            ),
            label: "Mail",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.videocam_outlined,
              size: 25,
            ),
            label: "Meet",
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                showSearch(context: context, delegate: DataSearch());
              },
              child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade100,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 2.0,
                    ),
                  ],
                ),
                child: Container(
                  // color: Colors.white,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 10),
                          child: Icon(
                            Icons.menu,
                          ),
                        ),
                        onTap: () => _scaffoldKey.currentState!.openDrawer(),
                      ),
                      Expanded(
                        child: Text("Search in emails"),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 10),
                          child: CircleAvatar(
                            radius: 14,
                            child: Text("S"),
                          )),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: Text(
                "PRIMARY",
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    fontSize: 13),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: mails.length,
                controller: _scrollController,
                itemBuilder: (context, i) {
                  return Slidable(
                    key: UniqueKey(),
                    controller: _slidableController,
                    direction: Axis.horizontal,
                    dismissal: SlidableDismissal(
                      child: SlidableDrawerDismissal(),
                      onDismissed: (actionType) {
                        setState(() {
                          mails.removeAt(i);
                        });
                      },
                    ),
                    actionPane: SlidableScrollActionPane(),
                    actionExtentRatio: 0.20,
                    child: ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, MailPage.routeName,
                            arguments: mails[i]);
                      },
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(mails[i].profile.toString()),
                        foregroundColor: Colors.white,
                        radius: 20,
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 6,
                            child: Text(
                              mails[i].getUsername().toString(),
                              style: TextStyle(
                                fontWeight: mails[i].read
                                    ? FontWeight.normal
                                    : FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              mails[i].getDate().toString().substring(0, 6),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            mails[i].getSubject().toString(),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: mails[i].read
                                    ? FontWeight.normal
                                    : FontWeight.bold,
                                color: Colors.black),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  mails[i]
                                      .getContent()
                                      .toString()
                                      .replaceAll("\n", " "),
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                              Icon(
                                Icons.star_border,
                                color: Colors.grey,
                                size: 22,
                              ),
                            ],
                          )
                        ],
                      ),
                      isThreeLine: true,
                    ),
                    actions: <Widget>[
                      IconSlideAction(
                          caption: 'Archive',
                          color: Colors.red,
                          icon: Icons.archive,
                          onTap: () {
                            mails.removeAt(i);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Archived')),
                            );
                          }),
                    ],
                    secondaryActions: <Widget>[
                      IconSlideAction(
                          caption: 'Archive',
                          color: Colors.red,
                          icon: Icons.archive,
                          onTap: () {
                            mails.removeAt(i);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Archived')),
                            );
                          }),
                    ],
                  );
                },
                scrollDirection: Axis.vertical,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  var arr = ["1", "2", "3", "4", "5"];

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, "");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    final suggestionList = query.isEmpty
        ? arr
        : arr.where((element) => element.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.location_city),
        title: Text(suggestionList[index].toString()),
      ),
      itemCount: suggestionList.length,
    );
  }
}
