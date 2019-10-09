import 'dart:io';

import 'package:aurorafiles/database/app_database.dart';
import 'package:aurorafiles/modules/app_store.dart';
import 'package:aurorafiles/modules/auth/state/auth_state.dart';
import 'package:aurorafiles/modules/files/components/public_link_switch.dart';
import 'package:aurorafiles/modules/files/dialogs/delete_confirmation_dialog.dart';
import 'package:aurorafiles/modules/files/dialogs/rename_dialog_android.dart';
import 'package:aurorafiles/modules/files/dialogs/share_dialog.dart';
import 'package:aurorafiles/modules/files/screens/file_viewer/components/pdf_viewer.dart';
import 'package:aurorafiles/modules/files/state/file_viewer_state.dart';
import 'package:aurorafiles/modules/files/state/files_page_state.dart';
import 'package:aurorafiles/modules/files/state/files_state.dart';
import 'package:aurorafiles/utils/date_formatting.dart';
import 'package:aurorafiles/utils/file_content_type.dart';
import 'package:aurorafiles/utils/show_snack.dart';
import 'package:filesize/filesize.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'components/image_viewer.dart';
import 'components/info_list_tile.dart';
import 'components/text_viewer.dart';

class FileViewerAndroid extends StatefulWidget {
  final LocalFile immutableFile;
  final FilesState filesState;
  final FilesPageState filesPageState;

  FileViewerAndroid({
    Key key,
    @required this.immutableFile,
    @required this.filesState,
    @required this.filesPageState,
  }) : super(key: key);

  @override
  _FileViewerAndroidState createState() => _FileViewerAndroidState();
}

class _FileViewerAndroidState extends State<FileViewerAndroid> {
  final GlobalKey<ScaffoldState> _fileViewerScaffoldKey =
      GlobalKey<ScaffoldState>();

  final _fileViewerState = FileViewerState();

  LocalFile _file;
  FileType _fileType;

  bool _isFileOffline = false;
  bool _isSyncingForOffline = false;

  @override
  void initState() {
    super.initState();
    _file = widget.immutableFile;
    _isFileOffline = _file.localId != null;
    _fileViewerState.file = widget.immutableFile;
    _fileType = getFileType(_file);
  }

  @override
  void dispose() {
    super.dispose();
    widget.filesState.clearFilesToDeleteAndStopDownload();
    _fileViewerState.dispose();
  }

  void _updateFile(String fileId) {
    widget.filesPageState.currentFiles.forEach((updatedFile) {
      if (updatedFile.id == fileId) {
        _fileViewerState.file = updatedFile;
        setState(() => _file = updatedFile);
      }
    });
  }

  void _moveFile() {
    widget.filesState.updateFilesCb = widget.filesPageState.onGetFiles;
    widget.filesState.enableMoveMode(filesToMove: [_file]);
    Navigator.pop(context);
  }

  void _shareFile() {
    if (_fileViewerState.fileWithContents != null) {
      widget.filesState
          .onShareFile(_file, storedFile: _fileViewerState.fileWithContents);
    } else if (_fileViewerState.downloadProgress != null) {
      showSnack(
        context: context,
        scaffoldState: _fileViewerScaffoldKey.currentState,
        msg: "Please wait until the file finishes loading",
        isError: false,
      );
    } else {
      Platform.isIOS
          ? showCupertinoDialog(
              context: context,
              builder: (_) => ShareDialog(
                    filesState: widget.filesState,
                    file: _file,
                  ))
          : showDialog(
              context: context,
              builder: (_) => ShareDialog(
                    filesState: widget.filesState,
                    file: _file,
                  ));
    }
  }

