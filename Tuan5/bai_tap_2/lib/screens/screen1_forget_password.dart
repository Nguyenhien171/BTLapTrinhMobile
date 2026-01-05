import 'package:flutter/material.dart';
import '../models/user_data.dart';
import 'screen2_verification.dart';

class ForgetPasswordScreen extends StatefulWidget {
  final UserData? finalData;
  const ForgetPasswordScreen({super.key, this.finalData});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  // 1. Khai báo key để quản lý trạng thái của Form
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  // 2. Hàm kiểm tra định dạng Email bằng RegExp
  bool _isValidEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Form(
            // 3. Bọc toàn bộ trong widget Form
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                Image.asset(
                  'assets/logo_uth.png',
                  height: 100,
                  errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.error, size: 50, color: Colors.red),
                ),
                const SizedBox(height: 15),
                const Text(
                    "SmartTasks",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue)
                ),
                const SizedBox(height: 40),
                const Text("Forget Password?", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                const Text("Enter your Email, we will send you a verification code.", textAlign: TextAlign.center),
                const SizedBox(height: 20),

                // 4. Đổi từ TextField sang TextFormField
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: "Your Email",
                    prefixIcon: Icon(Icons.email_outlined),
                    border: OutlineInputBorder(),
                  ),
                  // 5. Logic Validator
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập email';
                    }
                    if (!_isValidEmail(value)) {
                      return 'Email không hợp lệ';
                    }
                    return null; // Trả về null nghĩa là hợp lệ
                  },
                ),

                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    // 6. Kiểm tra Form trước khi chuyển màn hình
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VerificationScreen(
                              data: UserData(email: _emailController.text)
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text("Next", style: TextStyle(color: Colors.white)),
                ),

                if (widget.finalData != null) ...[
                  const SizedBox(height: 30),
                  const Divider(thickness: 2, color: Colors.red),
                  const Text("DỮ LIỆU ĐÃ NHẬN:", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
                  Text("Email: ${widget.finalData!.email}"),
                  Text("Code: ${widget.finalData!.code}"),
                  Text("Password: ${widget.finalData!.password}"),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}