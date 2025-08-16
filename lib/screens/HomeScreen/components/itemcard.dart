import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:socks_store/screens/CartScreen/components/cartscreen_body.dart';
import 'package:socks_store/screens/HomeScreen/components/item_info_page.dart';
import 'package:socks_store/screens/CartScreen/cartscreen.dart';
import 'package:socks_store/global/consts.dart';

// ignore: camel_case_types
class Itemcard extends StatelessWidget {
  final String name;
  final String price;
  final String image;

  const Itemcard({
    super.key,
    required this.name,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemInfoPage(
              name: name,
              price: price,
              image: image,
              description: _getDescription(name),
            ),
          ),
        );
      },
      child: Container(
        height: 250.h,
        width: 180.w,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          children: [
            // Image Section
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.r),
                child: Image.asset(
                  image,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            // Price and Add to Cart Section
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Price
                    Text(
                      "€$price",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),

                    // Add to Cart Button
                    Consumer<CartProvider>(
                      builder: (context, cartProvider, child) {
                        return IconButton(
                          onPressed: () {
                            cartProvider.addToCart(
                              name,
                              double.parse(price),
                              imageUrl: image,
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('$name added to cart!'),
                                duration: const Duration(seconds: 3),
                                action: SnackBarAction(
                                  label: 'View Cart',
                                  textColor: Colors.white,
                                  onPressed: () {
                                    // Navigate to cart screen (index 3 in bottom nav)
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (context, animation,
                                                secondaryAnimation) =>
                                            const CartScreen(),
                                        transitionsBuilder: (context, animation,
                                            secondaryAnimation, child) {
                                          const begin = Offset(1.0, 0.0);
                                          const end = Offset.zero;
                                          const curve = Curves.ease;

                                          final tween = Tween(
                                                  begin: begin, end: end)
                                              .chain(CurveTween(curve: curve));

                                          return SlideTransition(
                                            position: animation.drive(tween),
                                            child: child,
                                          );
                                        },
                                      ),
                                      (route) => false,
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                          icon:
                              const Icon(Icons.shopping_cart_checkout_rounded),
                          style: IconButton.styleFrom(
                            backgroundColor: primaryColor,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.all(8.r),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getDescription(String name) {
    switch (name) {
      case 'Classic Socks':
        return 'Premium cotton blend classic socks with reinforced heel and toe. Perfect for everyday wear, these socks provide comfort and durability. Features a comfortable elastic band that stays in place all day.';
      case 'Sport Socks':
        return 'High-performance athletic socks designed for active lifestyles. Made with moisture-wicking technology to keep your feet dry during workouts. Cushioned sole for extra comfort during sports activities.';
      default:
        return 'High-quality socks made with premium materials for ultimate comfort and style. Perfect for any occasion and designed to last.';
    }
  }
}