  void _renameFile() async {
    final result = Platform.isIOS
        ? await showCupertinoDialog(
            context: context,
            builder: (_) => RenameDialog(
              file: _file,
              filesState: widget.filesState,
              filesPageState: widget.filesPageState,
            ),
          )
        : await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => RenameDialog(
              file: _file,
              filesState: widget.filesState,
              filesPageState: widget.filesPageState,
            ),
          );
    if (result is String) _updateFile(result);
  }

  void _deleteFile() async {
    bool shouldDelete;
    if (Platform.isIOS) {
      shouldDelete = await showCupertinoDialog(
          context: context,
          builder: (_) => DeleteConfirmationDialog(
                itemsNumber: 1,
                isFolder: false,
              ));
    } else {
      shouldDelete = await showDialog(
          context: context,
          builder: (_) => DeleteConfirmationDialog(
                itemsNumber: 1,
                isFolder: false,
              ));
    }
    if (shouldDelete != null && shouldDelete) {
      widget.filesPageState.onDeleteFiles(
        filesToDelete: [_file],
        storage: widget.filesState.selectedStorage,
        onSuccess: () {
          widget.filesPageState.onGetFiles();
        },
        onError: (String err) {
          widget.filesPageState.filesLoading = FilesLoadingType.none;
          showSnack(
            context: context,
            scaffoldState: _fileViewerScaffoldKey.currentState,
            msg: err,
          );
        },
      );
      widget.filesPageState.filesLoading = FilesLoadingType.filesVisible;
      Navigator.pop(context);
    }
  }

  void _downloadFile() {
    widget.filesState.onDownloadFile(
      file: _file,
      onStart: () => showSnack(
        context: context,
        scaffoldState: _fileViewerScaffoldKey.currentState,
        msg: "Downloading ${_file.name}",
        isError: false,
      ),
      onSuccess: (File savedFile) => showSnack(
          context: context,
          scaffoldState: _fileViewerScaffoldKey.currentState,
          msg: "${_file.name} downloaded successfully into: ${savedFile.path}",
          isError: false,
          duration: Duration(minutes: 10),
          action: SnackBarAction(
            label: "OK",
            onPressed: _fileViewerScaffoldKey.currentState.hideCurrentSnackBar,
          )),
      onError: (String err) => showSnack(
        context: context,
        scaffoldState: _fileViewerScaffoldKey.currentState,
        msg: err,
      ),
    );
  }

  Future _setFileForOffline() async {
    if (widget.filesState.isOfflineMode) {
      widget.filesState.onSetFileOffline(_file, onSuccess: () async {
        await widget.filesPageState.onGetFiles();
        Navigator.pop(context);
      });
    } else {
      try {
        setState(() {
          _isSyncingForOffline = true;
          _isFileOffline = !_isFileOffline;
        });
        if (_file.localId == null) {
          showSnack(
            context: context,
            scaffoldState: _fileViewerScaffoldKey.currentState,
            msg: "Synching file...",
            isError: false,
          );
        }
        await widget.filesState.onSetFileOffline(_file, onSuccess: () async {
          if (_file.localId == null) {
            showSnack(
              context: context,
              scaffoldState: _fileViewerScaffoldKey.currentState,
              msg: "File synched successfully",
              isError: false,
            );
          }
          await widget.filesPageState.onGetFiles();
          _updateFile(_file.id);
          setState(() => _isSyncingForOffline = false);
        });
      } catch (err) {
        setState(() {
          _isSyncingForOffline = false;
          _isFileOffline = !_isFileOffline;
        });
        showSnack(
          context: context,
          scaffoldState: _fileViewerScaffoldKey.currentState,
          msg: err.toString(),
        );
      }
    }
  }

  Widget _getPreviewContent() {
    final previewIconSize = 120.0;
    if (_file.initVector != null) {
      return Icon(Icons.lock_outline,
          size: previewIconSize, color: Theme.of(context).disabledColor);
    }
    switch (_fileType) {
      case FileType.image:
        return ImageViewer(
          fileViewerState: _fileViewerState,
          scaffoldState: _fileViewerScaffoldKey.currentState,
        );
      case FileType.text:
      case FileType.code:
        return TextViewer(
          fileViewerState: _fileViewerState,
          scaffoldState: _fileViewerScaffoldKey.currentState,
        );
      case FileType.pdf:
        return PdfViewer(
          file: _file,
          scaffoldState: _fileViewerScaffoldKey.currentState,
        );
      case FileType.zip:
        return Icon(MdiIcons.zipBoxOutline,
            size: previewIconSize, color: Theme.of(context).disabledColor);

      case FileType.unknown:
        return Icon(MdiIcons.fileOutline,
            size: previewIconSize, color: Theme.of(context).disabledColor);
      default:
        return Icon(MdiIcons.fileOutline,
            size: previewIconSize, color: Theme.of(context).disabledColor);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FilesState>(
          builder: (_) => widget.filesState,
        ),
        Provider<FilesPageState>(
          builder: (_) => widget.filesPageState,
        ),
        Provider<AuthState>(
          builder: (_) => AppStore.authState,
        ),
      ],
      child: Scaffold(
        key: _fileViewerScaffoldKey,
        appBar: AppBar(
          actions: widget.filesState.isOfflineMode
              ? [
                  IconButton(
                    icon: Icon(Icons.airplanemode_inactive),
                    tooltip: "Delete file from offline",
                    onPressed: _setFileForOffline,
                  ),
                ]
              : [
                  IconButton(
                    icon: Icon(MdiIcons.fileMove),
                    tooltip: "Move/Copy",
                    onPressed: _moveFile,
                  ),
                  IconButton(
                    icon: Icon(
                        Platform.isIOS ? MdiIcons.exportVariant : Icons.share),
                    tooltip: "Share",
                    onPressed: _shareFile,
                  ),
                  if (_file.downloadUrl != null && !Platform.isIOS)
                    IconButton(
                      icon: Icon(Icons.file_download),
                      tooltip: "Download",
                      onPressed: _downloadFile,
                    ),
                  IconButton(
                    icon: Icon(Icons.edit),
                    tooltip: "Rename",
                    onPressed: _renameFile,
                  ),
                  IconButton(
                    icon: Icon(Icons.delete_outline),
                    tooltip: "Delete file",
                    onPressed: _deleteFile,
                  ),
                ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: _getPreviewContent(),
            ),
            InfoListTile(
              label: "Filename",
              content: _file.name,
              isPublic: _file.published,
              isOffline: _file.localId != null,
              isEncrypted: _file.initVector != null,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: InfoListTile(
                      label: "Size", content: filesize(_file.size)),
                ),
                SizedBox(width: 30),
                Expanded(
                  child: InfoListTile(
                    label: "Created",
                    content: DateFormatting.formatDateFromSeconds(
                      timestamp: _file.lastModified,
                    ),
                  ),
                ),
              ],
            ),
            InfoListTile(
                label: "Location",
                content: _file.path == "" ? "/" : _file.path),
            InfoListTile(label: "Owner", content: _file.owner),
            if (!widget.filesState.isOfflineMode)
              PublicLinkSwitch(
                file: _file,
                isFileViewer: true,
                updateFile: _updateFile,
                scaffoldKey: _fileViewerScaffoldKey,
              ),
            if (!widget.filesState.isOfflineMode) Divider(),
            ListTile(
              contentPadding: EdgeInsets.zero,
              onTap: _isSyncingForOffline ? null : _setFileForOffline,
              leading: Icon(Icons.airplanemode_active),
              title: Text("Offline"),
              trailing: Switch.adaptive(
                value: _isFileOffline,
                activeColor: Theme.of(context).accentColor,
                onChanged: _isSyncingForOffline
                    ? null
                    : (bool val) => _setFileForOffline(),
              ),
            ),
            SizedBox(
              height: 16.0 + MediaQuery.of(context).padding.bottom,
            )
          ],
        ),
      ),
    );
  }
}
