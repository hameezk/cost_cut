import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyBackButton extends StatelessWidget {
  final Color color;
  const MyBackButton({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        CupertinoIcons.back,
        size: 28,
        color: color,
      ),
    );
  }
}
