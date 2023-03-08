import 'package:dashboard_1/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import './dashboard/home.dart';
import './settings/setting.dart';

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  final task = [
    const Profile(),
    const App(),
    const Setting(),
  ];
  int currentIndex = 1;
  final PageController _pageController = PageController(initialPage: 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
           controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          children: const [
            Profile(),
            App(),
            Setting(),
            ]
      ),
      bottomNavigationBar: Container(

        color: Colors.white,
        child: Padding(

          padding: const EdgeInsets.symmetric(horizontal: 45.0, vertical: 10),
          child: GNav(
            gap: 2,
            rippleColor: Colors.transparent, // tab button ripple color when pressed
            hoverColor: Colors.transparent,
            haptic: true,
            //curve: Curves.easeInOutCubicEmphasized,
            selectedIndex: currentIndex,
            backgroundColor: Colors.white,
            color: Colors.black,
            activeColor: Colors.black,
            tabBackgroundColor: const Color(0xffDADEEC),
            padding: const EdgeInsets.all(3),
            tabs: const [


              GButton(
                icon: Icons.account_circle,
                text: 'Profile',
                iconSize: 28,
              ),

              GButton(
                icon: Icons.home,
                text: 'Home',
                iconSize: 28,
              ),
              GButton(
                icon: Icons.settings,
                text: 'Settings',
                iconSize: 28,
              ),
            ],
            onTabChange: (index) {
             _pageController.animateToPage(index, duration: const Duration(milliseconds: 700), curve: Curves.ease);
            },
          ),

        ),
      ),
    );
  }
}
