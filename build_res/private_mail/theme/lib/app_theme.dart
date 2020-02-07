import 'dart:io';

import 'package:flutter/material.dart';
import 'app_color.dart';

class AppTheme {
  static ThemeData get theme => ThemeData(
        brightness: Brightness.light,
        primaryColor: AppColor.primary,
        primaryColorDark: AppColor.primaryVariant,
        primaryColorLight: Color.alphaBlend(Colors.white24, AppColor.primary),
        accentColor: AppColor.accent,
        toggleableActiveColor: AppColor.accent,
        textSelectionHandleColor: AppColor.accent,
        cursorColor: AppColor.accent,
        highlightColor: Platform.isIOS ? Colors.transparent : null,
        splashColor: Platform.isIOS ? Colors.transparent : null,
        splashFactory: InkRipple.splashFactory,
        buttonTheme: _buttonTheme,
        selectedRowColor: Colors.black12,
        colorScheme: colorScheme,
        appBarTheme: _appBarTheme,
      );

  static ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColor.primary,
        primaryColorDark: AppColor.primaryVariant,
        primaryColorLight: Color.alphaBlend(Colors.white24, AppColor.primary),
        accentColor: AppColor.accent,
        toggleableActiveColor: AppColor.accent,
        textSelectionHandleColor: AppColor.accent,
        cursorColor: AppColor.accent,
        highlightColor: Platform.isIOS ? Colors.transparent : null,
        splashColor: Platform.isIOS ? Colors.transparent : null,
        splashFactory: InkRipple.splashFactory,
        buttonTheme: _buttonTheme,
        selectedRowColor: Colors.white10,
        appBarTheme: _appBarTheme,
        colorScheme: colorScheme.copyWith(brightness: Brightness.dark),
      );

  static final colorScheme = ColorScheme(
    error: AppColor.warning,
    onError: AppColor.warning.withAlpha(200),
    secondary: AppColor.secondary,
    secondaryVariant: AppColor.secondaryVariant,
    onSecondary: AppColor.secondary.withAlpha(200),
    primary: AppColor.primary,
    primaryVariant: AppColor.primaryVariant,
    onPrimary: AppColor.primary.withAlpha(200),
    surface: AppColor.surface,
    onSurface: AppColor.surface.withAlpha(200),
    background: Color.alphaBlend(Colors.white70, Colors.grey),
    onBackground: Color.alphaBlend(Colors.white54, Colors.grey),
    brightness: Brightness.light,
  );

  static final _buttonTheme = ButtonThemeData(
    buttonColor: AppColor.accent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
    textTheme: ButtonTextTheme.primary,
  );
  static final _appBarTheme = AppBarTheme(
    color: AppColor.primary,
  );
}
