import 'dart:io';

class User {
  String password = ''; //비밀번호
  String name = ''; //유저 이름
  String gender = ''; //성별
  String plan=''; //계획
  int height=0; //신장
  int weight=0; //몸무게
  int success = 0; //성공횟수
  int fail = 0; //실패횟수
  int todaykcal = 0; //오늘의 칼로리

  User(this.password, this.name, this.gender,this.plan,this.height,this.weight,this.success, this.fail, this.todaykcal);

  // 객체를 문자열로 변환
  String toString() {
    return '$password $name $gender $plan $height $weight $success $fail $todaykcal';
  }
}

//경로를 입력해서 파일에 저장하는 함수 로그인 기능및 회원가입 기능에 사용
void saveUserToFile(User user, String filePath) {
  final line = user.toString();
  File file = File(filePath);
  file.writeAsStringSync(line);
}

//지정된 경로에 파일을 저장하는 함수 로그인후 기능사용때 활용
void saveUserToFileUsing(User user){
  final line = user.toString();
  String filePath='using.txt';
  File file =File(filePath);
  file.writeAsStringSync(line);
}

//경로를 입력해서 파일에서 데이터를 읽는 함수 로그인 기능 및 회원가입 기능에 사용
String readUserFromFile(String filePath) {
  File file = File(filePath);
  final line = file.readAsStringSync();
  return line;
}

//지정된 경로의 파일에서 데이터를 읽는 함수 로그인 후 기능사용때 활용
String readUserFromFileUsing(){
  String filepath='using.txt';
  File file =File(filepath);
  final line = file.readAsStringSync();
  return line;
}

//각각의 dart파일에서 유저 객체를 다시 만들때 사용
User MakeUser(String loadedUser) {
  List<String> words = loadedUser.split(' ');
  User uuser = User(words[0], words[1], words[2],words[3],int.parse(words[4]),int.parse(words[5]),int.parse(words[6]),int.parse(words[7]),int.parse(words[8]));
  return uuser;
}

