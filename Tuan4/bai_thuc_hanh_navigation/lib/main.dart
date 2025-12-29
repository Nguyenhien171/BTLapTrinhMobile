import 'package:flutter/material.dart';

import 'screens/welcome_screen.dart';
import 'screens/component_list_screen.dart';
import 'screens/detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UI Assignment',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      // Định nghĩa các đường dẫn (Routes)
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/list': (context) => const ComponentListScreen(),
        '/detail': (context) => const DetailScreen(),
      },
    );
  }
}