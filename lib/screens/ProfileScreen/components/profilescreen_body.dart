import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socks_store/global/bot_nav_bar.dart';
import 'package:socks_store/global/consts.dart';
import 'package:socks_store/screens/ProfileScreen/components/profile_tile.dart';
import 'package:socks_store/screens/StartScreen/startscreen.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              textAlign: TextAlign.center,
              "Please note that each tile is linked to the developer’s contact information.",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 12.sp,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              height: 70.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.r),
                  color: Colors.white,
                  border: Border.all(color: textColor)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ProfileTile(
                  text: "Buddy",
                  icon: Icon(Icons.person_3_rounded),
                ),
              ),
            ),
            Divider(
              indent: 20,
              endIndent: 20,
              thickness: 1,
              color: textColor,
            ),
            SizedBox(
              height: 10.h,
            ),
            ProfileTile(
              text: "Contact Developer",
              icon: Icon(Icons.developer_board),
            ),
            SizedBox(
              height: 10.h,
            ),
            ProfileTile(
              text: "Coupon",
              icon: Icon(Icons.discount),
            ),
            SizedBox(
              height: 10.h,
            ),
            ProfileTile(
              text: "Rewards",
              icon: Icon(Icons.reviews_sharp),
            ),
            SizedBox(
              height: 10.h,
            ),
            ProfileTile(
              text: "Help & Support",
              icon: Icon(Icons.help),
            ),
            SizedBox(
              height: 10.h,
            ),
            ProfileTile(
              text: "Others",
              icon: Icon(Icons.other_houses_sharp),
            ),
            SizedBox(
              height: 60.h,
            ),
            Center(
              child: Container(
                height: 78.h,
                width: 284.w,
                decoration: BoxDecoration(
                  border: Border.all(color: textColor),
                  borderRadius: BorderRadius.circular(30.h),
                  color: Colors.white70,
                  // border: Border.all(color: textColor),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => (CustomBottomNavBar(
                                  selectedIndex: 0,
                                ))));
                  },
                  child: Center(
                      child: Text(
                    "Back to Home",
                    style: TextStyle(
                        letterSpacing: 1.sp,
                        color: textColor,
                        fontSize: 26.sp,
                        fontWeight: FontWeight.normal),
                  )),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Center(
              child: Container(
                height: 78.h,
                width: 284.w,
                decoration: BoxDecoration(
                  border: Border.all(color: textColor),
                  borderRadius: BorderRadius.circular(30.h),
                  color: Colors.white70,
                  // border: Border.all(color: textColor),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => (StartScreen())));
                  },
                  child: Center(
                      child: Text(
                    "Log Out",
                    style: TextStyle(
                        letterSpacing: 1.sp,
                        color: textColor,
                        fontSize: 26.sp,
                        fontWeight: FontWeight.normal),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
