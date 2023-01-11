import 'dart:convert';

import 'package:cost_cut/pages/local_stores.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import '../../config/colors.dart';
import '../../widgets/background_image.dart';
import '../../widgets/snackbar.dart';
import '../../widgets/top_widget.dart';
import '../models/user_model.dart';
import '../widgets/top_space.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController fullnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passswordController = TextEditingController();
  TextEditingController confirmPassswordController = TextEditingController();
  TextEditingController mubileNoController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController refferCodeController = TextEditingController();
  var uuid = Uuid();

  String longitude = '';
  String latitude = '';

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
            const TopWidget(title: 'SignUp'),
            Column(
              children: [
                TopSpace(
                  space: size.height * 0.35,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
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
                                  'Full Name',
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                              ),
                              TextField(
                                controller: fullnameController,
                                style: const TextStyle(fontSize: 12),
                                decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: kLightBlack),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: kBlueColor),
                                  ),
                                  hintText: 'Enter your full name',
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
                                  'Email',
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                              ),
                              TextField(
                                controller: emailController,
                                style: const TextStyle(fontSize: 12),
                                decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: kLightBlack),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: kBlueColor),
                                  ),
                                  hintText: 'Enter your email',
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
                                  'Confirm Password',
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                              ),
                              TextField(
                                controller: confirmPassswordController,
                                style: const TextStyle(fontSize: 12),
                                decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: kLightBlack),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: kBlueColor),
                                  ),
                                  hintText: 'Re-Enter Password',
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
                                  'Mobile No.',
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                              ),
                              TextField(
                                controller: mubileNoController,
                                style: const TextStyle(fontSize: 12),
                                decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: kLightBlack),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: kBlueColor),
                                  ),
                                  hintText: 'Enter your mobile number',
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
                                  'Address',
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                              ),
                              TextField(
                                readOnly: false,
                                controller: addressController,
                                style: const TextStyle(fontSize: 12),
                                decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: kLightBlack),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: kBlueColor),
                                  ),
                                  hintText:
                                      'Enter delivery address for your cosscut card',
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
                                  'Postal Address',
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                              ),
                              TextField(
                                controller: postalCodeController,
                                style: const TextStyle(fontSize: 12),
                                decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: kLightBlack),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: kBlueColor),
                                  ),
                                  hintText: 'Enter your postal address',
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
                                  'Referal Code',
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                              ),
                              TextField(
                                controller: refferCodeController,
                                style: const TextStyle(fontSize: 12),
                                decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: kLightBlack),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: kBlueColor),
                                  ),
                                  hintText: 'Enter Refferal Code (If any)',
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
                                          padding:
                                              const EdgeInsets.only(top: 15.0),
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        kBlueColor)),
                                            child: const Text('Sign Up'),
                                            onPressed: () {
                                              checkValues(context);
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
                                              'Do you have an accont? ',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.pop(context);
                                                // Navigator.pushReplacement(
                                                //   context,
                                                //   PageTransition(
                                                //     alignment:
                                                //         Alignment.bottomCenter,
                                                //     curve: Curves.easeInOut,
                                                //     duration: const Duration(
                                                //         milliseconds: 600),
                                                //     reverseDuration:
                                                //         const Duration(
                                                //             milliseconds: 600),
                                                //     type: PageTransitionType
                                                //         .rightToLeft,
                                                //     child: const LoginPage(),
                                                //   ),
                                                // );
                                              },
                                              child: Text(
                                                ' SignIn',
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
                          height: 30,
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

  void checkValues(context) {
    String email = emailController.text.trim();
    String fullName = fullnameController.text.trim();
    String password = passswordController.text.trim();
    String confirmPassword = confirmPassswordController.text.trim();
    String mobileNo = mubileNoController.text.trim();
    String address = addressController.text.trim();
    String postalCode = postalCodeController.text.trim();
    String refferalCode = refferCodeController.text.trim();

    if (email.isEmpty ||
        fullName.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty ||
        mobileNo.isEmpty ||
        address.isEmpty ||
        postalCode.isEmpty) {
      showCustomSnackbar(
          context: context, content: 'Please fill all the required field!');
    } else {
      if (passswordController.text != confirmPassswordController.text) {
        showCustomSnackbar(
            context: context, content: 'Passwords do not match!');
      } else {
        signup(
          email,
          fullName,
          password,
          confirmPassword,
          mobileNo,
          address,
          postalCode,
          refferalCode,
          context,
        );
      }
    }
  }

  Future<void> signup(
      String email,
      String fullName,
      String password,
      String confirmPassword,
      String mobileNo,
      String address,
      String postalCode,
      String refferalCode,
      context) async {
    UserCredential? credentials;

    try {
      print('signing up');
      credentials = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (ex) {
      print('expextion: ${ex.message}');
      showCustomSnackbar(
        context: context,
        content: ex.code.toString(),
      );
    }

    if (credentials != null) {
      String uid = credentials.user!.uid;
      UserModel newUser = UserModel(
        id: uid,
        name: fullName,
        email: email,
        phoneno: mobileNo,
        d_address: address,
        post_code: postalCode,
        username: fullName,
      );

      await FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .set(newUser.toMap())
          .then(
        (value) {
          showCustomSnackbar(context: context, content: 'New user created!');
          UserModel.loggedinUser = newUser;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const LocalStores();
              },
            ),
          );
        },
      );
    }
  }
}
