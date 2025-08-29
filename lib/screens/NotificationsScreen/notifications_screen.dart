import 'package:flutter/material.dart';
import 'package:socks_store/global/consts.dart';
import 'package:socks_store/screens/HomeScreen/homescreen.dart';
import 'components/notifications_screen_body.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
        return false;
      },
      child: Column(
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              "Notifications",
              style: TextStyle(
                fontSize: 30.sp,
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: NotificationsScreenBody(),
          ),
        ],
      ),
    );
  }
}
