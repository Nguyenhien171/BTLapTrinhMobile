import 'package:flutter/material.dart';
import 'screens/splash_screen.dart'; // Import màn hình đầu tiên

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTH Onboarding App',
      debugShowCheckedModeBanner: false, // Tắt chữ "Debug" ở góc màn hình
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true, // Sử dụng giao diện Material 3 mới nhất
      ),
      // Màn hình khởi động đầu tiên là SplashScreen
      home: SplashScreen(),
    );
  }
}