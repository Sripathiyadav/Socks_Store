import 'package:flutter/material.dart';
import 'package:socks_store/global/consts.dart';
import 'components/profilescreen_body.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Profile',
          style: TextStyle(
              fontSize: 30.sp, fontWeight: FontWeight.w900, color: textColor),
        ),
      ),
      body: ProfileScreenBody(),
    );
  }
}
