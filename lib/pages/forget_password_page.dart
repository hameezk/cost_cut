
import 'package:cost_cut/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../../config/colors.dart';
import '../../widgets/top_space.dart';
import '../../widgets/top_widget.dart';
import '../widgets/background_image.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  TextEditingController emailMobController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Stack(
          children: [
            const BackgroundImage(),
            const TopWidget(title: 'Forgot Password'),
            Column(
              children: [
                TopSpace(
                  space: size.height * 0.45,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'Email / Mobile No.',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ),
                      TextField(
                        controller: emailMobController,
                        style: const TextStyle(fontSize: 12),
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: kLightBlack),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: kBlueColor),
                          ),
                          hintText:
                              'Enter your registered email or mobile number',
                          hintStyle: TextStyle(color: kLightBlack),
                        ),
                      ),
                      Center(
                        child: SizedBox(
                          width: size.width * 0.8,
                          child: Column(
                            children: [
                              SizedBox(
                                width: size.width * 0.8,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 15.0),
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                kBlueColor)),
                                    child: const Text('Reset Password'),
                                    onPressed: () {
                                      checkValues();
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Do you have an accont? ',
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        // Navigator.pop(context);
                                        Navigator.pushReplacement(
                                          context,
                                          PageTransition(
                                            alignment: Alignment.bottomCenter,
                                            curve: Curves.easeInOut,
                                            duration:
                                                const Duration(milliseconds: 600),
                                            reverseDuration:
                                                const Duration(milliseconds: 600),
                                            type: PageTransitionType.rightToLeft,
                                            child: const SignupPage(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        '  SignUp',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(color: kBlueColor),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void checkValues() {}
}
