import 'package:flutter/material.dart';
import 'package:socks_store/global/consts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoritesScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        children: [
          Column(
            children: [
              Image.asset(socks4),
              Center(
                child: SelectableText(
                  "Vớ cổ ngắn ",
                  style: TextStyle(
                      fontSize: 36.sp,
                      fontWeight: FontWeight.normal,
                      color: textColor),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
