// get_started.dart

import 'package:flutter/material.dart';
import 'terms_of_use.dart';
import 'privacy_policy.dart';
import 'login.dart';
import 'signup.dart';

class GetStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme:
            IconThemeData(color: Color.fromRGBO(22, 128, 90, 1)), // #16805A
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(8), // Adjust margin as needed
              child: Container(
                child: Image.network(
                  '/icons/get-started.png',
                  width: 75, // Set the same width as the Container
                  height: 75, // Set the same height as the Container
                  fit: BoxFit
                      .contain, // Use 'contain' to maintain the image's aspect ratio
                ),
              ),
            ),
            Text(
              'Get Started',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the Login page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(22, 128, 90, 1), // #16805A
              ),
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Navigate to the Sign Up page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(22, 128, 90, 1), // #16805A
              ),
              child: Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    // Navigate to the Terms of Use page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TermsOfUseScreen()),
                    );
                  },
                  child: Text(
                    'Terms of Use',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  '|',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(width: 10),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PrivacyPolicyScreen()),
                    );
                  },
                  child: Text(
                    'Privacy Policy',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
