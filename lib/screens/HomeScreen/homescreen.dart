import 'package:flutter/material.dart';
import 'package:socks_store/global/consts.dart';
import 'package:socks_store/screens/SignUpScreen/components/input_textfield.dart';
import 'components/homescreen_body.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 160.h,
        flexibleSpace: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 40.h),
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
                      onPressed: () {},
                      icon: Icon(
                        Icons.account_circle,
                        color: textColor,
                        size: 40.sp,
                      )),
                ],
              ),
              SizedBox(height: 10.h),
              Container(
                height: 50.h,
                child: InputTextfield(
                  controller: TextEditingController(),
                  icon: Icons.search_rounded,
                  hintText: "Search",
                ),
              ),
            ],
          ),
        ),
      ),
      body: HomeScreenBody(),
      // bottomNavigationBar: BottomNavigationBar(items: ),
    );
  }
}
