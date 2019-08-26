import 'package:flutter/material.dart';

void showSnack({
  @required BuildContext context,
  @required ScaffoldState scaffoldState,
  @required String msg,
  isError = true,
}) {
  final theme = Theme.of(context);
  final snack = theme.brightness == Brightness.light
      ? SnackBar(
          content: Text(msg),
          backgroundColor: isError ? theme.errorColor : null,
        )
      : SnackBar(
          content: Text(
            msg,
            style: TextStyle(
                color: !isError ? theme.scaffoldBackgroundColor : null),
          ),
          backgroundColor: isError ? theme.errorColor : theme.iconTheme.color,
        );

  if (scaffoldState != null) {
    scaffoldState.removeCurrentSnackBar();
  }
  scaffoldState.showSnackBar(snack);
}
