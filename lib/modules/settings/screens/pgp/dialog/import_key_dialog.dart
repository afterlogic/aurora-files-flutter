import 'package:aurorafiles/build_property.dart';
import 'package:aurorafiles/database/app_database.dart';
import 'package:aurorafiles/generated/s_of_context.dart';
import 'package:aurorafiles/modules/settings/screens/pgp/component/key_item.dart';
import 'package:aurorafiles/modules/settings/screens/pgp/pgp_setting_presenter.dart';
import 'package:aurorafiles/override_platform.dart';
import 'package:aurorafiles/shared_ui/sized_dialog_content.dart';

import 'package:flutter/material.dart';

class ImportKeyDialog extends StatefulWidget {
  final Map<LocalPgpKey, bool> contactKeys;
  final Map<LocalPgpKey, bool> userKeys;
  final PgpSettingPresenter presenter;

  const ImportKeyDialog(
    this.userKeys,
    this.contactKeys,
    this.presenter,
  );

  @override
  _ImportKeyDialogState createState() => _ImportKeyDialogState();
}

class _ImportKeyDialogState extends State<ImportKeyDialog> {
  final List<LocalPgpKey> userKeys = [];
  final List<LocalPgpKey> contactKeys = [];
  bool keyAlreadyExist = false;
  bool isProgress = false;

  @override
  void initState() {
    super.initState();
    widget.userKeys.forEach((key, value) {
      userKeys.add(key);
      if (value == null) {
        keyAlreadyExist = true;
      }
    });
    widget.contactKeys.forEach((key, value) {
      contactKeys.add(key);

      if (value == null) {
        keyAlreadyExist = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final s = Str.of(context);
    return AlertDialog(
      title: Text(s.label_pgp_import_key),
      content: SizedDialogContent(
        child: ListView(
          children: <Widget>[
            if (keyAlreadyExist)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(s.hint_pgp_already_have_keys),
              ),
            if (userKeys.isNotEmpty && !BuildProperty.legacyPgpKey)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(s.hint_pgp_your_keys),
              ),
            Column(
              children: userKeys.map((key) {
                return KeyItem(key, widget.userKeys[key], (select) {
                  widget.userKeys[key] = select;
                  setState(() {});
                });
              }).toList(),
            ),
            if (!BuildProperty.legacyPgpKey) ...[
              if (contactKeys.isNotEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text(s.hint_pgp_keys_will_be_import_to_contacts),
                ),
              Column(
                children: contactKeys.map((key) {
                  return KeyItem(key, widget.contactKeys[key], (select) {
                    widget.contactKeys[key] = select;
                    setState(() {});
                  });
                }).toList(),
              ),
            ],
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(s.cancel),
          onPressed: () => Navigator.pop(context),
        ),
        FlatButton(
          child: !isProgress
              ? Text(s.btn_pgp_import_selected_key)
              : CircularProgressIndicator(),
          onPressed: !isProgress ? _import : null,
        ),
      ],
    );
  }

  _import() async {
    final userKey = <LocalPgpKey>[];
    final contactKey = <LocalPgpKey>[];
    widget.userKeys.forEach((key, value) {
      if (value) {
        userKey.add(key);
      }
    });
    widget.contactKeys.forEach((key, value) {
      if (value) {
        contactKey.add(key);
      }
    });
    try {
      isProgress = true;
      setState(() {});
      await widget.presenter.saveKeys(
        userKey,
        contactKey,
      );
      Navigator.pop(context);
    } catch (e) {
      print(e);
    }
    isProgress = false;
    setState(() {});
  }
}
class CheckAnalog extends StatelessWidget {
  final bool isCheck;
  final Function(bool) onChange;

  const CheckAnalog(this.isCheck, this.onChange);

  @override
  Widget build(BuildContext context) {
    return PlatformOverride.isIOS
        ? GestureDetector(
      onTap: () => onChange(!isCheck),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Icon(
          isCheck ? Icons.check_box : Icons.check_box_outline_blank,
          color: onChange == null ? Colors.grey : null,
        ),
      ),
    )
        : Checkbox(
      value: isCheck,
      onChanged: onChange,
    );
  }
}
