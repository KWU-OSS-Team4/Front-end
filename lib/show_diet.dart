import 'package:flutter/material.dart';
import 'today_diet.dart';

class Showdiet extends StatefulWidget{
  @override
  State<Showdiet> createState()=>_Showdiet();
}
int carbong=250;
int proteing=150;
int fatg=44;
int carbonk =1000;
int proteink=600;
int fatk=400;

class _Showdiet extends State<Showdiet>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '권장 섭취량',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 12, 161, 70),
          ),
        ),
        leading: IconButton(
          onPressed: (){
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              //설명
        Text("목표 탄단지",style: TextStyle(fontSize: 40,color: Color.fromARGB(255, 0, 0, 0)),),
        //탄수화물
        SizedBox(height: 30),

        Text("   탄수화물",style: TextStyle(fontSize: 20,color: Color.fromARGB(150, 0, 0, 0)),),
        SizedBox(height: 5),
        Container(
          child: Row(children: [
            Container(
          width: 150,
          height: 70,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color.fromARGB(50, 0, 0, 0),
            borderRadius: BorderRadius.all(Radius.circular(25))
          ),
          child: Text("$carbong g",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),),
        ),
        SizedBox(width: 10,),
        Icon(Icons.arrow_forward,size: 30,),
        SizedBox(width: 10,),
        Text("$carbonk Kcal",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),)
          ]),
        ),
        //단백질
         Text("   단백질",style: TextStyle(fontSize: 20,color: Color.fromARGB(150, 0, 0, 0)),),
        SizedBox(height: 5),
        Container(
          child: Row(children: [
            Container(
          width: 150,
          height: 70,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color.fromARGB(50, 0, 0, 0),
            borderRadius: BorderRadius.all(Radius.circular(25))
          ),
          child: Text("$proteing g",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),),
        ),
        SizedBox(width: 10,),
        Icon(Icons.arrow_forward,size: 30,),
        SizedBox(width: 10,),
        Text("$proteink Kcal",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),)
          ]),
        ),
        //지방
         Text("   지방",style: TextStyle(fontSize: 20,color: Color.fromARGB(150, 0, 0, 0)),),
        SizedBox(height: 5),
        Container(
          child: Row(children: [
            Container(
          width: 150,
          height: 70,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color.fromARGB(50, 0, 0, 0),
            borderRadius: BorderRadius.all(Radius.circular(25))
          ),
          child: Text("$fatg g",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),),
        ),
        SizedBox(width: 10,),
        Icon(Icons.arrow_forward,size: 30,),
        SizedBox(width: 10,),
        Text("$fatk Kcal",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),)
          ]),
        ),
        //식단추천버튼
        SizedBox(height: 30,),
          ]),
          ),
        Center(child: ElevatedButton.icon(onPressed: (){
          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => Todaydiet()),
          );
        },
          style: ElevatedButton.styleFrom(
            
            minimumSize: Size(300, 100),
            primary: Color.fromARGB(255, 12, 161, 70)
          ),
          icon: Icon(Icons.food_bank,size: 30,color: Color.fromARGB(255, 255, 255, 255),), 
          label: Text("식단추천받기",style: TextStyle(fontSize: 30,color: Color.fromARGB(255, 255, 255, 255)),))
          ,),
    
      ]),
    );
  }
}