import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socks_store/global/consts.dart';

class NotificationTile extends StatelessWidget {
  final IconData? icon;
  final String title;
  final String subtitle;

  NotificationTile(
      {super.key, this.icon, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(18.r)),
      child: Padding(
        padding: EdgeInsets.all(8.h),
        child: Row(
          spacing: 10.w,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 5.h,
            ),
            Container(
              height: 50.h,
              width: 50.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80.r),
                color: const Color.fromARGB(34, 58, 58, 58),
              ),
              child: Icon(
                icon,
                size: 35.h,
                color: textColor,
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // textAlign: TextAlign.center,
                    title,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    // textAlign: TextAlign.center,
                    subtitle,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
