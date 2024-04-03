import 'package:flutter/material.dart';
import 'package:travel_egypt/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0XFFF3F5F7),
        primaryColor: Color(0XFF3EBACE),
        primaryColorLight: const Color(0xFFD8ECF1)
      ),
      home: const HomePage(),
    );
  }
}
