
import 'package:cost_cut/widgets/back_button.dart';
import 'package:cost_cut/widgets/top_space.dart';
import 'package:flutter/material.dart';

import '../config/colors.dart';

class TopWidget extends StatelessWidget {
  final String title;
  final bool? whiteTitle;
  final bool? login;
  const TopWidget({Key? key, required this.title, this.whiteTitle, this.login})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, left: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopSpace(space: size.height * 0.20),
          (login != true)
              ? Row(
                  children: [
                    MyBackButton(
                      color: (whiteTitle ?? false) ? kOffWhite : Colors.black,
                    )
                  ],
                )
              : Container(
                  height: 50,
                ),
          SizedBox(
            width: size.width * 0.55,
            child: Text(
              title,
              style: (whiteTitle ?? false)
                  ? Theme.of(context).textTheme.headline2!.copyWith(
                        color: kOffWhite,
                        fontWeight: FontWeight.w600,
                      )
                  : Theme.of(context).textTheme.headline2,
            ),
          ),
        ],
      ),
    );
  }
}
