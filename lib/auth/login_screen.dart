import 'package:flutter/material.dart';
import 'package:supervisor/constants/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeAppBarBgColor,
      body: Padding(padding: EdgeInsets.all(16), child: Column(children: [])),
    );
  }
}
