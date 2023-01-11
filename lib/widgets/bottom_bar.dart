
import 'package:cost_cut/pages/local_stores.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/colors.dart';
import '../models/user_model.dart';
import '../pages/favourites_page.dart';
import '../pages/my_account.dart';
import '../pages/search_page.dart';
import '../pages/welcome_page.dart';

class BottomBar extends StatelessWidget {
  final int currentIndex;
  const BottomBar({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.heart_fill),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.exit_to_app),
            label: 'Logout',
          ),
        ],
        currentIndex: currentIndex,
        selectedItemColor: kOrangeColor,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        onTap: (i) {
          switch (i) {
            case 0:
              {
                (currentIndex != 0)
                    ? navigate(
                        context: context,
                        nextPage: const LocalStores(),
                      )
                    : null;
                break;
              }
            case 1:
              {
                (currentIndex != 1)
                    ? navigate(
                        context: context,
                        nextPage: const SearchPage(searchKeyword: ''),
                      )
                    : null;
                break;
              }
            case 2:
              {
                (currentIndex != 2)
                    ? navigate(
                        context: context,
                        nextPage: FavouritesPage(),
                      )
                    : null;
                break;
              }
            case 3:
              {
                (currentIndex != 3)
                    ? navigate(
                        context: context,
                        nextPage: const MyAccount(),
                      )
                    : null;
                break;
              }
            case 4:
              {
                logout(context);
                break;
              }
            default:
          }
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  void logout(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    UserModel.loggedinUser = null;
    
    prefs.setString('deleted_at', '');
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const WelcomePage(),
      ),
    );
  }

  navigate({context, nextPage}) {
    Navigator.push(
      context,
      PageTransition(
        alignment: Alignment.bottomCenter,
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 600),
        reverseDuration: const Duration(milliseconds: 600),
        type: PageTransitionType.fade,
        child: nextPage,
      ),
    );
  }
}
