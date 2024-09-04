import 'package:flutter/material.dart';
import 'package:paymefin1/screens/auth_pages/ask_for_number.dart';
import '../widgets/animated_shapes.dart';
import '../widgets/buttons.dart';
import '../screens/auth_pages/taking_user_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _showShapes = false;
  bool _alignShapes = false; // Add this state to manage shape alignment
  bool _showButtons = true; // Add this state to manage button visibility
  String _welcomeT = "hello";
  double _fontSize = 48;

  void _onTap() {
    setState(() {
      _showShapes = true;
    });
  }

  // Method to update shape alignment and hide buttons
  void _alignShapesInLineSignIN() {
    setState(() {
      _welcomeT = "let's get you signed up!";
      _fontSize = 30;
      _alignShapes = true;
      _showButtons = false; // Hide the buttons
    });

    // Wait for 2 seconds before navigating to the next screen
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TakingUserNameScreen()),
      );
    });
  }

  void _alignShapesInLineLogIn() {
    setState(() {
      _welcomeT = "welcome back!";
      _fontSize = 30;
      _alignShapes = true;
      _showButtons = false; // Hide the buttons
    });

    // Wait for 2 seconds before navigating to the next screen
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OtpScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea( // Wrap the entire body with SafeArea
        child: GestureDetector(
          onTap: _onTap,
          child: Stack(
            children: [
              if (_showShapes) AnimatedShapes(alignShapes: _alignShapes),
              Center(
                child: Text(
                  _welcomeT,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: _fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (_showShapes && _showButtons) Buttons(onContinuePressed: _alignShapesInLineSignIN, onSignInPressed: _alignShapesInLineLogIn,),
            ],
          ),
        ),
      ),
    );
  }
}