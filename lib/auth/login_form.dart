import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:supervisor/auth/login_with_phno.dart';
import 'package:supervisor/auth/widgets/login_input_container.dart';
import 'package:supervisor/constants/app_colors.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _login() async {
    setState(() => _isLoading = true);
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      if (credential.user != null && mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginWithPhone()),
        );
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? 'Login failed. Try again!')),
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Civic Connect", style: Theme.of(context).textTheme.displayLarge),
        SizedBox(height: 20),
        Text(
          "Login to Continue",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 50),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color.fromARGB(144, 230, 227, 227),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              LoginInputContainer(
                label: 'Email',
                controller: _emailController,
                hint: 'Enter your e-mail address',
                obscure: false,
              ),
              const SizedBox(height: 20),
              LoginInputContainer(
                label: 'Password',
                controller: _passwordController,
                hint: 'Enter your password',
                obscure: true,
              ),
            ],
          ),
        ),

        const SizedBox(height: 40),
        ElevatedButton(
          onPressed: _isLoading ? null : _login,
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
              Text("Continue"),
              Icon(Icons.arrow_forward_ios, color: AppColors.buttonArrowColor),
            ],
          ),
        ),
      ],
    );
  }
}
