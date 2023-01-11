
import 'package:flutter/material.dart';

import '../../widgets/background_image.dart';
import '../../widgets/bottom_bar.dart';
import '../../widgets/member_card.dart';
import '../../widgets/top_widget.dart';
import '../models/user_model.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  UserModel? userModel = UserModel.loggedinUser;

  @override
  Widget build(BuildContext context) {
    print(userModel!.phoneno);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImage(),
          SingleChildScrollView(
            child: Column(
              children: [
                const TopWidget(
                  title: 'My Account',
                  whiteTitle: false,
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.02),
                  child: Column(
                    children: [
                      // TopSpace(
                      //   space: size.height * 0.35,
                      // ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MemberCard(size: size, userModel: userModel),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: SizedBox(
                                    width: size.width * 0.3,
                                    child: Text(
                                      'Name:',
                                      style:
                                          Theme.of(context).textTheme.headline3,
                                    ),
                                  ),
                                  title: SizedBox(
                                    width: size.width * 0.6,
                                    child: Text(
                                      userModel!.name??'',
                                      style:
                                          Theme.of(context).textTheme.headline3,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  leading: SizedBox(
                                    width: size.width * 0.3,
                                    child: Text(
                                      'Email:',
                                      style:
                                          Theme.of(context).textTheme.headline3,
                                    ),
                                  ),
                                  title: SizedBox(
                                    width: size.width * 0.6,
                                    child: Text(
                                      userModel!.email!,
                                      style:
                                          Theme.of(context).textTheme.headline3,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  leading: SizedBox(
                                    width: size.width * 0.3,
                                    child: Text(
                                      'Phone Number:',
                                      style:
                                          Theme.of(context).textTheme.headline3,
                                    ),
                                  ),
                                  title: SizedBox(
                                    width: size.width * 0.6,
                                    child: Text(
                                      userModel!.phoneno??'',
                                      style:
                                          Theme.of(context).textTheme.headline3,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  leading: SizedBox(
                                    width: size.width * 0.3,
                                    child: Text(
                                      'Address:',
                                      style:
                                          Theme.of(context).textTheme.headline3,
                                    ),
                                  ),
                                  title: SizedBox(
                                    width: size.width * 0.6,
                                    child: Text(
                                      userModel!.d_address??"",
                                      style:
                                          Theme.of(context).textTheme.headline3,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  leading: SizedBox(
                                    width: size.width * 0.3,
                                    child: Text(
                                      'Post Code',
                                      style:
                                          Theme.of(context).textTheme.headline3,
                                    ),
                                  ),
                                  title: SizedBox(
                                    width: size.width * 0.6,
                                    child: Text(
                                      userModel!.post_code??'',
                                      style:
                                          Theme.of(context).textTheme.headline3,
                                    ),
                                  ),
                                ),
                              
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomBar(
        currentIndex: 3,
      ),
    );
  }
}
