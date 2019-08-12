import 'package:aurorafiles/screens/file_viewer/file_viewer_route.dart';
import 'package:aurorafiles/store/app_state.dart';
import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'files_item_tile.dart';

class FileWidget extends StatelessWidget {
  final file;

  const FileWidget({Key key, @required this.file}) : super(key: key);

  Widget _getThumbnail(BuildContext context) {
    if (file["ThumbnailUrl"] != null) {
      return Hero(
        tag: file["Id"],
        child: SizedBox(
          width: 48.0,
          child: Image.network(
            '${SingletonStore.instance.hostName}/${file["ThumbnailUrl"]}',
            headers: {
              'Authorization': 'Bearer ${SingletonStore.instance.authToken}'
            },
            fit: BoxFit.cover,
          ),
        ),
      );
    } else {
      return Icon(Icons.description, size: 48.0, color: Colors.grey[700]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        FileViewerRoute.name,
        arguments: FileViewerScreenArguments(file: file),
      ),
      child: FilesItemTile(
        child: ListTile(
          leading: _getThumbnail(context),
          title: Text(file["Name"]),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(filesize(file["Size"])),
              SizedBox(height: 4.0),
              Text(DateFormat("dd MMM yyyy").format(
                  DateTime.fromMillisecondsSinceEpoch(
                      (file["LastModified"] * 1000))))
            ],
          ),
        ),
      ),
    );
  }
}
