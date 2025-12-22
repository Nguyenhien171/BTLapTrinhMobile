import 'package:flutter/material.dart';
import '../models/payment_method.dart';
import '../widgets/payment_item.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  // Khởi tạo danh sách
  final List<PaymentMethod> methods = [
    PaymentMethod(
        name: "PayPal",
        icon: "assets/icons/paypal.png",
        largeLogo: "assets/icons/paypal.png"
    ),
    PaymentMethod(
        name: "GooglePay",
        icon: "assets/icons/google.png",
        largeLogo: "assets/icons/google.png"
    ),
    PaymentMethod(
        name: "ApplePay",
        icon: "assets/icons/apple.png",
        largeLogo: "assets/icons/apple.png"
    ),
  ];

  // Logic cập nhật UI khi người dùng chọn hình thức thanh toán
  void selectMethod(int index) {
    setState(() {
      for (var m in methods) m.isSelected = false;
      methods[index].isSelected = true;
    });
  }

  // Kiểm tra trạng thái để thay đổi Header
  PaymentMethod? get selectedMethod =>
      methods.any((m) => m.isSelected) ? methods.firstWhere((m) => m.isSelected) : null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            // Header: Hiển thị icon ví khi chưa chọn và Logo khi đã chọn phương thức thanh toán
            SizedBox(
              height: 180,
              child: Center(
                child: selectedMethod == null
                    ? Image.asset("assets/icons/wallet.png", height: 100)
                    : Image.asset(selectedMethod!.largeLogo, height: 120),
              ),
            ),
            const Divider(),
            const SizedBox(height: 20),

            // Danh sách lựa chọn phương thức thanh toán
            Expanded(
              child: ListView.builder(
                itemCount: methods.length,
                itemBuilder: (context, index) => PaymentItem(
                  method: methods[index],
                  onTap: () => selectMethod(index),
                ),
              ),
            ),

            // Button Continue
            if (selectedMethod != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4285F4),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    ),
                    onPressed: () {
                      // Xử lý logic thanh toán
                      print("Đã chọn thanh toán qua: ${selectedMethod!.name}");
                    },
                    child: const Text("Continue", style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}