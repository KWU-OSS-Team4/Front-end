import 'package:flutter/material.dart';
import 'navigation.dart';
import 'register_page.dart';

class LogIn extends StatefulWidget {
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
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
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 12, 161, 70),
          ),
        ),
        elevation: 0.0,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          //Padding(padding: EdgeInsets.only(top: 30)),
          Form(
            child: Theme(
              data: ThemeData(
                  primaryColor: Colors.grey,
                  inputDecorationTheme: InputDecorationTheme(
                      labelStyle: TextStyle(
                          color: const Color.fromARGB(255, 12, 161, 70),
                          fontSize: 15.0))),
              child: Container(
                padding: EdgeInsets.all(40.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(labelText: 'Enter email'),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      TextField(
                        decoration:
                            InputDecoration(labelText: 'Enter password'),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      ButtonTheme(
                        minWidth: 100.0,
                        height: 50.0,
                        child: ElevatedButton(
                          onPressed: () {
                            // 일단은 연결이 어떻게 될지 몰라서
                            // 바로 로그인되게
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => Navigation()),
                            );
                          },
                          child: Text(
                            'Log in',
                            style: TextStyle(
                              //fontFamily: 'Agbalumo',
                              fontFamily: 'PoiretOne',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(255, 12, 161, 70)),
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Divider(
                        color: Color.fromARGB(255, 0, 0, 0),
                        indent: 20.0,
                        endIndent: 20.0,
                        thickness: 0.5,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      ButtonTheme(
                        minWidth: 100.0,
                        height: 50.0,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => Register()),
                            );
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                              //fontFamily: 'Agbalumo',
                              fontFamily: 'PoiretOne',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(255, 12, 161, 70)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
