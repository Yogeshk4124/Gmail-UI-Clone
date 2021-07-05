import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gmail/models/mail.dart';

Widget getSlidable(mail m, context, i) {
  SlidableController _slidableController = new SlidableController();
  return Slidable(
    key: UniqueKey(),
    controller: _slidableController,
    direction: Axis.horizontal,
    dismissal: SlidableDismissal(
      child: SlidableDrawerDismissal(),
      onDismissed: (actionType) {
        context.setState(() {
          context.mails.removeAt(i);
        });
      },
    ),
    actionPane: SlidableScrollActionPane(),
    actionExtentRatio: 0.20,
    child: ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.indigoAccent,
        child: Image.network(m.profile.toString()),
        foregroundColor: Colors.white,
        radius: 20,
      ),
      title: Text(m.getUsername().toString()),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(m.getSubject().toString()),
          Text(
            m.getContent().toString().replaceAll("\n", " "),
            overflow: TextOverflow.clip,
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
        onTap: () => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('clicked1')),
        ),
      ),
    ],
    secondaryActions: <Widget>[
      IconSlideAction(
        caption: 'Archive',
        color: Colors.red,
        icon: Icons.archive,
        onTap: () => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('clicked1')),
        ),
      ),
    ],
  );
}
