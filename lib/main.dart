import 'package:flutter/material.dart';
import 'package:halalhut/pages/browse.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BrowseHut(),
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        // scaffoldBackgroundColor: const Color.fromRGBO(0, 17, 21, 0),
        scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
    );
  }
}
