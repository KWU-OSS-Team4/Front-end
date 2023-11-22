import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'show_diet.dart';

class Diet extends StatelessWidget {
  const Diet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(40.0),
          child: Column(children: [
            SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => Showdiet()),
                );
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  minimumSize: Size(280, 80),
                  primary: CupertinoColors.systemGrey5,
                  onPrimary: Color.fromARGB(255, 12, 161, 70)),
              icon: Icon(Icons.trending_up,
                  size: 30, color: Color.fromARGB(255, 0, 0, 0)),
              label: Text("증량",
                  style: TextStyle(
                      fontSize: 30, color: Color.fromARGB(255, 0, 0, 0))),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => Showdiet()),
                );
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  minimumSize: Size(280, 80),
                  primary: CupertinoColors.systemGrey5,
                  onPrimary: Color.fromARGB(255, 12, 161, 70)),
              icon: Icon(
                Icons.trending_flat,
                size: 30,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              label: Text("유지",
                  style: TextStyle(
                      fontSize: 30, color: Color.fromARGB(255, 0, 0, 0))),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => Showdiet()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    minimumSize: Size(280, 80),
                    primary: CupertinoColors.systemGrey5,
                    onPrimary: Color.fromARGB(255, 12, 161, 70)),
                icon: Icon(Icons.trending_down,
                    size: 30, color: Color.fromARGB(255, 0, 0, 0)),
                label: Text("감량",
                    style: TextStyle(
                        fontSize: 30, color: Color.fromARGB(255, 0, 0, 0)))),
            SizedBox(height: 30),
            Divider(
              color: Color.fromARGB(255, 0, 0, 0),
              indent: 20.0,
              endIndent: 20.0,
              thickness: 0.5,
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton.icon(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (_) => ),
                  // );
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    minimumSize: Size(280, 80),
                    primary: CupertinoColors.systemGrey5,
                    onPrimary: Color.fromARGB(255, 12, 161, 70)),
                icon: Icon(Icons.no_food,
                    size: 30, color: Color.fromARGB(255, 0, 0, 0)),
                label: Text("당뇨를 위한 식단",
                    style: TextStyle(
                        fontSize: 30, color: Color.fromARGB(255, 0, 0, 0)))),
          ]),
        )
      ]),
    );
  }
}
