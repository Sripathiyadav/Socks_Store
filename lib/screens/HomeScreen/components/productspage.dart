import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socks_store/global/consts.dart';

class Productspage extends StatelessWidget {
  const Productspage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 250.h,
                width: 180.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black12)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      socks1,
                      scale: 1,
                      fit: BoxFit.fill,
                    ),
                    Row(
                      spacing: 2.w,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(width: 10.w),
                        Text("€300"),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.shopping_cart_checkout_rounded)),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
