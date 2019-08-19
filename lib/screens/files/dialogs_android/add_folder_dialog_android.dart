import 'package:aurorafiles/screens/files/state/files_state.dart';
import 'package:aurorafiles/utils/input_validation.dart';
import 'package:flutter/material.dart';

class AddFolderDialogAndroid extends StatefulWidget {
  final FilesState filesState;

  const AddFolderDialogAndroid({
    Key key,
    @required this.filesState,
  }) : super(key: key);

  @override
  _AddFolderDialogAndroidState createState() => _AddFolderDialogAndroidState();
}

class _AddFolderDialogAndroidState extends State<AddFolderDialogAndroid> {
  final _folderNameCtrl = TextEditingController();
  final _addFolderFormKey = GlobalKey<FormState>();

  bool isAdding = false;
  String errMsg = "";

  @override
  void dispose() {
    super.dispose();
    _folderNameCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Add new folder"),
      content: isAdding
          ? Row(
              children: <Widget>[
                CircularProgressIndicator(),
                SizedBox(width: 20.0),
                Text("Adding ${_folderNameCtrl.text} folder")
              ],
            )
          : Form(
              key: _addFolderFormKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  if (errMsg is String && errMsg.length > 0)
                    Text(errMsg,
                        style: TextStyle(color: Theme.of(context).errorColor)),
                  TextFormField(
                    controller: _folderNameCtrl,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: "Enter folder name",
                      border: UnderlineInputBorder(),
                    ),
                    validator: (value) => validateInput(
                      value,
                      [
                        ValidationTypes.empty,
                        ValidationTypes.fileName,
                        ValidationTypes.uniqueName,
                      ],
                      widget.filesState.currentFiles,
                    ),
                  ),
                ],
              ),
            ),
      actions: <Widget>[
        FlatButton(
          child: Text("CANCEL"),
          onPressed: () => Navigator.pop(context),
        ),
        FlatButton(
            child: Text("ADD"),
            onPressed: isAdding
                ? null
                : () {
                    if (!_addFolderFormKey.currentState.validate()) return;
                    errMsg = "";
                    setState(() => isAdding = true);
                    widget.filesState.onCreateNewFolder(
                      folderName: _folderNameCtrl.text,
                      onError: (String err) {
                        errMsg = err;
                        setState(() => isAdding = false);
                      },
                      onSuccess: (String newNameFromServer) async {
                        await widget.filesState
                            .onGetFiles(path: widget.filesState.currentPath);
                        Navigator.pop(context, newNameFromServer);
                      },
                    );
                  }),
      ],
    );
  }
}