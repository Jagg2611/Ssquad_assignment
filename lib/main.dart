// import 'package:booking_app/widgets/header_section.dart';
import 'package:flutter/material.dart';
import 'package:booking_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomeScreen());
  }
}
