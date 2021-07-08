import 'package:flutter/cupertino.dart';

class mail {
  String? senderName;
  String? subject;
  String? content;
  String? time;
  String? date;
  String? senderMail;
  String? profile;
  bool read;
  List<String>? receiverMails;
  mail({
    @required this.senderName,
    @required this.profile,
    @required this.senderMail,
    @required this.subject,
    @required this.content,
    @required this.time,
    @required this.date,
    @required this.receiverMails,
    this.read = false,
  });

  String? getUsername() => senderName;
  String? getSubject() => subject;
  String? getContent() => content;
  String? getTime() => time;
  String? getDate() => date;
  String? getSenderMail() => senderMail;
  String? getProfile() => profile;
  bool getRead() => read;
}
