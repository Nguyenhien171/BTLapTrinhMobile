import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EmailValidationScreen(),
    );
  }
}

class EmailValidationScreen extends StatefulWidget {
  @override
  _EmailValidationScreenState createState() => _EmailValidationScreenState();
}

class _EmailValidationScreenState extends State<EmailValidationScreen> {
  // Controller to get text from TextField
  final TextEditingController _emailController = TextEditingController();

  // State variables for feedback
  String _message = "";
  Color _messageColor = Colors.red;

  void _validateEmail() {
    String email = _emailController.text;

    setState(() {
      // 1. Check if null or empty
      if (email.isEmpty) {
        _message = "Email không hợp lệ";
        _messageColor = Colors.red;
      }
      // 2. Check if it contains "@"
      else if (!email.contains("@")) {
        _message = "Email không đúng định dạng";
        _messageColor = Colors.red;
      }
      // 3. Success case
      else {
        _message = "Bạn đã nhập email hợp lệ";
        _messageColor = Colors.green;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Thực hành 02',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),

            // Input Field
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Email',
                hintStyle: const TextStyle(color: Colors.grey),
                contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),

            // Error/Success Message
            const SizedBox(height: 10),
            Text(
              _message,
              style: TextStyle(color: _messageColor, fontSize: 14),
            ),
            const SizedBox(height: 20),

            // Check Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _validateEmail,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  'Kiểm tra',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}