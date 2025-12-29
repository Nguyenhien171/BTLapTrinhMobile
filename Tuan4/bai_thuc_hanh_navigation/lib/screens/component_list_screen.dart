import 'package:flutter/material.dart';

class ComponentListScreen extends StatelessWidget {
  const ComponentListScreen({super.key});

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
    );
  }

  Widget _buildComponentCard(BuildContext context, String title, String subtitle) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, '/detail'),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.black54)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("UI Components List"), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSectionHeader("Display"),
          _buildComponentCard(context, "Text", "Displays text"),
          _buildComponentCard(context, "Image", "Displays an image"),
          _buildSectionHeader("Input"),
          _buildComponentCard(context, "TextField", "Input field for text"),
          _buildComponentCard(context, "PasswordField", "Input field for passwords"),
          _buildSectionHeader("Layout"),
          _buildComponentCard(context, "Column", "Arranges elements vertically"),
          _buildComponentCard(context, "Row", "Arranges elements horizontally"),
        ],
      ),
    );
  }
}