import 'package:flutter/material.dart';
import 'package:socks_store/global/consts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socks_store/screens/SignUpScreen/signup_screen.dart';

class StartScreenBody extends StatelessWidget {
  const StartScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 40.h,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SelectableText(
                "Welcome To",
                style: TextStyle(
                    fontSize: 48.sp,
                    color: textColor,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 120.h),
          child: SelectableText(
            //textAlign: TextAlign.right,
            "Sock Store",
            style: TextStyle(
                fontSize: 48.sp, color: textColor, fontWeight: FontWeight.w500),
          ),
        ),
        Center(
            child: Image.asset(
          scale: 4.sp,
          getstartedimg,
          fit: BoxFit.fill,
        )),
        Center(
          child: SelectableText(
            "Make you beautiful everyday",
            style: TextStyle(
                fontSize: 18.sp, color: textColor, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          height: 50.h,
        ),
        Center(
          child: Container(
            height: 78.h,
            width: 284.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.h),
                color: Colors.white70,
                border: Border.all(color: textColor)),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => (SignUpScreen())));
              },
              child: Center(
                  child: Text(
                "GET STARTED",
                style: TextStyle(
                    letterSpacing: 1.sp,
                    color: textColor,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.normal),
              )),
            ),
          ),
        ),
        SizedBox(
          height: 50.h,
        ),
        //(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: SelectableText(
            textAlign: TextAlign.justify,
            "This prototype app showcases my coding skills. It does not connect to any online stores or databases. For inquiries or access to the source code, please use the links in the profile section.",
            style: TextStyle(
              fontSize: 12.sp,
              color: textColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
