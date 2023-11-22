import 'package:flutter/material.dart';

class Feedbacks extends StatefulWidget{
  @override
  State<Feedbacks> createState()=>_Feedback();
}

class _Feedback extends State<Feedbacks>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '오늘을 돌아 보세요',style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 12, 161, 70)
          ),
          ),
          leading: IconButton(
            onPressed: (){Navigator.pop(context);},
            icon: Icon(Icons.arrow_back)),
            elevation: 0.0,
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            centerTitle: true,
      ),
      body:Column(
        children: [
        Form(
          child: Theme(
            data: ThemeData(
            primaryColor: Colors.grey,
            inputDecorationTheme: InputDecorationTheme(
              labelStyle: TextStyle(
                color: Color.fromARGB(255, 12, 161, 70),
                fontSize: 15.0
              )
            )
            ),
            child: Container(
              padding: EdgeInsets.all(40.0),
              child: Column(children: [
                //"오늘하루 먹은 칼로리를 적어주세여"
                Text("오늘 하루 먹은 칼로리를 적어주세요"),
                //탄 textfield
                TextField(
                  decoration: InputDecoration(labelText: '탄수화물'),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                ),TextField(
                  decoration: InputDecoration(labelText: '단백질'),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                ),TextField(
                  decoration: InputDecoration(labelText: '지방'),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                ),
                SizedBox(
                  height: 30,
                ),
                //확인버튼
                ButtonTheme(
                  minWidth: 100.0,
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Text('save',
                    style: TextStyle(
                      fontFamily: 'PoiretOne',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255)
                    ),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 12, 161, 70)
                    ),
                    )
                  )
              ]),
            ),
          )
           )
      ],)
    );
  }
}