import 'dart:io';
import 'package:flutter/material.dart';
import 'navigation.dart';
import 'register_page.dart';
import 'User.dart';

class LogIn extends StatefulWidget {
  @override
  State<LogIn> createState() => _LogInState();
}

String checkid='';
String checkpsd='';

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
                        cursorColor: Color.fromARGB(255, 9, 162, 37),
                        decoration: InputDecoration(
                          labelText: 'Enter Id',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 9, 162, 37),
                              //아이디 변화에 따라서 string에 입력받기
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          checkid=value;
                        },
                      ),
                      TextField(
                        cursorColor: Color.fromARGB(255, 9, 162, 37),
                        decoration: InputDecoration(
                          labelText: 'Enter password',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 9, 162, 37),
                              //비밀번호 변화에 따라서 string 에 입력받기
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        onChanged: (value) {
                          checkpsd=value;
                        },
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      ButtonTheme(
                        minWidth: 100.0,
                        height: 50.0,
                        child: ElevatedButton(
                          onPressed: () {
                            initFilePath(checkid);
                            File file=File(forfuture);//forfuture에 파일주소
                            if(file.existsSync()==0){
                              //id가 존재하지 않으면 아이디가 존재하지 않습니다 메세지
                              ScaffoldMessenger.of(context).showSnackBar(
                               SnackBar(
                                content: Text('아이디가 존재하지 않습니다.'),
                                duration: Duration(seconds: 2),
                                backgroundColor: Color.fromARGB(255, 9, 162, 37),
                                 behavior: SnackBarBehavior.floating,
                                ),
                                );
                            }else{
                              readUserFromFile(checkid);
                              User user = MakeUser(forfuture);
                              if(user.password!=checkpsd){
                                //id가 존재하지만 password가 다르면 패스워드가 다릅니다 메세지
                                ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('패스워드가 다릅니다.'),
          duration: Duration(seconds: 2),
          backgroundColor: Color.fromARGB(255, 9, 162, 37),
          behavior: SnackBarBehavior.floating,
        ),
      );
                              }else{
                                 //존재하고 paswword 도 같으면 로그인
                              Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => Navigation()),
                            );

                              }
                            }
                           
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
