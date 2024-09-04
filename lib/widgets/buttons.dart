import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final VoidCallback onContinuePressed;
  final VoidCallback onSignInPressed;

  const Buttons({super.key, required this.onContinuePressed, required this.onSignInPressed});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 50,
      left: 50,
      right: 50,
      child: Column(
        children: [
          ElevatedButton(
            onPressed: onContinuePressed, // Use the onContinuePressed callback here
            child: const Text('Continue'),
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: onSignInPressed, // Use the onSignInPressed callback here
            child: const Text(
              'Already have an Account? Sign In',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}