import 'package:flutter/material.dart';
import 'package:socks_store/global/consts.dart';
import 'package:socks_store/screens/HomeScreen/components/homescreen_body.dart';
import 'package:socks_store/screens/HomeScreen/components/search_box.dart';
import 'package:socks_store/screens/ProfileScreen/profilescreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Column(
        children: [
          AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            toolbarHeight: 160.h,
            flexibleSpace: Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 50.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Hi, Buddy",
                        style: TextStyle(color: textColor, fontSize: 36.sp),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileScreen(),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.account_circle,
                          color: textColor,
                          size: 40.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    height: 50.h,
                    child: SearchTextfield(
                      controller: TextEditingController(),
                      // icon: Icons.search_rounded,
                      hintText: "Search",
                    ),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ),
          Expanded(
            child: HomeScreenBody(),
          ),
        ],
      ),
    );
  }
}
