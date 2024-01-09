import 'package:flutter/material.dart';
//import 'homepage.dart';
import 'feedpage.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String _errorText = '';
  bool _showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme:
            IconThemeData(color: Color.fromRGBO(22, 128, 90, 1)), // #16805A
      ),
      body: _showSpinner
          ? _buildSpinner()
          : _buildContent(), // Show content or spinner based on the flag
    );
  }

  Widget _buildSpinner() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Welcome Back',
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
    );
  }

  Widget _buildContent() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(8),
            child: Container(
              child: Image.network(
                'https://raw.githubusercontent.com/gmavridakis/human-interaction-project/main/web/icons/get-started.png',
                width: 75,
                height: 75,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Text(
            'Login',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          // Email text field
          _buildTextField(
            controller: _emailController,
            hintText: 'Enter email address',
          ),
          SizedBox(height: 20), // Increased distance between text fields
          // Password text field
          _buildTextField(
            controller: _passwordController,
            hintText: 'Enter password',
            isPassword: true,
          ),
          SizedBox(height: 20),
          Text(
            _errorText,
            style: TextStyle(color: Colors.red),
          ),
          ElevatedButton(
            onPressed: () {
              // Add your login logic here
              String email = _emailController.text.trim();
              String password = _passwordController.text.trim();

              // Check if email and password are 'test'
              if (email == 'email' && password == 'password') {
                // Set the flag to show the spinner
                setState(() {
                  _showSpinner = true;
                });

                // Delay execution of redirectHome function by 4 seconds
                Future.delayed(Duration(seconds: 1), () {
                  redirectHome();
                });
              } else {
                // Show an error message or handle invalid credentials
                setState(() {
                  _errorText = 'Please try again!';
                });
                print('Invalid credentials');
              }
            },
            style: ElevatedButton.styleFrom(
              primary: Color.fromRGBO(22, 128, 90, 1), // #16805A
            ),
            child: Text(
              'Login',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    bool isPassword = false,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: 0.7 * MediaQuery.of(context).size.width,
        child: TextField(
          controller: controller,
          obscureText: isPassword,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(22, 128, 90, 1)),
            ),
          ),
        ),
      ),
    );
  }

  // Function to be called after 4 seconds
  void redirectHome() {
    print('Redirecting to home...');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FeedPage()),
    );
  }
}
