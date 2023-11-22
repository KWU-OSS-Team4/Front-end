import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _emailController = TextEditingController();

  bool isEmailDuplicated = false;

  // 이메일 중복 검사 함수
  void validateEmail(String email) {
    // 서버 연결 보고
    // 일단 지금은 문장에 'a'가 들어가면 중복으로 간주
    bool isDuplicated = email.contains('a');

    setState(() {
      isEmailDuplicated = isDuplicated;
    });

    if (isDuplicated) {
      // Show a Snackbar message if the email is duplicated
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Email is already registered.'),
          duration: Duration(seconds: 2),
          backgroundColor: Color.fromARGB(255, 9, 162, 37),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

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
                      ),
                      TextField(
                        // 이메일 중복 확인을 버튼을 누르는 식으로 할 지
                        // 사용자가 이메일 입력을 완료하면 알아서 중복 확인 후 메시지 띄울 지
                        cursorColor: Color.fromARGB(255, 9, 162, 37),
                        decoration: InputDecoration(
                          labelText: 'Enter Email',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 9, 162, 37),
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        onChanged: validateEmail,
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
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      ButtonTheme(
                        minWidth: 100.0,
                        height: 50.0,
                        child: ElevatedButton(
                          onPressed: () {},
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
