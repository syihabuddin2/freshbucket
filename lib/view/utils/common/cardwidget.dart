import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  MainAxisSize mainAxisSize;
  IconData? icons;
  double? iconSize;
  String? title;
  Widget? subtitle;

  CardWidget({
    Key? key,
    required this.mainAxisSize,
    this.icons,
    this.iconSize,
    this.title,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: mainAxisSize,
        children: <Widget>[
          ListTile(
            leading: Icon(icons, size: iconSize),
            title: Text('$title'),
            subtitle: subtitle,
          ),
        ],
      ),
    );
  }
}
