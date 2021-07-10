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
                height: 100,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.rectangle,
                      border: Border(
                          bottom: BorderSide(
                              color: Colors.grey.shade500, width: .2))),
                  child: Text(
                    'Gmail',
                    style: TextStyle(color: Colors.red, fontSize: 24),
                  ),
                ),
              ),
              // ListTile(
              //   title: Row(
              //     children: [
              //       Icon(Icons.inbox),
              //       SizedBox(
              //         width: 20,
              //       ),
              //       Text('Item 1'),
              //    ],
              //   ),
              //   onTap: () {
              //     // Update the state of the app.
              //     // ...
              //   },
              // ),
              Container(
                height: 45,
                margin: EdgeInsets.only(right: 40),
                color: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(100),
                      bottomRight: Radius.circular(100)),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.blue,
                      onSurface: Colors.black,
                    ),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(Icons.inbox),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Item 1',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 45,
                margin: EdgeInsets.only(right: 40),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(100),
                      bottomRight: Radius.circular(100)),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(Icons.inbox),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Item 1',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 45,
                margin: EdgeInsets.only(right: 40),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(100),
                      bottomRight: Radius.circular(100)),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(Icons.inbox),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Item 1',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 45,
                margin: EdgeInsets.only(right: 40),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(100),
                      bottomRight: Radius.circular(100)),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(Icons.inbox),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Item 1',
                          style: TextStyle(fontWeight: FontWeight.w500),
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
                      color: Colors.grey,
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
                        // padding: EdgeInsets.all(15),
                        // width: 200,
                        child: Text("Search in emails"),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 10),
                        child: Icon(
                          Icons.circle,
                          color: Colors.grey,
                        ),
                      ),
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
