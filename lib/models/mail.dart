import 'package:flutter/cupertino.dart';

class mail {
  String? username;
  String? subject;
  String? content;
  String? time;
  String? date;
  String? senderMail;
  String? profile;
  mail({
    @required this.username,
    @required this.profile,
    @required this.senderMail,
    @required this.subject,
    @required this.content,
    @required this.time,
    @required this.date,
  });

  String? getUsername() => username;
  String? getSubject() => subject;
  String? getContent() => content;
  String? getTime() => time;
  String? getDate() => date;
  String? getSenderMail() => senderMail;
  String? getProfile() => profile;
}
