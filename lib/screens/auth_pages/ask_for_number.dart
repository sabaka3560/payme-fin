import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paymefin1/screens/auth_pages/verify.dart';

class OtpScreen extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String _selectedCountryCode = '+91';
  String _phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              // Centered Stack for Square SVGs
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
                            left: constraints.maxWidth * 0.4, // 40% from left
                            child: SvgPicture.asset('assets/blue.svg', width: 70, color: Colors.red,),
                          ),
                          // Top-right asset
                          Positioned(
                            top: constraints.maxHeight * 0.1, // 10% from top
                            left: constraints.maxWidth * 0.6, // 60% from left
                            child: SvgPicture.asset('assets/input.svg', width: 70),
                          ),
                          // Bottom-left asset
                          Positioned(
                            top: constraints.maxHeight * 0.2, // 30% from top
                            left: constraints.maxWidth * 0.4, // 40% from left
                            child: SvgPicture.asset('assets/input1.svg', width: 70),
                          ),
                          // Bottom-right asset
                          Positioned(
                            top: constraints.maxHeight * 0.2, // 30% from top
                            left: constraints.maxWidth * 0.6, // 60% from left
                            child: SvgPicture.asset('assets/input2.svg', width: 70),
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
                        'lets get your phone number.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 100),
                    Row(
                      children: [
                        Container(
                          width: 80, // fixed width for country code
                          child: DropdownButtonFormField(
                            value: _selectedCountryCode,
                            decoration: InputDecoration(
                              labelText: '',
                              labelStyle: TextStyle(color: Colors.grey),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: const Color.fromARGB(255, 146, 127, 127)),
                              ),
                            ),
                            items: [
                              DropdownMenuItem(
                                child: Text('+91'),
                                value: '+91',
                              ),
                              DropdownMenuItem(
                                child: Text('+1'),
                                value: '+1',
                              ),
                              // Add more country codes here
                            ],
                            onChanged: (value) {
                              setState(() {
                                _selectedCountryCode = value as String;
                              });
                            },
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.phone, // open numbers only input keyboard // allow only digits
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: 'Phone Number',
                              labelStyle: TextStyle(color: Colors.grey),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                _phoneNumber = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VerifyScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[800], // Background color
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Continue',
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
            ]
          ),
        ),
      ),
    );
  }
}