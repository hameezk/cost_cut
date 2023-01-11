
import 'package:cost_cut/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../../widgets/top_space.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  navigate(context) async {
    await Future.delayed(const Duration(seconds: 1));
    Navigator.pushReplacement(
      context,
      PageTransition(
        alignment: Alignment.bottomCenter,
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 600),
        reverseDuration: const Duration(milliseconds: 600),
        type: PageTransitionType.leftToRight,
        child: const LoginPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    navigate(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        child: GestureDetector(
          onPanUpdate: (details) {
            if (details.delta.dx > 20 || details.delta.dy > 20) {
              Navigator.pushReplacement(
                context,
                PageTransition(
                  alignment: Alignment.bottomCenter,
                  curve: Curves.easeInOut,
                  duration: const Duration(milliseconds: 600),
                  reverseDuration: const Duration(milliseconds: 600),
                  type: PageTransitionType.leftToRight,
                  child: const LoginPage(),
                ),
              );
            }
          },
          child: Stack(
            children: [
              Positioned(
                child: SizedBox(
                  height: size.height * 0.80,
                  width: size.width,
                  child: Image.asset(
                    'assets/images/bg1.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Column(
                children: [
                  TopSpace(space: size.height * 0.25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome!',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                bottom: 15,
                right: 15,
                child: SizedBox(
                  height: size.height * 0.25,
                  width: size.height * 0.25,
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
