import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socks_store/global/consts.dart';

class SearchTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const SearchTextfield({
    super.key,
    required this.controller,
    this.hintText = "",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: 390.w,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: hintText,

          border: InputBorder.none,
          //contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
