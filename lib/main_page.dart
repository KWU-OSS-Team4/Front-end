import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 2;
  double _weight = 0.0;
  double _height = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'WITH EAT',
          style: TextStyle(
            fontFamily: 'Agbalumo',
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 12, 161, 70),
          ),
        ),
        elevation: 0.0,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(20.0, 10.0, 40.0, 10.0),
        width: 150,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 184, 184, 184),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 150, 147, 147),
              blurRadius: 5,
              spreadRadius: 0,
              offset: Offset(3, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
              '몸무게: $_weight',
              style: TextStyle(
                fontFamily: 'godo',
                fontSize: 20.0,
              ),
            ),
            Text(
              '신장: $_height',
              style: TextStyle(
                fontFamily: 'godo',
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}
