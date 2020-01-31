import 'dart:io';

import 'package:aurorafiles/generated/s_of_context.dart';
import 'package:aurorafiles/override_platform.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  final String title;
  final String message;

  const ErrorDialog(this.title, this.message);

  @override
  Widget build(BuildContext context) {
    final s = Str.of(context);
    final title = Text(this.title);
    final content = Text(message);
    final action = [
      FlatButton(
        child: Text(s.cancel),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ];
    if (PlatformOverride.isIOS) {
      return CupertinoAlertDialog(
        title: title,
        content: content,
        actions: action,
      );
    } else {
      return AlertDialog(
        title: title,
        content: content,
        actions: action,
      );
    }
  }
}
