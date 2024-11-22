import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:socks_store/global/consts.dart';

class ContactTile extends StatelessWidget {
  final String text;
  final String logo;
  final String url;

  const ContactTile({
    super.key,
    required this.text,
    required this.logo,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _launchURL(url),
      child: Container(
        height: 70.h,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.4),
          borderRadius: BorderRadius.circular(50.r),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 40.h,
                width: 40.w,
                child: Image.asset(
                  logo,
                ),
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
              Icon(Icons.arrow_forward_ios_outlined),
            ],
          ),
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
