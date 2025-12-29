import 'package:flutter/material.dart';

class InputDetailScreen extends StatefulWidget {
  const InputDetailScreen({super.key});

  @override
  State<InputDetailScreen> createState() => _InputDetailScreenState();
}

class _InputDetailScreenState extends State<InputDetailScreen> {
  String _currentValue = "Tự động cập nhật dữ liệu theo textfield";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TextField')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Thông tin nhập',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              ),
              onChanged: (text) {
                setState(() => _currentValue = text.isEmpty ? "Tự động cập nhật dữ liệu theo textfield" : text);
              },
            ),
            const SizedBox(height: 20),
            Text(_currentValue, style: const TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}