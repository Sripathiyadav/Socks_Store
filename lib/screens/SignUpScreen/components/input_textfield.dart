import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socks_store/global/consts.dart';

class InputTextfield extends StatefulWidget {
  final IconData? icon;
  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
   InputTextfield(
      {super.key,
      this.icon,
      required this.controller,
      this.hintText = "",
      this.keyboardType});

  @override
  State<InputTextfield> createState() => _InputTextfieldState();
}

class _InputTextfieldState extends State<InputTextfield> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: 370.w,
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
            child: TextField(
              controller: widget.controller,
              keyboardType: widget.keyboardType,
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
