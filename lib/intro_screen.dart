import 'package:flutter/material.dart';
import 'auth.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: [
                _buildSlide('Slide 1', 'Selamat datang di aplikasi kami!'),
                _buildSlide('Slide 2', 'Nikmati fitur keren di sini.'),
                _buildSlide('Slide 3', 'Ayo mulai sekarang!', isLast: true),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) => _buildDot(index)),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildSlide(String title, String description, {bool isLast = false}) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Text(description, style: TextStyle(fontSize: 16)),
          if (isLast) ...[
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text('Lanjut ke Login'),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildDot(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == index ? Colors.blue : Colors.grey,
      ),
    );
  }
}