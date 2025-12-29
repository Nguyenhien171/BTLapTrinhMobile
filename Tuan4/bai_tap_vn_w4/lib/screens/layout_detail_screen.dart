import 'package:flutter/material.dart';

class LayoutDetailScreen extends StatelessWidget {
  const LayoutDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Row Layout')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: List.generate(4, (rowIndex) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildBox(Colors.blue[200]!),
                _buildBox(Colors.blue[600]!),
                _buildBox(Colors.blue[200]!),
              ],
            ),
          )),
        ),
      ),
    );
  }

  Widget _buildBox(Color color) {
    return Container(
      width: 100,
      height: 60,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}