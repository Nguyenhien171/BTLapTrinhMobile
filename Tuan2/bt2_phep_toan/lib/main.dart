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
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  // Khai báo các Controller để lấy dữ liệu từ TextField
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();

  // Biến lưu trữ kết quả
  String _result = "";

  // Hàm xử lý tính toán
  void _calculate(String operator) {
    double? n1 = double.tryParse(_num1Controller.text);
    double? n2 = double.tryParse(_num2Controller.text);

    if (n1 == null || n2 == null) {
      setState(() {
        _result = "Vui lòng nhập số hợp lệ";
      });
      return;
    }

    double res = 0;
    switch (operator) {
      case '+': res = n1 + n2; break;
      case '-': res = n1 - n2; break;
      case '*': res = n1 * n2; break;
      case '/':
        if (n2 == 0) {
          setState(() { _result = "Không thể chia cho 0"; });
          return;
        }
        res = n1 / n2;
        break;
    }

    // Cập nhật State để hiển thị kết quả lên giao diện
    setState(() {
      _result = res.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Thực hành 03"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Ô nhập số thứ nhất
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                hintText: "Nhập số thứ nhất",
              ),
            ),
            const SizedBox(height: 20),

            // Hàng chứa các nút phép tính
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildOpButton('+', Colors.red),
                _buildOpButton('-', Colors.orange),
                _buildOpButton('*', Colors.blue),
                _buildOpButton('/', Colors.black87),
              ],
            ),
            const SizedBox(height: 20),

            // Ô nhập số thứ hai
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                hintText: "Nhập số thứ hai",
              ),
            ),
            const SizedBox(height: 30),

            // Hiển thị kết quả
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Kết quả: $_result",
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget con để tạo nút bấm nhanh hơn
  Widget _buildOpButton(String label, Color color) {
    return ElevatedButton(
      onPressed: () => _calculate(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      ),
      child: Text(label, style: const TextStyle(fontSize: 20)),
    );
  }
}