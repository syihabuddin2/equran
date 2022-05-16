import 'package:flutter/material.dart';
import 'package:equran/view/util/contants/color.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  Color? theme;
  String? iconPath;
  double? iconHeight;
  String? title;
  void Function()? onTap;

  TopBar({
    Key? key,
    this.theme,
    this.iconPath,
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
      leading: IconButton(
        icon: Image(
          image: AssetImage(iconPath!),
          height: size.height * iconHeight!,
          //width: 25,
          color: darkPurple,
        ),
        onPressed: onTap,
      ),
      title: SizedBox(
        height: size.height * 0.50,
        child: FittedBox(
          child: Text(
            title!,
            style: const TextStyle(
              color: darkPurple,
              fontWeight: FontWeight.bold,
              fontFamily: 'K2DMedium',
            ),
          ),
        ),
      ),
    );
  }
}
