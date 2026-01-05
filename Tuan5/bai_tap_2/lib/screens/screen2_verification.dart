import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/user_data.dart';
import 'screen3_reset_password.dart';

class VerificationScreen extends StatefulWidget {
  final UserData data;
  const VerificationScreen({super.key, required this.data});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  // Tạo 5 controller cho 5 ô nhập mã
  final List<TextEditingController> _controllers = List.generate(5, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(5, (_) => FocusNode());

  @override
  void dispose() {
    for (var c in _controllers) {
      c.dispose();
    }
    for (var f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  // Hàm lấy toàn bộ mã code từ 5 ô
  String _getFullCode() {
    return _controllers.map((c) => c.text).join();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.blue),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView( // Thêm để tránh lỗi khi hiện bàn phím
          child: Column(
            children: [
              Image.asset('assets/logo_uth.png', height: 80),
              const SizedBox(height: 10),
              const Text("SmartTasks",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue)),
              const SizedBox(height: 40),
              const Text("Verify Code",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              const Text("Enter the code we just sent on your registered Email",
                  textAlign: TextAlign.center),
              const SizedBox(height: 30),

              // 1. CÁC Ô NHẬP CODE
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(5, (index) => _otpTextField(index)),
              ),

              // 2. KHOẢNG CÁCH GIỮA Ô CODE VÀ NÚT NEXT
              const SizedBox(height: 40),

              // 3. NÚT NEXT
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 55),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
                onPressed: () {
                  widget.data.code = _getFullCode();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ResetPasswordScreen(data: widget.data)),
                  );
                },
                child: const Text("Next", style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Widget cho từng ô nhập mã đơn lẻ
  Widget _otpTextField(int index) {
    return SizedBox(
      width: 60,
      height: 60,
      child: TextFormField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        inputFormatters: [
          LengthLimitingTextInputFormatter(1), // Chỉ cho nhập 1 ký tự
          FilteringTextInputFormatter.digitsOnly, // Chỉ cho nhập số
        ],
        decoration: InputDecoration(
          fillColor: Colors.grey[100],
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
        ),
        onChanged: (value) {
          // Tự động nhảy sang ô tiếp theo khi nhập xong
          if (value.length == 1 && index < 4) {
            _focusNodes[index + 1].requestFocus();
          }
          // Tự động quay lại ô trước nếu xóa
          if (value.isEmpty && index > 0) {
            _focusNodes[index - 1].requestFocus();
          }
        },
      ),
    );
  }
}