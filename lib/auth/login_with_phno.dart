import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:supervisor/auth/otp_screen.dart';
import 'package:supervisor/auth/widgets/india_flag_widget.dart';
import 'package:supervisor/constants/app_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supervisor/providers/users/phone_number_provider.dart';

class LoginWithPhone extends ConsumerStatefulWidget {
  const LoginWithPhone({super.key});

  @override
  ConsumerState<LoginWithPhone> createState() => _LoginWithPhoneState();
}

class _LoginWithPhoneState extends ConsumerState<LoginWithPhone> {
  final _phoneController = TextEditingController();
  bool isLoading = false;

  Future<void> _sendOTP() async {
    setState(() => isLoading = true);

    final enteredNumber = '+91${_phoneController.text.trim()}';

    // ✅ Save globally in Riverpod before OTP
    ref.read(phoneNumberProvider.notifier).state = enteredNumber;

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: enteredNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        setState(() => isLoading = false);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(e.message ?? 'Error')));
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() => isLoading = false);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => OtpScreen(verificationId: verificationId),
          ),
        );
      },
      codeAutoRetrievalTimeout: (_) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeAppBarBgColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(height: 70),
              Center(
                child: CircleAvatar(
                  radius: 40, // Size of the circle
                  backgroundColor:
                      AppColors.buttonColor, // Circle background color
                  child: Icon(
                    Icons.person,
                    size: 40, // Icon size
                    color: AppColors.buttonArrowColor, // Icon color
                  ),
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: Text(
                  "Welcome, Supervisor",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: Text(
                  "Phone Number Verification",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              const SizedBox(height: 50),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.homeSearchBarColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Enter Phone Number to get OTP',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 12),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: const BoxDecoration(
                              border: Border(
                                right: BorderSide(color: Colors.black),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IndiaFlagWidget(),
                                const SizedBox(width: 4),
                                const Text('+91'),
                              ],
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              controller: _phoneController,
                              keyboardType: TextInputType.phone,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Enter 10-digit number',
                                hintStyle:
                                    Theme.of(context).textTheme.bodyMedium,
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.all(16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 60),
              isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                    onPressed: _sendOTP,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.buttonColor,
                      foregroundColor: AppColors.lightYellowColor,
                      padding: const EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Send OTP"),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.buttonArrowColor,
                        ),
                      ],
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
