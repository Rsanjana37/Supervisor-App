import 'package:flutter/material.dart';
import 'package:supervisor/constants/app_colors.dart';

class OtpVerifyButton extends StatefulWidget {
  const OtpVerifyButton({super.key});

  @override
  State<OtpVerifyButton> createState() => _OtpVerifyButtonState();
}

class _OtpVerifyButtonState extends State<OtpVerifyButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        //Navigator.pushReplacement(
        //  context,
        //  MaterialPageRoute(builder: (context) => const MyHome()),
        //);
      },

      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonColor, // Button color
        foregroundColor: AppColors.lightYellowColor, // Text color
        padding: EdgeInsets.all(16),

        shape: RoundedRectangleBorder(
          // Rounded corners
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Verify OTP"),
          Icon(Icons.arrow_forward_ios, color: AppColors.buttonArrowColor),
        ],
      ),
    );
  }
}
