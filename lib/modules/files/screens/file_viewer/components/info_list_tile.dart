import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class InfoListTile extends StatefulWidget {
  final String label;
  final String content;
  final bool isOffline;
  final bool isPublic;
  final bool isEncrypted;

  const InfoListTile({
    Key key,
    @required this.label,
    @required this.content,
    this.isOffline = false,
    this.isPublic = false,
    this.isEncrypted = false,
  }) : super(key: key);

  @override
  _InfoListTileState createState() => _InfoListTileState();
}

class _InfoListTileState extends State<InfoListTile> {
  bool _expanded = false;

  double _rightPaddingForStatusIcons = 0.0;

  Widget _buildStatusIcons() {
    return Theme(
      data: Theme.of(context).copyWith(
        iconTheme: IconThemeData(
          color: Theme.of(context).disabledColor,
          size: 18.0,
        ),
      ),
      child: Row(
        children: <Widget>[
          if (widget.isPublic) SizedBox(width: 10),
          if (widget.isPublic)
            Icon(
              Icons.link,
              semanticLabel: "Has public link",
            ),
          if (widget.isOffline) SizedBox(width: 10),
          if (widget.isOffline)
            Icon(
              Icons.airplanemode_active,
              semanticLabel: "Available offline",
            ),
          if (widget.isEncrypted) SizedBox(width: 10),
          if (widget.isEncrypted)
            Icon(
              MdiIcons.alien,
              semanticLabel: "Encrypted",
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _rightPaddingForStatusIcons = 0.0;
    if (widget.isOffline) _rightPaddingForStatusIcons += 35.0;
    if (widget.isPublic) _rightPaddingForStatusIcons += 35.0;
    if (widget.isEncrypted) _rightPaddingForStatusIcons += 35.0;

    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () => setState(() => _expanded = !_expanded),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(widget.label, style: Theme.of(context).textTheme.caption),
          if (_expanded)
            Row(
              children: <Widget>[
                Flexible(
                  child: Text(
                    widget.content,
                    style: Theme.of(context).textTheme.subhead,
                    maxLines: 20,
                  ),
                ),
                _buildStatusIcons(),
              ],
            ),
          if (!_expanded)
            Stack(
              children: <Widget>[
                SingleChildScrollView(
                  padding: EdgeInsets.only(right: _rightPaddingForStatusIcons),
                  child: Text(
                    widget.content,
                    style: Theme.of(context).textTheme.subhead,
                  ),
                  scrollDirection: _expanded ? Axis.vertical : Axis.horizontal,
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  top: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Colors.white.withOpacity(0.0),
                        Theme.of(context).scaffoldBackgroundColor,
                      ], stops: [
                        0.0,
                        0.2
                      ]),
                    ),
                    child: _buildStatusIcons(),
                  ),
                ),
              ],
            ),
          Divider(
            height: 26.0,
          ),
        ],
      ),
    );
  }
}
