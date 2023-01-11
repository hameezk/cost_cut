import 'package:flutter/material.dart';

class TopSpace extends StatelessWidget {
  final double space;
  const TopSpace({Key? key, required this.space}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: space,
    );
  }
}
