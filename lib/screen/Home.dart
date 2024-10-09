import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lakshapathi/screen/Calender.dart';
import 'package:lakshapathi/screen/Classes.dart';
import 'package:lakshapathi/screen/HomePage.dart';
import 'package:lakshapathi/screen/MyLearning.dart';
import 'package:lakshapathi/screen/Paper.dart';
import 'package:lakshapathi/screen/Profile.dart';
import 'package:lakshapathi/screen/Theory.dart';
import 'package:lakshapathi/utils/themes/theme.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTabIndex = 0;

  late List<Widget> pages;
  late Widget currentPage;
  late HomePage homePage;
  late Classes classes;
  late MyLearning myLearning;
  late Calender calender;
  late Profile profile;

  @override
  void initState() {
    homePage = const HomePage();
    classes = const Classes();
    calender = const Calender();
    profile = const Profile();
    myLearning = const MyLearning();
    pages = [homePage, classes, myLearning, calender, profile];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          color: Colors.white,
          padding: EdgeInsets.all(12),
          child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              activeColor: Colors.white,
              iconSize: 20,
              tabBackgroundColor: Color.fromARGB(255, 72, 161, 79),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              backgroundColor: Colors.white,
              color: AppTheme.colors.primary,
              duration: Duration(milliseconds: 400),
              onTabChange: (int index) {
                setState(() {
                  currentTabIndex = index;
                });
              },
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.list,
                  text: 'Orders',
                ),
                GButton(
                  icon: Icons.add,
                  text: 'Post',
                ),
                GButton(
                  icon: Icons.chat_outlined,
                  text: 'Chat',
                ),
                GButton(
                  icon: Icons.settings,
                  text: 'Settings',
                ),
              ]),
        ),
        body: AnimatedSwitcher(
          duration: Duration(milliseconds: 400),
          child: pages[currentTabIndex],
        ));
  }
}
