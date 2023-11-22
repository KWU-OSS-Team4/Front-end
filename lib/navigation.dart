import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:witheat/login_page.dart';
import 'Calender.dart';
import 'Diet.dart';
import 'alarm.dart';
import 'main_page.dart';

class Navigation extends StatefulWidget {
  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 2;
  double _weight = 0.0;
  double _height = 0.0;

  final screens = [Calendar(), Diet(), MainPage(), alarm()];

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
          if (index == 4) {
            showCupertinoModalPopup(
              context: context,
              builder: (BuildContext context) {
                return CupertinoActionSheet(
                  title: Text('Settings'),
                  actions: <Widget>[
                    CupertinoActionSheetAction(
                      onPressed: () {
                        // 계속 스택을 쌓는식으로 진행되서 스택이 overflow 될 수도...
                        // 근데 규모가 작은 앱이라 괜찮을 것 같기도...
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => LogIn()),
                        );
                      },
                      child: Text(
                        'Log out',
                        style: TextStyle(color: CupertinoColors.systemGreen),
                      ),
                    ),
                    // 메뉴 더 필요시 actions에 추가
                  ],
                  cancelButton: CupertinoActionSheetAction(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: CupertinoColors.systemGreen),
                    ),
                  ),
                );
              },
            );
          } else {
            _selectedIndex = index;
          }
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
