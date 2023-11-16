import 'package:flutter/material.dart';

class Todaydiet extends StatefulWidget{
  @override
  State<Todaydiet> createState()=>_Todaydiet();
}

class _Todaydiet extends State<Todaydiet>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '오늘의 식단',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 12, 161, 70)
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Color.fromARGB(255, 12, 161, 70),
          onPressed: (){
           Navigator.pop(context);
        },
        ),
        elevation: 0.0,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(30.0),
            child: Column(children: [
              Container(
                width: 450,
                height: 150,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color.fromARGB(50, 0, 0, 0),
                  borderRadius: BorderRadius.all(Radius.circular(25))
                ),
                child: Text("맛있는 햄버거"),
              ),
              SizedBox(height: 30,),
              Container(
                width: 450,
                height: 150,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color.fromARGB(50, 0, 0, 0),
                  borderRadius: BorderRadius.all(Radius.circular(25))
                ),
                child: Text("맛있는 치킨"),
              ),
              SizedBox(height: 30),
              Container(
                width: 450,
                height: 150,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color.fromARGB(50, 0, 0, 0),
                  borderRadius: BorderRadius.all(Radius.circular(25))
                ),
                child: Text("맛있는 국밥"),
              )
            ]),
          )
        ],
      )
    );
  }
}