import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VerifyOtpScreen extends StatefulWidget {
  @override
  _VerifyOtpScreenState createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _rotationAnimation;
  late Animation<Color?> _colorAnimation;
  bool _isVerified = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _rotationAnimation = Tween<double>(begin: 0, end: 360).animate(_animationController);
    _colorAnimation = ColorTween(begin: Colors.grey, end: Colors.red).animate(_animationController);

    _animationController.addListener(() {
      setState(() {});
    });

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isVerified = true;
        });
      }
    });

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          
          child: Stack(
            children: [
              // Rotating SVG
              SizedBox(height: 150,),
              Align(
                alignment: Alignment.topCenter,
                child: RotationTransition(
                  turns: _rotationAnimation,
                  child: _isVerified
                    ? SvgPicture.asset(
                        'assets/blue.svg',
                        width: 120,
                        color: Colors.blue,
                      )
                    : SvgPicture.asset(
                        'assets/input.svg',
                        width: 120,
                        color: _colorAnimation.value,
                      ),
                ),
              ),

              // Verifying text
              Align(
                alignment: Alignment.center,
                child: Text(
                  _isVerified ? 'Verified' : 'Verifying...',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}