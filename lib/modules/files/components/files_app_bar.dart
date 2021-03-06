import 'package:aurora_ui_kit/aurora_ui_kit.dart';
import 'package:aurorafiles/build_property.dart';
import 'package:aurorafiles/generated/s_of_context.dart';
import 'package:aurorafiles/models/storage.dart';
import 'package:aurorafiles/modules/files/dialogs/add_folder_dialog.dart';
import 'package:aurorafiles/modules/files/state/files_page_state.dart';
import 'package:aurorafiles/modules/files/state/files_state.dart';
import 'package:aurorafiles/override_platform.dart';
import 'package:aurorafiles/shared_ui/layout_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../files_route.dart';

class FilesAppBar extends StatefulWidget {
  final Function(BuildContext) onDeleteFiles;
  final bool isAppBar;

  FilesAppBar({
    Key key,
    @required this.onDeleteFiles,
    this.isAppBar = true,
  }) : super(key: key);

  @override
  _FilesAppBarState createState() => _FilesAppBarState();
}

class _FilesAppBarState extends State<FilesAppBar>
    with TickerProviderStateMixin {
  FilesState _filesState;
  S s;
  FilesPageState _filesPageState;
  AnimationController _appBarIconAnimCtrl;
  final _searchInputCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _appBarIconAnimCtrl = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _appBarIconAnimCtrl.dispose();
  }

  String _getFolderName() {
    String fullPath = _filesPageState.pagePath;
    if (fullPath.endsWith("/")) {
      fullPath = fullPath.substring(0, fullPath.length - 1);
    }
    final splitPath = fullPath.split(RegExp(r"/|\$ZIP:"));
    return splitPath.last.isNotEmpty ? splitPath.last : BuildProperty.appName;
  }

  void _search() {
    FocusScope.of(context).requestFocus(new FocusNode());
    _filesPageState.onGetFiles(
      searchPattern: _searchInputCtrl.text,
    );
  }

  AMAppBar _getAppBar(BuildContext context) {
    final isTablet = LayoutConfig.of(context).isTablet;
    if (widget.isAppBar && isTablet) {
      return AMAppBar(
        key: Key("default"),
        leading: _filesPageState.pagePath.length > 0
            ? IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: Navigator.of(context).pop,
              )
            : null,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PopupMenuButton<String>(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: PlatformOverride.isIOS
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.start,
                  children: <Widget>[
                    Text(_getFolderName()),
                    if (_filesPageState.pagePath.isNotEmpty)
                      Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
              enabled: _filesPageState.pagePath.isNotEmpty,
              onSelected: (String folder) {
                Navigator.popUntil(
                  context,
                  ModalRoute.withName(FilesRoute.name + folder),
                );
              },
              itemBuilder: (BuildContext context) {
                return <PopupMenuEntry<String>>[
                  ..._filesState.folderNavStack.map((String path) {
                    if (_filesState.folderNavStack.indexOf(path) ==
                        _filesState.folderNavStack.length - 1) {
                      return null;
                    } else if (path.isNotEmpty && (path.endsWith(".zip"))) {
                      return PopupMenuItem<String>(
                        value: path,
                        child: ListTile(
                          leading: Icon(MdiIcons.zipBoxOutline),
                          title: Text(
                            path.split("/").last,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      );
                    } else if (path.isNotEmpty) {
                      return PopupMenuItem<String>(
                        value: path,
                        child: ListTile(
                          leading: Icon(Icons.folder),
                          title: Text(
                            path.split("/").last,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      );
                    } else {
                      return PopupMenuItem<String>(
                        value: "",
                        child: ListTile(
                          leading: Icon(Icons.storage),
                          title: Text(_filesState.selectedStorage.displayName),
                        ),
                      );
                    }
                  }),
                ];
              },
            ),
            if (_filesState.selectedStorage.displayName.length > 0)
              SizedBox(height: 2),
            if (_filesState.selectedStorage.displayName.length > 0)
              Text(
                _filesState.selectedStorage.displayName,
                style: TextStyle(fontSize: 10.0),
              )
          ],
        ),
      );
    }

    if (_filesPageState.selectedFilesIds.length > 0) {
      return AMAppBar(
        key: Key("select"),
        backgroundColor:
            widget.isAppBar ? Theme.of(context).primaryColorDark : null,
        leading: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () => _filesPageState.quitSelectMode(),
        ),
        title: Text("Selected: ${_filesPageState.selectedFilesIds.length}"),
        actions: _filesState.isOfflineMode
            ? [
//          IconButton(
//            icon: Icon(Icons.airplanemode_inactive),
//            tooltip: "Delete files from offline",
//            onPressed: () {},
//          ),
              ]
            : [
                IconButton(
                  icon: Icon(MdiIcons.fileMove),
                  tooltip: "Move/Copy files",
                  onPressed: () {
                    _filesState.updateFilesCb = _filesPageState.onGetFiles;
                    _filesState.enableMoveMode(
                      selectedFileIds: _filesPageState.selectedFilesIds,
                      currentFiles: _filesPageState.currentFiles,
                    );
                    _filesPageState.quitSelectMode();
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete_outline),
                  tooltip: "Delete files",
                  onPressed: () => widget.onDeleteFiles(context),
                ),
              ],
      );
    } else if (_filesState.isMoveModeEnabled || _filesState.isShareUpload) {
      if (!widget.isAppBar) {
        return AMAppBar(
          key: Key("move"),
          backgroundColor: Theme.of(context).accentColor,
          leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: _filesState.isMoveModeEnabled
                ? _filesState.disableMoveMode
                : _filesState.disableUploadShared,
          ),
          title: Text(_filesState.isMoveModeEnabled
              ? s.move_file_or_folder
              : _filesState.filesToShareUpload.length > 1
                  ? s.upload_files(
                      _filesState.filesToShareUpload.length.toString())
                  : s.upload_file),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.create_new_folder),
              tooltip: s.add_folder,
              onPressed: () => AMDialog.show(
                context: context,
                builder: (_) => AddFolderDialogAndroid(
                  filesState: _filesState,
                  filesPageState: _filesPageState,
                ),
              ),
            ),
          ],
        );
      }
      return AMAppBar(
        key: Key("move"),
        backgroundColor: Theme.of(context).accentColor,
        leading: _filesPageState.pagePath.length > 0
            ? IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: Navigator.of(context).pop,
              )
            : IconButton(
                icon: Icon(Icons.close),
                onPressed: _filesState.isMoveModeEnabled
                    ? _filesState.disableMoveMode
                    : _filesState.disableUploadShared,
              ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_filesState.isMoveModeEnabled
                ? s.move_file_or_folder
                : _filesState.filesToShareUpload.length > 1
                    ? s.upload_files(
                        _filesState.filesToShareUpload.length.toString())
                    : s.upload_file),
            SizedBox(height: 2),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                _filesState.selectedStorage.displayName +
                    _filesPageState.pagePath,
                style: TextStyle(fontSize: 10.0),
              ),
            )
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.create_new_folder),
            tooltip: s.add_folder,
            onPressed: () => AMDialog.show(
              context: context,
              builder: (_) => AddFolderDialogAndroid(
                filesState: _filesState,
                filesPageState: _filesPageState,
              ),
            ),
          ),
          if (_filesState.currentStorages.length > 1)
            PopupMenuButton<Storage>(
              icon: Icon(Icons.storage),
              onSelected: (Storage storage) async {
                Navigator.of(context).popUntil((Route<dynamic> route) {
                  return route.isFirst;
                });
                // set new storage and reload files
                _filesState.selectedStorage = storage;
                Navigator.of(context).pushReplacementNamed(
                  FilesRoute.name,
                  arguments: FilesScreenArguments(
                    path: "",
                  ),
                );
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<Storage>>[
                ..._filesState.currentStorages.map((Storage storage) {
                  bool enable = true;
                  if (_filesState.isMoveModeEnabled ||
                      _filesState.isShareUpload) {
                    if (storage.type == "shared") {
                      enable = false;
                    }
                  }
                  if (_filesState.isMoveModeEnabled) {
                    final copyFromEncrypted =
                        _filesState.filesToMoveCopy.first.type == "encrypted";
                    if (copyFromEncrypted) {
                      if (storage.type != "encrypted") {
                        enable = false;
                      }
                    } else {
                      if (storage.type == "encrypted") {
                        enable = false;
                      }
                    }
                  }
                  if (enable) {
                    return PopupMenuItem<Storage>(
                      enabled: storage.type != _filesState.selectedStorage.type,
                      value: storage,
                      child: ListTile(
                        leading: Icon(Icons.storage),
                        title: Text(storage.displayName),
                      ),
                    );
                  } else {
                    return null;
                  }
                }),
              ],
            )
        ],
      );
    } else if (_filesPageState.isSearchMode) {
      if (!widget.isAppBar) {
        return AMAppBar(
          leading: IconButton(
            icon: Icon(Icons.search),
            onPressed: _search,
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _searchInputCtrl.text = "";
                _filesPageState.isSearchMode = false;
                _filesPageState.onGetFiles(
                  showLoading: FilesLoadingType.filesHidden,
                );
              },
            ),
          ],
          title: PlatformOverride.isIOS
              ? CupertinoTextField(
                  onSubmitted: (_) => _search(),
                  autofocus: true,
                  controller: _searchInputCtrl,
                  placeholder: s.search,
                  suffix: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      _searchInputCtrl.text = "";
                      _filesPageState.isSearchMode = false;
                      _filesPageState.onGetFiles(
                        showLoading: FilesLoadingType.filesHidden,
                      );
                    },
                  ),
                )
              : TextField(
                  autofocus: true,
                  onSubmitted: (_) => _search(),
                  style: TextStyle(color: Colors.black),
                  controller: _searchInputCtrl,
                  decoration: InputDecoration.collapsed(
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.black38),
                    hintText: s.search,
                  ),
                ),
        );
      }
      return AMAppBar(
        key: Key("search"),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            _searchInputCtrl.text = "";
            _filesPageState.isSearchMode = false;
            _filesPageState.onGetFiles(
              showLoading: FilesLoadingType.filesHidden,
            );
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(s.search),
            if (_filesState.selectedStorage.displayName.length > 0)
              SizedBox(height: 2),
            if (_filesState.selectedStorage.displayName.length > 0)
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  _filesState.selectedStorage.displayName +
                      _filesPageState.pagePath,
                  style: TextStyle(fontSize: 10.0),
                ),
              )
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Container(
            padding: const EdgeInsets.all(12.0),
            child: PlatformOverride.isIOS
                ? CupertinoTextField(
                    onSubmitted: (_) => _search(),
                    autofocus: true,
                    controller: _searchInputCtrl,
                    placeholder: s.search,
                    suffix: IconButton(
                        icon: Icon(Icons.search),
                        color: Colors.white,
                        onPressed: _search),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Container(
                      color: Colors.white54,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0, top: 2.0),
                        child: TextField(
                          autofocus: true,
                          onSubmitted: (_) => _search(),
                          style: TextStyle(color: Colors.black),
                          controller: _searchInputCtrl,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.black38),
                              hintText: s.search,
                              suffixIcon: IconButton(
                                icon: Icon(Icons.search),
                                color: Colors.black,
                                onPressed: _search,
                              )),
                        ),
                      ),
                    ),
                  ),
          ),
        ),
      );
    } else {
      if (!widget.isAppBar) {
        return AMAppBar(
          key: Key("default"),
          leading: IconButton(
            icon: Icon(Icons.search),
            tooltip: s.search,
            onPressed: () => _filesPageState.isSearchMode = true,
          ),
        );
      }
      return AMAppBar(
        key: Key("default"),
        leading: !widget.isAppBar
            ? SizedBox.shrink()
            : (_filesPageState.pagePath.length > 0
                ? IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: Navigator.of(context).pop,
                  )
                : null),
        title: !widget.isAppBar
            ? null
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  PopupMenuButton<String>(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: PlatformOverride.isIOS
                            ? MainAxisAlignment.center
                            : MainAxisAlignment.start,
                        children: <Widget>[
                          Text(_getFolderName()),
                          if (_filesPageState.pagePath.isNotEmpty)
                            Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                    enabled: _filesPageState.pagePath.isNotEmpty,
                    onSelected: (String folder) {
                      Navigator.popUntil(
                        context,
                        ModalRoute.withName(FilesRoute.name + folder),
                      );
                    },
                    itemBuilder: (BuildContext context) {
                      return <PopupMenuEntry<String>>[
                        ..._filesState.folderNavStack.map((String path) {
                          if (_filesState.folderNavStack.indexOf(path) ==
                              _filesState.folderNavStack.length - 1) {
                            return null;
                          } else if (path.isNotEmpty &&
                              (path.endsWith(".zip"))) {
                            return PopupMenuItem<String>(
                              value: path,
                              child: ListTile(
                                leading: Icon(MdiIcons.zipBoxOutline),
                                title: Text(
                                  path.split("/").last,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            );
                          } else if (path.isNotEmpty) {
                            return PopupMenuItem<String>(
                              value: path,
                              child: ListTile(
                                leading: Icon(Icons.folder),
                                title: Text(
                                  path.split("/").last,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            );
                          } else {
                            return PopupMenuItem<String>(
                              value: "",
                              child: ListTile(
                                leading: Icon(Icons.storage),
                                title: Text(
                                    _filesState.selectedStorage.displayName),
                              ),
                            );
                          }
                        }),
                      ];
                    },
                  ),
                  if (_filesState.selectedStorage.displayName.length > 0)
                    SizedBox(height: 2),
                  if (_filesState.selectedStorage.displayName.length > 0)
                    Text(
                      _filesState.selectedStorage.displayName,
                      style: TextStyle(fontSize: 10.0),
                    )
                ],
              ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: s.search,
            onPressed: () => _filesPageState.isSearchMode = true,
          ),
//          IconButton(
//            icon: Icon(Icons.menu),
//            tooltip: "Menu",
//            onPressed: _filesPageState.scaffoldKey.currentState.openDrawer,
//          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    _filesState = Provider.of<FilesState>(context);
    _filesPageState = Provider.of<FilesPageState>(context);
    s = Str.of(context);
    return Observer(
      builder: (_) {
        final appBar = _getAppBar(context);
        if (widget.isAppBar) {
          return appBar;
        } else {
          return ListTile(
            leading: appBar.leading,
            title: appBar.title,
            trailing: appBar.actions == null
                ? null
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: appBar.actions,
                  ),
          );
        }
      },
    );
  }
}
