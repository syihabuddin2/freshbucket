import 'package:flutter/material.dart';
import 'package:freshbucket/view/utils/constant.dart';

class TopBarWidget extends StatelessWidget implements PreferredSizeWidget {
  Color? theme;
  IconData? icon;
  double? iconHeight;
  String? title;
  void Function()? onTap;

  TopBarWidget({
    Key? key,
    this.theme,
    this.icon,
    this.iconHeight,
    this.title,
    this.onTap,
  }) : super(key: key);

  late Size size;

  @override
  Size get preferredSize {
    size = const Size.fromHeight(50.0);
    return size;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: theme,
      elevation: 0.0,
      centerTitle: false,
      title: SizedBox(
        height: size.height * 0.40,
        child: FittedBox(
          child: Text(
            title!,
            style: TextStyle(
              color: bgColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
