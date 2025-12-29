import 'package:flutter/material.dart';

class TextDetailScreen extends StatelessWidget {
  const TextDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Text Detail')),
      body: Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
            style: TextStyle(fontSize: 24, color: Colors.black),
            children: [
              TextSpan(text: "The "),
              TextSpan(text: "quick ", style: TextStyle(decoration: TextDecoration.lineThrough)),
              TextSpan(text: "Brown ", style: TextStyle(color: Colors.brown, fontSize: 32)),
              TextSpan(text: "fox "),
              TextSpan(text: "j u m p s ", style: TextStyle(letterSpacing: 4)),
              TextSpan(text: "over ", style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: "the", style: TextStyle(decoration: TextDecoration.underline)),
              TextSpan(text: " lazy ", style: TextStyle(fontStyle: FontStyle.italic)),
              TextSpan(text: "dog."),
            ],
          ),
        ),
      ),
    );
  }
}