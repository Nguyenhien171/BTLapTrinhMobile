import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: UserProfileScreen()));
}

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  // Giả sử dữ liệu từ API
  final String? userName = null;
  final String? userBio = "Lập trình Flutter";

  @override
  Widget build(BuildContext context) {
    // 1. Dùng ??
    final String nameToDisplay = userName ?? "Nguyễn Thị Thu Hiền";

    return Scaffold(
      appBar: AppBar(title: const Text("Bài tập Nullable")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Tên: $nameToDisplay", style: const TextStyle(fontSize: 20)),

            // 2. Xử lý hiển thị Bio nếu không null
            if (userBio != null)
              Text("Bio: $userBio")
            else
              const Text("Chưa có tiểu sử"),
          ],
        ),
      ),
    );
  }
}