import 'package:flutter/material.dart';
import 'text_detail_screen.dart';
import 'image_detail_screen.dart';
import 'input_detail_screen.dart';
import 'layout_detail_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UI Components List')),
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
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
      color: Colors.blue[50],
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle),
        onTap: onTap,
      ),
    );
  }
}