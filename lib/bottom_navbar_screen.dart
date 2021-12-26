import 'package:flutter/material.dart';
import 'package:flutter_mvvm/detail_screen.dart';
import 'package:flutter_mvvm/home_screen.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({Key key}) : super(key: key);

  @override
  _BottomNavBarScreenState createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  List<Widget> screens = [
    HomeScreen(),
    Placeholder(),
    Placeholder(),
    Placeholder()
  ];
  final navBarIcons = [
    Icons.home,
    Icons.comment,
    Icons.notifications,
    Icons.person,
  ];

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: buildBottomNavBar(),
      ),
    );
  }

  Widget buildBottomNavBar() => BottomNavigationBar(
      landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
      currentIndex: currentIndex,
      onTap: (value) => setState(() => currentIndex = value),
      iconSize: 26,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      items: List.generate(
          navBarIcons.length,
          (i) => BottomNavigationBarItem(
              label: '',
              icon: AnimatedContainer(
                  duration: Duration(milliseconds: 1000),
                  decoration: BoxDecoration(
                      color: currentIndex == i ? Colors.blue : Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  height: 45,
                  width: 45,
                  child: Icon(navBarIcons[i])))));
}
