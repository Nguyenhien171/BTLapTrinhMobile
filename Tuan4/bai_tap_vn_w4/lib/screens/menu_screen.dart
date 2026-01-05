import 'package:flutter/material.dart';
import 'text_detail_screen.dart';
import 'image_detail_screen.dart';
import 'input_detail_screen.dart';
import 'layout_detail_screen.dart';
import 'list_grid_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // màu chữ xanh
        title: const Text(
            'UI Components List',
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const _SectionHeader(title: 'Display'),
          _ComponentTile(
            title: 'Text',
            subtitle: 'Displays text',
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const TextDetailScreen())),
          ),
          _ComponentTile(
            title: 'Image',
            subtitle: 'Displays an image',
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ImageDetailScreen())),
          ),

          const _SectionHeader(title: 'Input'),
          _ComponentTile(
            title: 'TextField',
            subtitle: 'Input field for text',
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const InputDetailScreen())),
          ),
          const _ComponentTile(title: 'PasswordField', subtitle: 'Input field for passwords'),

          const _SectionHeader(title: 'Layout'),
          const _ComponentTile(title: 'Column', subtitle: 'Arranges elements vertically'),
          _ComponentTile(
            title: 'Row',
            subtitle: 'Arranges elements horizontally',
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const LayoutDetailScreen())),
          ),

          // Mục mới
          const SizedBox(height: 10),
          _ComponentTile(
            title: 'List & Grid',
            subtitle: 'Hiển thị danh sách và dạng lưới',
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ListGridScreen())),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    );
  }
}

class _ComponentTile extends StatelessWidget {
  final String title, subtitle;
  final VoidCallback? onTap;

  const _ComponentTile({required this.title, required this.subtitle, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      // Màu xanh nhạt
      color: const Color(0xFFE3F2FD),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        onTap: onTap,
      ),
    );
  }
}