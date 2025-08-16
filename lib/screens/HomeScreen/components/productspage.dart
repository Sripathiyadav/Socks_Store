import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socks_store/global/consts.dart';
import 'package:socks_store/screens/HomeScreen/components/itemcard.dart';

class Productspage extends StatelessWidget {
  const Productspage({super.key});

  @override
  Widget build(BuildContext context) {
    // Product data list
    final List<Map<String, String>> products = [
      {
        'name': 'Classic Socks',
        'price': '30',
        'image': socks1,
      },
      {
        'name': 'Sport Socks',
        'price': '27',
        'image': socks2,
      },
      {
        'name': 'Casual Socks',
        'price': '25',
        'image': socks3,
      },
      {
        'name': 'Classic Socks',
        'price': '30',
        'image': socks1,
      },
      {
        'name': 'Sport Socks',
        'price': '27',
        'image': socks2,
      },
      {
        'name': 'Casual Socks',
        'price': '25',
        'image': socks3,
      },
      {
        'name': 'Premium Socks',
        'price': '35',
        'image': socks4,
      },
      {
        'name': 'Classic Socks',
        'price': '30',
        'image': socks1,
      },
      {
        'name': 'Sport Socks',
        'price': '27',
        'image': socks2,
      },
      {
        'name': 'Casual Socks',
        'price': '25',
        'image': socks3,
      },
      {
        'name': 'Premium Socks',
        'price': '35',
        'image': socks4,
      },
      {
        'name': 'Premium Socks',
        'price': '35',
        'image': socks4,
      },
      {
        'name': 'Classic Socks',
        'price': '30',
        'image': socks1,
      },
      {
        'name': 'Sport Socks',
        'price': '27',
        'image': socks2,
      },
      {
        'name': 'Casual Socks',
        'price': '25',
        'image': socks3,
      },
      {
        'name': 'Premium Socks',
        'price': '35',
        'image': socks4,
      },
    ];

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Our Products',
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 16.w,
            mainAxisSpacing: 16.h,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return Itemcard(
              name: product['name']!,
              price: product['price']!,
              image: product['image']!,
            );
          },
        ),
      ),
    );
  }
}
