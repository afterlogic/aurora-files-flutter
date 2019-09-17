import 'dart:io';

import 'package:aurorafiles/modules/app_store.dart';
import 'package:aurorafiles/modules/auth/state/auth_state.dart';
import 'package:aurorafiles/modules/files/files_route.dart';
import 'package:aurorafiles/shared_ui/app_button.dart';
import 'package:aurorafiles/shared_ui/main_gradient.dart';
import 'package:aurorafiles/themimg/material_theme.dart';
import 'package:aurorafiles/utils/input_validation.dart';
import 'package:aurorafiles/utils/show_snack.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class AuthAndroid extends StatefulWidget {
  static final _authFormKey = GlobalKey<FormState>();

  @override
  _AuthAndroidState createState() => _AuthAndroidState();
}

class _AuthAndroidState extends State<AuthAndroid> {
  AuthState _authState = AppStore.authState;
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _authState.isLoggingIn = false;
    _authState.hostCtrl.text = _authState.hostName;
    _authState.emailCtrl.text = _authState.userEmail;
  }


  @override
  void dispose() {
    super.dispose();
    _authState.passwordCtrl.text = "";
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  List<Widget> _buildTextFields() {
    if (Platform.isIOS) {
      return [
        CupertinoTextField(
          cursorColor: Theme.of(context).accentColor,
          controller: _authState.hostCtrl,
          keyboardType: TextInputType.url,
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.white38))),
//          validator: (value) => validateInput(value,
//              [ValidationTypes.empty, ValidationTypes.email]),
          placeholder: "Host",
          autocorrect: false,
          prefix: Opacity(
            opacity: 0.6,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 12.0, 8.0, 12.0),
              child: Icon(MdiIcons.web),
            ),
          ),
        ),
        SizedBox(height: 20),
        CupertinoTextField(
          cursorColor: Theme.of(context).accentColor,
          controller: _authState.emailCtrl,
          keyboardType: TextInputType.emailAddress,
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.white38))),
//          validator: (value) => validateInput(value,
//              [ValidationTypes.empty, ValidationTypes.email]),
          placeholder: "Email",
          autocorrect: false,
          prefix: Opacity(
            opacity: 0.6,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 12.0, 8.0, 12.0),
              child: Icon(Icons.email),
            ),
          ),
        ),
        SizedBox(height: 20),
        CupertinoTextField(
          cursorColor: Theme.of(context).accentColor,
          controller: _authState.passwordCtrl,
//          validator: (value) =>
//              validateInput(value, [ValidationTypes.empty]),
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.white38))),
          placeholder: "Password",
          obscureText: true,
          autocorrect: false,
          prefix: Opacity(
            opacity: 0.6,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 12.0, 8.0, 12.0),
              child: Icon(
                Icons.lock,
              ),
            ),
          ),
        ),
      ];
    } else {
      return [
        TextFormField(
          cursorColor: Theme.of(context).accentColor,
          controller: _authState.hostCtrl,
          keyboardType: TextInputType.url,
          validator: (value) => validateInput(value, [ValidationTypes.empty]),
          decoration: InputDecoration(
            labelText: "Host",
          ),
        ),
        SizedBox(height: 20),
        TextFormField(
          cursorColor: Theme.of(context).accentColor,
          controller: _authState.emailCtrl,
          keyboardType: TextInputType.emailAddress,
          validator: (value) => validateInput(
              value, [ValidationTypes.empty, ValidationTypes.email]),
          decoration: InputDecoration(
            labelText: "Email",
          ),
        ),
        SizedBox(height: 20),
        TextFormField(
          cursorColor: Theme.of(context).accentColor,
          controller: _authState.passwordCtrl,
          validator: (value) => validateInput(value, [ValidationTypes.empty]),
          obscureText: _obscureText,
          decoration: InputDecoration(
            labelText: "Password",
            suffixIcon: GestureDetector(
              child:
                  Icon(_obscureText ? Icons.visibility : Icons.visibility_off, color: Colors.white70,),
              onTap: () => setState(() => _obscureText = !_obscureText),
            ),
          ),
        ),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Provider(
      builder: (_) => _authState,
      child: Theme(
        data: AppMaterialTheme.darkTheme,
        child: Scaffold(
          body: MainGradient(
            child: SizedBox(
              height: mq.size.height - mq.viewInsets.bottom,
              width: mq.size.width,
              child: Center(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 22.0),
                  child: Form(
                    key: AuthAndroid._authFormKey,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32.0),
                          child: Image.asset(
                              "lib/assets/images/private-mail-logo.png"),
                        ),
                        SizedBox(height: 70.0),
                        ..._buildTextFields(),
                        SizedBox(height: 50.0),
                        SizedBox(
                          width: double.infinity,
                          child: Observer(
                            builder: (BuildContext context) => AppButton(
                              text: "Login",
                              buttonColor: Theme.of(context).accentColor,
                              textColor: Colors.white,
                              isLoading: _authState.isLoggingIn,
                              onPressed: () => _authState.onLogin(
                                isFormValid: AuthAndroid._authFormKey.currentState
                                    .validate(),
                                onSuccess: () async {
                                  await AppStore.settingsState
                                      .getUserEncryptionKeys();
                                  Navigator.pushReplacementNamed(
                                      context, FilesRoute.name,
                                      arguments: FilesScreenArguments(path: ""));
                                },
                                onError: (String err) => showSnack(
                                  context: context,
                                  scaffoldState: Scaffold.of(context),
                                  msg: err,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
