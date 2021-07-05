import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gmail/View/helper.dart';
import 'package:http/http.dart' as http;

import 'models/mail.dart';

class custom extends StatefulWidget {
  @override
  _customState createState() => _customState();
}

class _customState extends State<custom> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool isPlaying = false;
  TextEditingController searchController = new TextEditingController();
  SlidableController _slidableController = new SlidableController();
  late mail m;
  late List<mail> mails = [];

  void fetchImage() async {
    var response = await http.get(Uri.parse('https://randomuser.me/api/'));
    var json = jsonDecode(response.body);
    var link = json['results'][0]['picture']['large'];
    mails.add(
      new mail(
        content: "New Login to Cloud We noticed some unusual",
        date: "26,Jan 2020",
        subject: "Cloud Login",
        username: "Google",
        senderMail: "google@google.com",
        time: "12:23 am",
        profile: link,
      ),
    );
    setState(() {});
  }

  List items = ["1", "1", "1", "1", "1", "1"];
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: Duration(milliseconds: 450), vsync: this);
    for (int i = 0; i < 10; i++) fetchImage();
  }

  void _handleOnPressed() {
    setState(() {
      isPlaying = !isPlaying;
      isPlaying
          ? _animationController.forward()
          : _animationController.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          child: AnimatedIcon(
                            icon: AnimatedIcons.close_menu,
                            progress: _animationController,
                          ),
                        ),
                        onTap: () => _handleOnPressed(),
                      ),
                      Expanded(
                        // padding: EdgeInsets.all(15),
                        // width: 200,
                        child: Text("Search in emails"),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.circle,
                          color: Colors.grey,
                        ),
                        onPressed: () => {},
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
                itemBuilder: (context, i) {
                  return getSlidable(mails[i], context, i);
                  return Slidable(
                    key: UniqueKey(),
                    controller: _slidableController,
                    direction: Axis.horizontal,
                    dismissal: SlidableDismissal(
                      child: SlidableDrawerDismissal(),
                      onDismissed: (actionType) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('clicked4')),
                        );
                        setState(() {
                          items.removeAt(i);
                        });
                      },
                    ),
                    actionPane: SlidableScrollActionPane(),
                    actionExtentRatio: 0.20,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.indigoAccent,
                        child: Text(items[i]),
                        foregroundColor: Colors.white,
                      ),
                      title: Text(items[i]),
                      subtitle: Text('SlidableDrawerDelegate'),
                    ),
                    actions: <Widget>[
                      IconSlideAction(
                        caption: 'Archive',
                        color: Colors.blue,
                        icon: Icons.archive,
                        onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('clicked1')),
                        ),
                      ),
                      IconSlideAction(
                        caption: 'Share',
                        color: Colors.indigo,
                        icon: Icons.share,
                        onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('clicked2')),
                        ),
                      ),
                    ],
                    secondaryActions: <Widget>[
                      IconSlideAction(
                        caption: 'More',
                        color: Colors.grey.shade200,
                        icon: Icons.more_horiz,
                        onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('clicked3')),
                        ),
                        closeOnTap: false,
                      ),
                      IconSlideAction(
                        caption: 'Delete',
                        color: Colors.red,
                        icon: Icons.delete,
                        onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('clicked4')),
                        ),
                      ),
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
