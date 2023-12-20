import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Privacy Policy',
          style: TextStyle(color: Color.fromRGBO(22, 128, 90, 1)), // #16805A
        ),
        backgroundColor: Colors.black,
        iconTheme:
            IconThemeData(color: Color.fromRGBO(22, 128, 90, 1)), // #16805A
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Introduction:',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Welcome to Our App. Your privacy is important to us...',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 16),
              Text(
                'Information We Collect:',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'We collect information that you provide to us, such as your name, email address, and preferences...',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 16),
              Text(
                'How We Use Your Information:',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'We use your information to personalize your experience, improve our services, and communicate with you...',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 16),
              Text(
                'Information Sharing:',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'We do not sell, trade, or otherwise transfer your personal information to third parties...',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 16),
              Text(
                'Changes to Privacy Policy:',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'We may update our Privacy Policy from time to time. You will be notified of any changes...',
                style: TextStyle(color: Colors.white),
              ),
              // Add more sections as needed
            ],
          ),
        ),
      ),
    );
  }
}
