import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socks_store/screens/ProfileScreen/components/Developers_contact.dart';

class ProfileTile extends StatelessWidget {
  final String text;
  final Icon icon;
  ProfileTile({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DevelopersContact()));
      },
      child: Container(
        height: 70.h,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              icon,
              Text(
                text,
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20.sp),
              ),
              Icon(Icons.arrow_forward_ios_outlined)
            ],
          ),
        ),
      ),
    );
  }
}
