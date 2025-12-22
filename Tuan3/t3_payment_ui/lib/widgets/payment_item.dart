import 'package:flutter/material.dart';
import '../models/payment_method.dart';

class PaymentItem extends StatelessWidget {
  final PaymentMethod method;
  final VoidCallback onTap;

  const PaymentItem({super.key, required this.method, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            )
          ],
          border: Border.all(
            color: method.isSelected ? Colors.blue : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Icon(
              method.isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: Colors.blue,
            ),
            const SizedBox(width: 15),
            // Expanded giúp giải quyết lỗi "RenderFlex overflowed"
            Expanded(
              child: Text(
                method.name,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            Image.asset(method.icon, height: 24),
          ],
        ),
      ),
    );
  }
}