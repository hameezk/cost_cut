import 'package:flutter/material.dart';

import '../config/colors.dart';
import '../models/user_model.dart';

class MemberCard extends StatelessWidget {
  const MemberCard({
    Key? key,
    required this.size,
    required this.userModel,
  }) : super(key: key);

  final Size size;
  final UserModel? userModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.width * 0.5,
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: kOrangeColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              spreadRadius: 1,
              color: kDarkBlack,
              blurRadius: 1,
              offset: Offset.fromDirection(1)),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            left: 15,
            top: 15,
            child: SizedBox(
              height: size.width * 0.18,
              child: Image.asset('assets/images/logo.png'),
            ),
          ),
          Positioned(
            right: 15,
            top: 15,
            child: SizedBox(
              height: size.width * 0.18,
              child: Image.asset('assets/images/qr.jpg'),
            ),
          ),
          Positioned(
            child: Center(
              heightFactor: 2.25,
              child: SizedBox(
                height: size.width * 0.18,
                child: Image.asset('assets/images/cosscut.png'),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            // left: 15,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width: size.width * 0.56,
                          child: Text(
                            userModel!.name ?? '',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: kDarkWhite,
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.50,
                          child: const FittedBox(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                '5555 5555 5555 5555',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: kDarkWhite,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: size.width * 0.28,
                      child: Column(
                        children: const [
                          FittedBox(
                            child: Text(
                              'Expires on:',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: kDarkWhite,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                          FittedBox(
                            child: Text(
                              'Valid from:',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: kDarkWhite,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
