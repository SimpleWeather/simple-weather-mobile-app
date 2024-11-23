import 'package:flutter/material.dart';

class AuthInputWidget extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final bool hasObscureText;

  const AuthInputWidget({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    this.hasObscureText = false,
  });

  @override
  State<AuthInputWidget> createState() => _AuthInputWidgetState();
}

class _AuthInputWidgetState extends State<AuthInputWidget> {
  late bool obscureText = widget.hasObscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      controller: widget.controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hint,
        suffixIcon: widget.hasObscureText
            ? IconButton(
                padding: EdgeInsets.zero,
                onPressed: () => setState(() {
                  obscureText = !obscureText;
                }),
                icon: Icon(
                  obscureText ? Icons.visibility : Icons.visibility_off,
                ),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
