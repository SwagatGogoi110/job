import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jobfind/screens/home/home.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0XFF43b1b7),
        accentColor: Color(0XFFFED408),
      ),
      title: 'Job Find',
      home: HomePage(),
    );
  }
}
