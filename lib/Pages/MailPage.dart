import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gmail/CustomWidgets/CustomIconButton.dart';
import 'package:gmail/models/mail.dart';

class MailPage extends StatefulWidget {
  static const routeName = '/extractArguments';

  @override
  _MailPageState createState() => _MailPageState();
}

class _MailPageState extends State<MailPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool isVis = false;
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: Duration(milliseconds: 450), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final msg = ModalRoute.of(context)!.settings.arguments as mail;
    List<String> text = ["Reply", "Reply All", "Forward"];
    List<IconData> icons = [
      CupertinoIcons.arrow_turn_up_left,
      CupertinoIcons.arrow_turn_up_left,
      CupertinoIcons.arrow_turn_up_right,
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.archive_outlined,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.delete,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.mail_outline_outlined,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width,
                minHeight: MediaQuery.of(context).size.height * 0.85),
            child: IntrinsicHeight(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    LimitedBox(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                msg.subject.toString(),
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w400),
                              ),
                              Icon(Icons.star_outline),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 45,
                                  child: Text(
                                    'S',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      shape: BoxShape.circle),
                                ),
                              ),
                              Expanded(flex: 1, child: SizedBox()),
                              Expanded(
                                flex: 12,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 5,
                                          child: Text(
                                            msg.senderName.toString(),
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            msg
                                                .getDate()
                                                .toString()
                                                .substring(0, 6),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          msg.receiverMails?.length == 1
                                              ? "to me"
                                              : "",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w600),
                                          textAlign: TextAlign.start,
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              isVis = !isVis;
                                            });
                                          },
                                          icon: AnimatedIcon(
                                            icon: AnimatedIcons.view_list,
                                            progress: _animationController,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                  flex: 2,
                                  child:
                                      Icon(CupertinoIcons.arrow_turn_up_left)),
                              Expanded(flex: 2, child: Icon(Icons.more_vert)),
                            ],
                          ),
                          Visibility(
                            visible: isVis,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Row(
                                    children: [
                                      Text("From:"),
                                      Text("Sender"),
                                      // Text()
                                    ],
                                  ),
                                  Text("ds"),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(top: 20),
                            child: Text(
                              msg.content.toString(),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        for (var i = 0; i < 3; i++)
                          Expanded(
                            child: CustomIconButton(
                              text[i],
                              icons[i],
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
