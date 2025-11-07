import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:socks_store/global/consts.dart';
import 'package:socks_store/screens/ProfileScreen/components/Developers_contact.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 60), // top spacing
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  checkout,
                  width: 180,
                  height: 180,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 20.h),
                backtohomebutton(),
              ],
            ),
            Column(
              children: [
                Text(
                  "Note: This app is a prototype and not linked to any live store or payment system. Hence, no address or payment details are required.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 12.sp,
                    height: 1.3,
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  "If you have feedback, find any bugs, or are interested in turning this project into a fully functional store, please use the Contact Me button below — I’d love to hear from you!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 12.sp,
                    height: 1.3,
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  height: 60.h,
                  width: 200.w,
                  decoration: BoxDecoration(
                    border: Border.all(color: textColor),
                    borderRadius: BorderRadius.circular(25.h),
                    color: Colors.white70,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DevelopersContact(),
                        ),
                      );
                    },
                    child: Center(
                      child: Text(
                        "Contact Me",
                        style: TextStyle(
                          letterSpacing: 1.sp,
                          color: textColor,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
