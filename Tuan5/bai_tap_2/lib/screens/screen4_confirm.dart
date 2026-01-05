import 'package:flutter/material.dart';
import '../models/user_data.dart';
import 'screen1_forget_password.dart';

class ConfirmScreen extends StatelessWidget {
  final UserData data;
  const ConfirmScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Thanh AppBar trong suốt với nút Back màu xanh
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
        child: Column(
          children: [
            // 1. Logo và Tên ứng dụng
            Image.asset('assets/logo_uth.png', height: 80),
            const SizedBox(height: 10),
            const Text(
              "SmartTasks",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            const SizedBox(height: 40),

            // 2. Tiêu đề Confirm
            const Text(
              "Confirm",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "We are here to help you!",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 30),

            // 3. Hiển thị Email (Dạng ô nhập nhưng không cho sửa)
            _buildInfoField(
              text: data.email ?? "No Email",
              icon: Icons.person_outline,
            ),
            const SizedBox(height: 15),

            // 4. Hiển thị OTP Code
            _buildInfoField(
              text: data.code ?? "No Code",
              icon: Icons.mail_outline,
            ),
            const SizedBox(height: 15),

            // 5. Hiển thị Mật khẩu (Dạng dấu sao)
            _buildInfoField(
              text: "*" * (data.password?.length ?? 8),
              icon: Icons.lock_outline,
            ),

            const SizedBox(height: 40),

            // 6. Nút Summit - Quay lại màn hình 1 và truyền dữ liệu
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 55),
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              ),
              onPressed: () {
                // Xóa toàn bộ lịch sử các màn hình và đẩy Màn hình 1 lên đầu
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ForgetPasswordScreen(finalData: data),
                  ),
                      (route) => false,
                );
              },
              child: const Text(
                "Summit",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Hàm tạo các ô hiển thị thông tin
  Widget _buildInfoField({required String text, required IconData icon}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey, size: 22),
          const SizedBox(width: 12),
          Text(
            text,
            style: const TextStyle(fontSize: 16, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}