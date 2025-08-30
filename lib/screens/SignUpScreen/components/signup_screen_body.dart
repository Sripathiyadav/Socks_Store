import 'package:flutter/material.dart';
import 'package:socks_store/global/bot_nav_bar.dart';
import 'package:socks_store/global/consts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socks_store/screens/HomeScreen/homescreen.dart';
import 'package:socks_store/screens/SignInScreen/signinscreen.dart';

import 'input_textfield.dart';

class SignUpScreenBody extends StatelessWidget {
  const SignUpScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                signupimag,
                fit: BoxFit.fill,
              ),
              Container(
                height: 600.h,
                width: 428.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.h),
                  color: Colors.white70,
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText(
                        "SIGN UP",
                        style: TextStyle(
                          color: textColor,
                          fontSize: 38.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      SelectableText(
                        "Email",
                        style: TextStyle(
                          color: textColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      InputTextfield(
                        icon: Icons.mail_outline,
                        hintText: "Enter your mail",
                        keyboardType: TextInputType.emailAddress,
                        controller: TextEditingController(),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      SelectableText(
                        "Password",
                        style: TextStyle(
                          color: textColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      InputTextfield(
                        icon: Icons.lock,
                        hintText: "Enter your Password",
                        keyboardType: TextInputType.text,
                        controller: TextEditingController(),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => (CustomBottomNavBar(
                                          selectedIndex: 0,
                                        ))));
                          },
                          child: Text(
                            "Forget Password",
                            style: TextStyle(
                              color: textColor,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => (CustomBottomNavBar(
                                          selectedIndex: 0,
                                        ))));
                          },
                          child: Container(
                            height: 78.h,
                            width: 284.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.h),
                                color: primaryColor,
                                border: Border.all(color: textColor)),
                            child: Center(
                                child: Text(
                              "NEXT",
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SelectableText(
                            "Already have an account?",
                            style: TextStyle(
                              color: textColor,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => (SigninScreen())));
                            },
                            child: Text(
                              "SIGN IN",
                              style: TextStyle(
                                color: textColor,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
