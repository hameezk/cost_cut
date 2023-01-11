
import 'package:cost_cut/config/colors.dart';
import 'package:flutter/material.dart';

showCustomSnackbar({context,content,Function()? onTap}){
  ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: kMediumBlack,
          duration: const Duration(seconds: 2),
          content: GestureDetector(
            onTap: onTap,
            child: Text(
              content,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: kOffWhite),
            ),
          ),
        ),
      );
}