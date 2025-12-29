import 'package:flutter/material.dart';

void main() {
  runApp(const Practical02App());
}

class Practical02App extends StatelessWidget {
  const Practical02App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTH Practical 02',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const NumberGeneratorScreen(),
    );
  }
}

class NumberGeneratorScreen extends StatefulWidget {
  const NumberGeneratorScreen({super.key});

  @override
  State<NumberGeneratorScreen> createState() => _NumberGeneratorScreenState();
}

class _NumberGeneratorScreenState extends State<NumberGeneratorScreen> {
  final TextEditingController _numberController = TextEditingController();
  int _itemCount = 0;
  String? _errorText;

  void _handleGenerate() {
    setState(() {
      final input = _numberController.text;
      final parsedValue = int.tryParse(input);

      // Kiểm tra tính hợp lệ của dữ liệu nhập vào
      if (parsedValue != null && parsedValue > 0) {
        _itemCount = parsedValue;
        _errorText = null; // Xóa lỗi nếu nhập đúng
      } else {
        _itemCount = 0;
        _errorText = "Dữ liệu bạn nhập không hợp lệ";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 50),
              const Text(
                "Thực hành 02",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // Vùng nhập liệu
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          controller: _numberController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Nhập vào số lượng",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                          ),
                        ),
                        // Hiển thị lỗi ngay dưới TextField
                        if (_errorText != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 8, left: 5),
                            child: Text(
                              _errorText!,
                              style: const TextStyle(color: Colors.red, fontSize: 13),
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: _handleGenerate,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2196F3),
                      minimumSize: const Size(80, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text("Tạo", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Danh sách kết quả
              Expanded(
                child: ListView.builder(
                  itemCount: _itemCount,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE54D42), // Màu đỏ theo slide
                        borderRadius: BorderRadius.circular(15),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}