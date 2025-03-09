import 'package:flutter/material.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // App Logo or Icon
            Icon(Icons.article, size: 100, color: Color(0xff2cb3fc)),
            SizedBox(height: 20),

            // App Name
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('News', style: TextStyle(fontSize: 28)),
                Text(
                  'Wave',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff2cb3fc),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            // Tagline
            Text(
              'Stay Informed, Anytime, Anywhere.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 30),

            // About Text
            Text(
              'Welcome to NewsWave, a simple and easy-to-use news app designed to keep you updated on the latest stories. '
              'This app is a personal project built with passion and a focus on simplicity. '
              'I hope you enjoy using it as much as I enjoyed building it!',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),

            Text(
              'Developed by:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Ahmed Elsayed Hamoda',
              style: TextStyle(fontSize: 16, color: Color(0xff2cb3fc)),
            ),
            SizedBox(height: 30),

            Text(
              'Contact Me',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            Row(
              spacing: 8,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/gmail-logo.png', width: 34),
                Text('ahmdhamoda11@gmail.com', style: TextStyle(fontSize: 18)),
              ],
            ),
            Row(
              spacing: 8,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/github-logo.png', width: 24),
                Text('ahmedhamodaa', style: TextStyle(fontSize: 18)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
