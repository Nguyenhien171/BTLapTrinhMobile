import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Thư viện để mở link web

class ImageDetailScreen extends StatelessWidget {
  const ImageDetailScreen({super.key});

  // Hàm xử lý mở đường link trong trình duyệt
  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    const String networkImageUrl = 'https://tuyensinhhuongnghiep.vn/upload/images/2023/09/08/truong-dai-hoc-giao-thong-van-tai-tphcm.jpg';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Images', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.blue),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // --- HÌNH THỨ NHẤT (NETWORK) ---
            ClipRRect(
              borderRadius: BorderRadius.circular(20), // Bo góc giống mẫu
              child: Image.network(
                networkImageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),

            // Link ảnh có thể nhấn vào
            GestureDetector(
              onTap: () => _launchUrl(networkImageUrl),
              child: const Text(
                networkImageUrl,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  decoration: TextDecoration.underline, // Gạch chân để biết là link
                ),
              ),
            ),

            const SizedBox(height: 40),

            // --- HÌNH THỨ HAI (ASSETS - "IN APP") ---
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/campus.png', // Hãy đảm bảo bạn đã có ảnh này trong assets
                width: double.infinity,
                fit: BoxFit.cover,
                // Nếu chưa có ảnh thật, dùng tạm placeholder để tránh lỗi:
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 200,
                    color: Colors.grey[300],
                    child: const Icon(Icons.image, size: 50),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'In app',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}