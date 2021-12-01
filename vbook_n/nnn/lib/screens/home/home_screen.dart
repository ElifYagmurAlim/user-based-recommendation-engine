// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, deprecated_member_use
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nnn/screens/home/localwidgets/home_form_screen.dart';
import 'package:nnn/screens/home/localwidgets/library_form_screen.dart';
import 'package:nnn/screens/home/localwidgets/profile_form_screen.dart';
import 'package:nnn/screens/home/localwidgets/recommendation_form_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, analytics}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  PageController pageController = PageController();

  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          Container(
            color: Colors.red,
            child: HomeFormScreen(),
          ),
          Container(
            color: Colors.green,
            child: RecommendationFormScreen(),
          ),
          Container(
            color: Colors.blue,
            child: LibraryFormScreen(),
          ),
          Container(
            color: Colors.orange,
            child: ProfileFormScreen(),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: ('Home'),
              activeIcon: Icon(Icons.home)),
          BottomNavigationBarItem(
              icon: Icon(Icons.star_border_outlined),
              label: 'Recommendation',
              activeIcon: Icon(Icons.star)),
          BottomNavigationBarItem(
              icon: Icon(Icons.book_outlined),
              label: 'Your Library',
              activeIcon: Icon(Icons.book)),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: 'Profile',
              activeIcon: Icon(Icons.account_circle))
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.grey[900],
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        onTap: onTapped,
      ),
    );
  }
}
