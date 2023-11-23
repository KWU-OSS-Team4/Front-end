import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'User.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

String forfuture='';
late String _filePath;

// ignore: unused_element
Future<void> initFilePath(String pathname) async {
    // 애플리케이션의 저장소 디렉토리 경로를 얻기
    Directory appDocDir = await getApplicationDocumentsDirectory();
    _filePath = '${appDocDir.path}/$pathname.txt';
    forfuture=_filePath;
  }

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

String username='';
String userid='';
String userpsd='';
String usergen='';
enum Char {M,W}
String _char='M';

class _RegisterState extends State<Register> {
  final TextEditingController _emailController = TextEditingController();


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
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Color.fromARGB(255, 12, 161, 70),
        ),
        elevation: 0.0,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        centerTitle: true,
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
                          color: Color.fromARGB(255, 12, 161, 70),
                          fontSize: 15.0))),
              child: Container(
                padding: EdgeInsets.all(40.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextField(
                        cursorColor: Color.fromARGB(255, 9, 162, 37),
                        decoration: InputDecoration(
                          labelText: 'Enter Name',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 9, 162, 37),
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          username=value;
                        },
                      ),
                      TextField(
                        // 이메일 중복 확인을 버튼을 누르는 식으로 할 지
                        // 사용자가 이메일 입력을 완료하면 알아서 중복 확인 후 메시지 띄울 지
                        cursorColor: Color.fromARGB(255, 9, 162, 37),
                        decoration: InputDecoration(
                          labelText: 'Enter Id',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 9, 162, 37),
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        onChanged: (value) {
                          userid=value;
                        },
                        
                      ),
                      TextField(
                        cursorColor: Color.fromARGB(255, 9, 162, 37),
                        decoration: InputDecoration(
                          labelText: 'Enter Password',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 9, 162, 37),
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        onChanged: (value) {
                          userpsd=value;
                        },
                      ),
                
                      
                      SizedBox(
                        height: 40.0,
                      ),
                      ButtonTheme(
                        minWidth: 100.0,
                        height: 50.0,
                        child: ElevatedButton(
                          onPressed: () {
                             initFilePath(userid);
                            File file=File(forfuture);
                            if(file.existsSync()){
                              //id가 존재하면 아이디가 이미 존재합니다 메세지
                              ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                       content: Text('아이디가 이미 존재합니다.'),
                      duration: Duration(seconds: 2),
                      backgroundColor: Color.fromARGB(255, 9, 162, 37),
                      behavior: SnackBarBehavior.floating,
                        ),
                          );}else{
                            User newuser=User(userpsd,username,'M','유지',0,0,0,0,0);

                            saveUserToFile(newuser.toString(), userid);
                            Navigator.pop(context);
                          }
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
                      )
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
