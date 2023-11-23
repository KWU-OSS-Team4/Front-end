import 'dart:io';
import 'package:path_provider/path_provider.dart';

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
String forfuture='';
late String _filePath;

// ignore: unused_element
Future<void> initFilePath(String pathname) async {
    // 애플리케이션의 저장소 디렉토리 경로를 얻기
    Directory appDocDir = await getApplicationDocumentsDirectory();
    _filePath = '${appDocDir.path}/$pathname.txt';
    forfuture=_filePath;
  }

  Future<void> _createAndWriteFile() async {
    // 파일 생성 및 쓰기
    File file = File(_filePath);
    await file.writeAsString('Hello, World!\n');
    print('File created and written successfully.');
  }

  Future<void> _readFile() async {
    // 파일 읽기
    File file = File(_filePath);
    String content = await file.readAsString();
    print('File content:\n$content');
  }
  
//경로를 입력해서 파일에 저장하는 함수 로그인 기능및 회원가입 기능에 사용
Future<void> saveUserToFile(User user, String filePath) async {
  final line = user.toString();
  Directory appDocDir = await getApplicationDocumentsDirectory();
    _filePath = '${appDocDir.path}/$filePath.txt';
  File file = File(_filePath);
  await file.writeAsString(line);
}

//지정된 경로에 파일을 저장하는 함수 로그인후 기능사용때 활용
Future<void> saveUserToFileUsing(User user)async{
  final line = user.toString();
  Directory appDocDir = await getApplicationDocumentsDirectory();
    _filePath = '${appDocDir.path}/using.txt';
  File file =File(_filePath);
  await file.writeAsString(line);
}

//경로를 입력해서 파일에서 데이터를 읽는 함수 로그인 기능 및 회원가입 기능에 사용
Future<void> readUserFromFile(String filePath) async{
  Directory appDocDir = await getApplicationDocumentsDirectory();
    _filePath = '${appDocDir.path}/$filePath.txt';
  File file = File(_filePath);
  String line = await file.readAsString();
  forfuture=line;
}

//지정된 경로의 파일에서 데이터를 읽는 함수 로그인 후 기능사용때 활용
Future<void> readUserFromFileUsing() async {
  Directory appDocDir = await getApplicationDocumentsDirectory();
    _filePath = '${appDocDir.path}/using.txt';
  File file =File(_filePath);
  final line = await file.readAsString();
  forfuture=line;
}

//각각의 dart파일에서 유저 객체를 다시 만들때 사용
// ignore: non_constant_identifier_names
User MakeUser(String loadedUser) {
  List<String> words = loadedUser.split(' ');
  User uuser = User(words[0], words[1], words[2],words[3],int.parse(words[4]),int.parse(words[5]),int.parse(words[6]),int.parse(words[7]),int.parse(words[8]));
  return uuser;
}

