import 'package:flutter/material.dart';
import 'package:socks_store/global/bot_nav_bar.dart';
import 'package:socks_store/global/consts.dart';
import 'package:socks_store/screens/HomeScreen/homescreen.dart';
import 'components/notifications_screen_body.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsScreen extends StatelessWidget {
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
      child: Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Notifications",
            style: TextStyle(
                fontSize: 30.sp, color: textColor, fontWeight: FontWeight.bold),
          ),
        ),
        body: NotificationsScreenBody(),
        bottomNavigationBar: CustomBottomNavBar(selectedIndex: 1),
      ),
    );
  }
}
