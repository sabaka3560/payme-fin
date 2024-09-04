import 'package:flutter/material.dart';

class OtpInputWidget extends StatelessWidget {
  final int length;

  const OtpInputWidget({Key? key, this.length = 4}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(length, (index) => _buildOtpInputField(context)),
      ),
    );
  }

  Widget _buildOtpInputField(BuildContext context) {
    return Center(
      child: Container(
        width: 30,
        height: 50,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey),
          ),
        ),
        child: TextField(
          style: TextStyle(color: Colors.white, fontSize: 24),
          decoration: InputDecoration(
            border: InputBorder.none,
            counterText: "",  // Removes the counter text
          ),
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
        ),
      ),
    );
  }
}
