import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socks_store/global/consts.dart';

class InputTextfield extends StatefulWidget {
  final IconData? icon;
  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final bool isPassword;
  final String? Function(String?)? validator;
  /// fieldType: "email", "password", "username", etc.
  final String? fieldType;
  InputTextfield(
      {super.key,
      this.icon,
      required this.controller,
      this.hintText = "",
      this.keyboardType,
      this.isPassword = false,
      this.validator,
      this.fieldType});

  @override
  State<InputTextfield> createState() => _InputTextfieldState();
}

class _InputTextfieldState extends State<InputTextfield> {
  String? _defaultValidator(String? value) {
    final trimmed = value?.trim() ?? '';
    if (widget.fieldType == "email") {
      if (trimmed.isEmpty) {
        return "Email is required";
      }
      // Basic email pattern: contains @ and . after @
      int atIdx = trimmed.indexOf('@');
      if (atIdx < 1 || atIdx != trimmed.lastIndexOf('@')) {
        return "Enter a valid email";
      }
      int dotIdx = trimmed.indexOf('.', atIdx);
      if (dotIdx < atIdx + 2 || dotIdx == trimmed.length - 1) {
        return "Enter a valid email";
      }
      return null;
    } else if (widget.fieldType == "password") {
      if (trimmed.isEmpty) {
        return "Password is required";
      }
      if (trimmed.length < 8) {
        return "Password must be at least 8 characters";
      }
      final hasLetter = trimmed.contains(RegExp(r'[A-Za-z]'));
      final hasNumber = trimmed.contains(RegExp(r'[0-9]'));
      if (!hasLetter || !hasNumber) {
        return "Password must contain letters and numbers";
      }
      return null;
    } else if (widget.fieldType == "username") {
      if (trimmed.isEmpty) {
        return "Username is required";
      }
      if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(trimmed)) {
        return "Username must be alphanumeric";
      }
      return null;
    }
    // Default: no validation
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: 390.w,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          if (widget.icon != null)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Icon(
                widget.icon,
                size: 30,
              ),
            ),
          Expanded(
            child: TextFormField(
              controller: widget.controller,
              keyboardType: widget.keyboardType,
              obscureText: widget.isPassword,
              validator: widget.validator ?? (widget.fieldType != null ? _defaultValidator : null),
              decoration: InputDecoration(
                hintText: widget.hintText,
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
