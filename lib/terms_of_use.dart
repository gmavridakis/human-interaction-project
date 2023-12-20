import 'package:flutter/material.dart';

class TermsOfUseScreen extends StatelessWidget {
  const TermsOfUseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Terms of Use',
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
                'Welcome to Our App. Please read these terms carefully before using our services...',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 16),
              Text(
                'Acceptance of Terms:',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'By using our services, you agree to comply with and be bound by these terms...',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 16),
              Text(
                'User Responsibilities:',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'You are responsible for maintaining the confidentiality of your account and password...',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 16),
              Text(
                'Prohibited Activities:',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'You agree not to engage in any prohibited activities, including but not limited to...',
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
