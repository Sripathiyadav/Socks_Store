import 'package:flutter/material.dart';
import 'package:socks_store/global/bot_nav_bar.dart';
import 'package:socks_store/global/consts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socks_store/screens/ProfileScreen/components/contact_tile.dart';

class DevelopersContact extends StatelessWidget {
  const DevelopersContact({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        title: SelectableText(
          "Contact Developer",
          style: TextStyle(
              fontSize: 26.sp, color: textColor, fontWeight: FontWeight.w900),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ContactTile(
                text: "Gmail",
                logo: gmail,
                url: 'mailto:vangapandlasripathi@gmail.com',
              ),
              SizedBox(
                height: 20.h,
              ),
              ContactTile(
                text: "LikedIn",
                logo: linkedin,
                url: 'https://www.linkedin.com/in/sripathi-yadav/',
              ),
              SizedBox(
                height: 20.h,
              ),
              ContactTile(
                text: "Portfolio",
                logo: web,
                url: 'https://sripathiyadavportfolio.netlify.app',
              ),
              SizedBox(
                height: 20.h,
              ),
              ContactTile(
                text: "GitHub",
                logo: github,
                url: 'https://github.com/Sripathiyadav',
              ),
              SizedBox(
                height: 20.h,
              ),
              ContactTile(
                text: "Instagram",
                logo: instagram,
                url: 'https://www.instagram.com/sripathi_yadav_8/',
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
                          fontSize: 36.sp,
                          fontWeight: FontWeight.normal),
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
