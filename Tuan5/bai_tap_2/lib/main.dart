import 'package:flutter/material.dart';
import 'screens/screen1_forget_password.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UTH SmartTasks',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ForgetPasswordScreen(),
    );
  }
}