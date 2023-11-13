import 'package:flutter/material.dart';
import 'package:witheat/login_page.dart';
import 'navigation.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: LogIn(),
    );
  }
}