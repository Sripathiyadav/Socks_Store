import 'package:flutter/material.dart';
import 'package:socks_store/global/bot_nav_bar.dart';
import 'package:socks_store/global/consts.dart';
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
          MaterialPageRoute(
              builder: (context) => CustomBottomNavBar(
                    selectedIndex: 0,
                  )),
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
