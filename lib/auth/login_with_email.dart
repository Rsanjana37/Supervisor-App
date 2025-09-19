import 'package:flutter/material.dart';
import 'package:supervisor/constants/app_colors.dart';
import 'login_form.dart';

class LoginWithEmail extends StatelessWidget {
  const LoginWithEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeAppBarBgColor,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: LoginForm(), // ✅ Modularized form
        ),
      ),
    );
  }
}
