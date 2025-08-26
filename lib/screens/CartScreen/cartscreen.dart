import 'package:flutter/material.dart';
import 'package:socks_store/global/bot_nav_bar.dart';
import 'package:socks_store/global/consts.dart';
import 'package:socks_store/screens/HomeScreen/homescreen.dart';
import 'components/cartscreen_body.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
        return false;
      },
      child: Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Cart',
            style: TextStyle(
                fontSize: 30.sp, color: textColor, fontWeight: FontWeight.bold),
          ),
        ),
        body: CartScreenBody(),
        bottomNavigationBar: CustomBottomNavBar(selectedIndex: 3),
      ),
    );
  }
}
