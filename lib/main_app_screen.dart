import 'package:flutter/material.dart';

class MainAppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Main App')),
      body: Center(
        child: Text(
          'Selamat datang di Main App!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}