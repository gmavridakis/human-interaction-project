import 'dart:async';

import 'package:flutter/material.dart';
import 'terms_of_use.dart';
import 'privacy_policy.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late Timer _timer;
  bool _showSpinner = false;

  @override
  void initState() {
    super.initState();
    // Start the timer when the widget is created
    _timer = Timer(Duration(seconds: 2), () {
      // Set showSpinner to false after 2 seconds
      setState(() {
        _showSpinner = false;
      });
      // Redirect to the home page (replace with your navigation logic)
      Navigator.pushNamed(context, '/home_page');
    });
  }

  @override
  void dispose() {
    // Dispose of the timer to prevent memory leaks
    _timer.cancel();
    super.dispose();
  }

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
              margin: EdgeInsets.all(8),
              child: Container(
                child: Image.network(
                  '/icons/get-started.png',
                  width: 75,
                  height: 75,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Text(
              'Sign Up',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Set showSpinner to true when the button is pressed
                setState(() {
                  _showSpinner = true;
                });
                // You can add your sign-up logic here
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(22, 128, 90, 1), // #16805A
              ),
              child: Text(
                'Under construction!',
                style: TextStyle(color: Colors.white),
              ),
            ),
            // Add a conditional spinner based on _showSpinner
            if (_showSpinner)
              Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    'You may leave or watch the spinner forever!',
                    style: TextStyle(
                      color: Color.fromRGBO(22, 128, 90, 1), // #16805A
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color.fromRGBO(22, 128, 90, 1), // #16805A
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
