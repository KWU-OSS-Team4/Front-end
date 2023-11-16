import 'package:flutter/material.dart';
import 'Calender.dart';
import 'Diet.dart';
import 'alarm.dart';
import 'settings.dart';
import 'main_page.dart';

class Navigation extends StatefulWidget {
  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 2;
  double _weight = 0.0;
  double _height = 0.0;

  final screens = [Calendar(), Diet(), MainPage(), alarm(), Settings()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color.fromARGB(255, 12, 161, 70),
        selectedIconTheme: IconThemeData(size: 50),
        selectedFontSize: 20,
        selectedLabelStyle: TextStyle(
          fontSize: 10,
          color: Colors.black,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 10,
          color: Colors.black,
        ),
        onTap: (int index) => setState(() {
          _selectedIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_month,
              ),
              label: 'Calender'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.rice_bowl,
              ),
              label: 'Diet'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.alarm,
              ),
              label: 'Alarm'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: 'Setting'),
        ],
      ),
    );
  }
}
