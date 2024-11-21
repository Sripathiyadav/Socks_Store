import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socks_store/global/consts.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "NEW ITEMS FOR THE NEW MONTH",
                style: TextStyle(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w400,
                    color: textColor),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Center(
              child: Container(
                height: 201.h,
                width: 352.w,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 236, 225, 224),
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Image.asset(
                  socks1,
                  // scale: 1,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Wrap(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      socks2,
                      scale: 4,
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      socks3,
                      scale: 4,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ],
            ),
            Center(
              child: Container(
                height: 78.h,
                width: 284.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.h),
                  color: Colors.white70,
                  // border: Border.all(color: textColor),
                ),
                child: GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => (SignUpScreen())));
                  },
                  child: Center(
                      child: Text(
                    "BUY NOW",
                    style: TextStyle(
                        letterSpacing: 1.sp,
                        color: textColor,
                        fontSize: 36.sp,
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
