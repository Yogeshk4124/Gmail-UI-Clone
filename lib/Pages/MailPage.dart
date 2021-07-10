import 'package:animated_icon_button/animated_icon_button.dart';
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
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: Duration(milliseconds: 450), vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  toggleIcon() {
    setState(() {
      isPlaying = !isPlaying;
      if (isPlaying)
        _animationController.forward();
      else
        _animationController.reverse();
    });
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
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isVis = !isVis;
                                          toggleIcon();
                                        });
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                          // Icon(
                                          //   Icons.forward,
                                          //
                                          // ),
                                          AnimatedIconButton(
                                            padding: EdgeInsets.all(0),
                                            constraints: BoxConstraints(
                                              maxHeight: 15,
                                              maxWidth: 15,
                                              minHeight: 15,
                                              minWidth: 15,
                                            ),
                                            size: 15,
                                            hoverColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            disabledColor: Colors.transparent,
                                            splashColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            alignment: Alignment.topLeft,
                                            onPressed: () {
                                              setState(() {
                                                isVis = !isVis;
                                                // toggleIcon();
                                              });
                                            },
                                            animationController:
                                                _animationController,
                                            icons: [
                                              AnimatedIconItem(
                                                icon: Icon(
                                                  Icons.keyboard_arrow_down,
                                                  color: Colors.grey,
                                                  size: 15,
                                                ),
                                              ),
                                              AnimatedIconItem(
                                                icon: Icon(
                                                  Icons.keyboard_arrow_up,
                                                  color: Colors.grey,
                                                  size: 15,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
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
                                  border:
                                      Border.all(color: Colors.grey.shade400),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                              padding: EdgeInsets.all(8),
                              margin: EdgeInsets.symmetric(vertical: 12),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(flex: 1, child: Text("From:")),
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          msg.senderName.toString(),
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 5),
                                        child: Icon(
                                          Icons.circle,
                                          size: 6,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Expanded(
                                          flex: 4,
                                          child:
                                              Text(msg.senderMail.toString())),
                                      // Text()
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(flex: 1, child: Text("To:")),
                                      Expanded(
                                        flex: 6,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            for (var i in msg.receiverMails!)
                                              Text(i)
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 14,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(flex: 1, child: Text("Date:")),
                                      Expanded(
                                        flex: 6,
                                        child: Text(msg.date.toString() +
                                            ", " +
                                            msg.time.toString()),
                                      ),
                                      SizedBox(
                                        width: 14,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: Icon(
                                            Icons.lock_outline,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 6,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Standard encryption(TLS).'),
                                            Text('See security details.'),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 14,
                                      ),
                                    ],
                                  ),
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
