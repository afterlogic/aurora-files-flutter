import 'dart:io';
import 'dart:math';

import 'package:aurorafiles/generated/i18n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LinkOptionWidget extends StatefulWidget {
  @override
  _LinkOptionWidgetState createState() => _LinkOptionWidgetState();
}

class _LinkOptionWidgetState extends State<LinkOptionWidget> {
  bool encryptLink = false;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final size = MediaQuery.of(context).size;
    final title = Text(s.create_link);
    final content = SizedBox(
        width: min(size.width - 40, 300),
        child: GestureDetector(
          onTap: () {
            encryptLink = !encryptLink;
            setState(() {});
          },
          child: Row(
            children: [
              Checkbox(
                value: encryptLink,
                onChanged: (bool value) {
                  encryptLink = value;
                  setState(() {});
                },
              ),
              Expanded(
                child: Text(
                  s.encrypt_link,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ));

    final actions = <Widget>[
      FlatButton(
        child: Text(encryptLink ? s.create_encrypt_link : s.create_link),
        onPressed: () {
          Navigator.pop(context, encryptLink);
        },
      ),
      FlatButton(
        child: Text(s.cancel),
        onPressed: () {
          Navigator.pop(context);
        },
      )
    ];

    return Platform.isIOS
        ? CupertinoAlertDialog(
            title: title,
            content: content,
            actions: actions,
          )
        : AlertDialog(
            title: title,
            content: content,
            actions: actions,
          );
  }
}