import 'package:flutter/material.dart';

class alarm extends StatelessWidget {
  const alarm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 500,
          width: 250,
          child: Text("alarm"),
        ),
      ),
    );
  }
}