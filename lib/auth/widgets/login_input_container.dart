import 'package:flutter/material.dart';
import 'package:supervisor/constants/app_colors.dart';

class LoginInputContainer extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final String hint;
  final bool obscure;

  const LoginInputContainer({
    required this.label,
    required this.controller,
    required this.hint,
    required this.obscure,
  });

  @override
  State<LoginInputContainer> createState() => _LoginInputContainerState();
}

class _LoginInputContainerState extends State<LoginInputContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(24),
          ),
          child: TextField(
            controller: widget.controller,
            obscureText: widget.obscure,
            keyboardType:
                widget.obscure
                    ? TextInputType.text
                    : TextInputType.emailAddress,
            style: Theme.of(context).textTheme.bodyLarge,
            decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: Theme.of(context).textTheme.bodyMedium,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(16),
            ),
          ),
        ),
      ],
    );
  }
}
