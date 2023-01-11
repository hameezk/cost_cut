// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cost_cut/pages/forget_password_page.dart';
import 'package:cost_cut/pages/local_stores.dart';
import 'package:cost_cut/pages/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/colors.dart';
import '../models/user_model.dart';
import '../widgets/background_image.dart';
import '../widgets/snackbar.dart';
import '../widgets/top_space.dart';
import '../widgets/top_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passswordController = TextEditingController();
  bool rememberFalg = false;
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
            const TopWidget(
              title: 'LogIn',
              login: true,
            ),
            Column(
              children: [
                TopSpace(
                  space: size.height * 0.4,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Login with',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  'Email Address',
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                              ),
                              TextField(
                                controller: usernameController,
                                style: const TextStyle(fontSize: 12),
                                decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: kLightBlack),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: kBlueColor),
                                  ),
                                  hintText: 'Enter email address',
                                  hintStyle: TextStyle(color: kLightBlack),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  'Password',
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                              ),
                              TextField(
                                controller: passswordController,
                                style: const TextStyle(fontSize: 12),
                                decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: kLightBlack),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: kBlueColor),
                                  ),
                                  hintText: 'Enter Password',
                                  hintStyle: TextStyle(color: kLightBlack),
                                ),
                              ),
                              // Row(
                              //   mainAxisAlignment:
                              //       MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     Row(
                              //       children: [
                              //         Checkbox(
                              //           activeColor: kBlueColor,
                              //           value: rememberFalg,
                              //           splashRadius: 0,
                              //           onChanged: (value) {
                              //             setState(() {
                              //               rememberFalg = value!;
                              //             });
                              //           },
                              //           checkColor: kOffWhite,
                              //         ),
                              //         Text(
                              //           'Remember Password?',
                              //           style: Theme.of(context)
                              //               .textTheme
                              //               .bodyText2,
                              //         )
                              //       ],
                              //     ),
                              //     GestureDetector(
                              //       onTap: () {
                              //         Navigator.push(
                              //           context,
                              //           PageTransition(
                              //             alignment: Alignment.bottomCenter,
                              //             curve: Curves.easeInOut,
                              //             duration:
                              //                 const Duration(milliseconds: 600),
                              //             reverseDuration:
                              //                 const Duration(milliseconds: 600),
                              //             type: PageTransitionType.rightToLeft,
                              //             child: const ForgetPasswordPage(),
                              //           ),
                              //         );
                              //       },
                              //       child: Text(
                              //         'Forgot Password?',
                              //         style: Theme.of(context)
                              //             .textTheme
                              //             .bodyText2!
                              //             .copyWith(color: kBlueColor),
                              //       ),
                              //     )
                              //   ],
                              // ),
                              Center(
                                child: SizedBox(
                                  width: size.width * 0.8,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        width: size.width * 0.8,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 15.0),
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        kBlueColor)),
                                            child: const Text('Log In'),
                                            onPressed: () {
                                              checkValues();
                                            },
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Don\'t have an accont? ',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  PageTransition(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    curve: Curves.easeInOut,
                                                    duration: const Duration(
                                                        milliseconds: 600),
                                                    reverseDuration:
                                                        const Duration(
                                                            milliseconds: 600),
                                                    type: PageTransitionType
                                                        .rightToLeft,
                                                    child: const SignupPage(),
                                                  ),
                                                );
                                              },
                                              child: Text(
                                                ' SignUp',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1!
                                                    .copyWith(
                                                        color: kBlueColor),
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
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void checkValues() {
    String email = usernameController.text.trim();
    String password = passswordController.text.trim();
    if (email.isEmpty || password.isEmpty) {
      showCustomSnackbar(
          context: context, content: 'please fill all The fields');
    } else {
      login(email, password);
    }
  }

  login(email, password) async {
    UserCredential? credentials;

    try {
      print('logging in');
      credentials = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (ex) {
      print('login exception: ${ex.message}');
      showCustomSnackbar(
        context: context,
        content: ex.code.toString(),
      );
    }

    if (credentials != null) {
      String uid = credentials.user!.uid;

      DocumentSnapshot userData =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      UserModel userModel =
          UserModel.fromMap(userData.data() as Map<String, dynamic>);

      UserModel.loggedinUser = userModel;

      showCustomSnackbar(
        context: context,
        content: 'Login Sucessful!',
      );
      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const LocalStores();
          },
        ),
      );
    }
  }
}
