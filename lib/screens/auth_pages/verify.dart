import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paymefin1/screens/auth_pages/final_verify.dart';
import 'package:paymefin1/widgets/otp_input.dart'; // Import the OTP widget

class VerifyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              // Centered Stack for Diagonal SVGs
              Align(
                alignment: Alignment.topCenter,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Container(
                      width: constraints.maxWidth,
                      height: constraints.maxHeight,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Top-left asset
                          Positioned(
                            top: constraints.maxHeight * 0.1, // 10% from top
                            left: constraints.maxWidth * 0.2, // 30% from left
                            child: SvgPicture.asset(
                              'assets/blue.svg',
                              width: 120,
                              color: Colors.red,
                            ),
                          ),
                          // Top-right asset
                          Positioned(
                            top: constraints.maxHeight * 0.1, // 10% from top
                            left: constraints.maxWidth * 0.5, // 60% from left
                            child:
                                SvgPicture.asset('assets/input.svg', width: 40),
                          ),
                          // Bottom-left asset
                          Positioned(
                            top: constraints.maxHeight * 0.23, // 35% from top
                            left: constraints.maxWidth * 0.4, // 50% from left
                            child: SvgPicture.asset('assets/input1.svg',
                                width: 40),
                          ),
                          // Bottom-right asset
                          Positioned(
                            top: constraints.maxHeight * 0.25, // 35% from top
                            left: constraints.maxWidth * 0.5, // 60% from left
                            child: SvgPicture.asset('assets/input2.svg',
                                width: 110),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              // Main Content
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        'Let\'s verify your phone number.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 100),

                    // OTP Input Widget
                    OtpInputWidget(), // Use the new OTP widget here

                    SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VerifyOtpScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.grey[800], // Background color
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Submit OTP',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
