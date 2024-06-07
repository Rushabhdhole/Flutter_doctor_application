import 'package:flutter/material.dart';
import 'package:assign_doc_app/screen_01.dart'; // Import screen_01.dart

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SAPDOS',
      theme: ThemeData(
        primaryColor: Color(0xFF13235A),
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Color(0xFF7E91D4)),
      ),
      home: Screen01(), // Set Screen01 as the home widget
    );
  }
}
