import 'package:flutter/material.dart';
import 'package:socks_store/global/bot_nav_bar.dart';
import 'package:socks_store/global/consts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:socks_store/screens/CartScreen/components/cart_provider.dart';
import 'package:socks_store/screens/FavoritesScreen/components/favorites_provider.dart';
import 'package:socks_store/screens/HomeScreen/components/item_info_page.dart';
import 'package:socks_store/screens/HomeScreen/components/productspage.dart';

class FavoritesScreenBody extends StatelessWidget {
  const FavoritesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoritesProvider>(
      builder: (context, favoritesProvider, child) {
        final favorites = favoritesProvider.favorites;

        if (favorites.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.favorite_border,
                  size: 100,
                  color: Colors.grey[400],
                ),
                SizedBox(height: 16),
                Text(
                  "No favorites yet!",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: textColor,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Tap the heart icon on any product to add it to favorites",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                ),

                // add to fevorites button
                SizedBox(height: 30.h),

                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Productspage()));
                    },
                    child: Container(
                      height: 58.h,
                      width: 204.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.h),
                          color: Colors.white,
                          border: Border.all(color: textColor)),
                      child: Center(
                          child: Text(
                        "ADD",
                        style: TextStyle(
                            letterSpacing: 1.sp,
                            color: textColor,
                            fontSize: 26.sp,
                            fontWeight: FontWeight.normal),
                      )),
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        return Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 70.h),
              Text(
                "Your Favorites (${favorites.length})",
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              //SizedBox(height: 20.h),
              Expanded(
                child: ListView.builder(
                  itemCount: favorites.length,
                  itemBuilder: (context, index) {
                    final favorite = favorites[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ItemInfoPage(
                              name: favorite.name,
                              price: favorite.price.toString(),
                              image: favorite.imageUrl,
                              description: favorite.description,
                            ),
                          ),
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        elevation: 4,
                        margin: EdgeInsets.only(bottom: 16.h),
                        child: ListTile(
                          contentPadding: EdgeInsets.all(16.r),
                          leading: Container(
                            width: 60.w,
                            height: 60.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color: Colors.grey[100],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12.r),
                              child: favorite.imageUrl.isNotEmpty
                                  ? Image.asset(
                                      favorite.imageUrl,
                                      fit: BoxFit.cover,
                                    )
                                  : Icon(
                                      Icons.shopping_bag,
                                      color: Colors.grey,
                                    ),
                            ),
                          ),
                          title: Text(
                            favorite.name,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: textColor,
                            ),
                          ),
                          subtitle: Text(
                            '€${favorite.price.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Add to Cart Button
                              Consumer<CartProvider>(
                                builder: (context, cartProvider, child) {
                                  return IconButton(
                                    onPressed: () {
                                      cartProvider.addToCart(
                                        favorite.name,
                                        favorite.price,
                                        imageUrl: favorite.imageUrl,
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                              '${favorite.name} added to cart!'),
                                          duration: const Duration(seconds: 2),
                                          action: SnackBarAction(
                                            label: 'View Cart',
                                            textColor: Colors.white,
                                            onPressed: () {
                                              Navigator.pushAndRemoveUntil(
                                                context,
                                                PageRouteBuilder(
                                                  pageBuilder: (context,
                                                          animation,
                                                          secondaryAnimation) =>
                                                      CustomBottomNavBar(
                                                    selectedIndex: 3,
                                                  ),
                                                  transitionsBuilder: (context,
                                                      animation,
                                                      secondaryAnimation,
                                                      child) {
                                                    const begin =
                                                        Offset(1.0, 0.0);
                                                    const end = Offset.zero;
                                                    const curve = Curves.ease;

                                                    final tween = Tween(
                                                            begin: begin,
                                                            end: end)
                                                        .chain(CurveTween(
                                                            curve: curve));

                                                    return SlideTransition(
                                                      position: animation
                                                          .drive(tween),
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
                                    icon: Icon(Icons.add_shopping_cart,
                                        color: primaryColor),
                                    tooltip: 'Add to Cart',
                                  );
                                },
                              ),
                              // Remove from Favorites Button
                              IconButton(
                                onPressed: () {
                                  favoritesProvider.removeFavorite(favorite.id);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          '${favorite.name} removed from favorites'),
                                      action: SnackBarAction(
                                        label: 'Undo',
                                        onPressed: () {
                                          favoritesProvider.toggleFavorite(
                                            favorite.name,
                                            favorite.price,
                                            imageUrl: favorite.imageUrl,
                                            description: favorite.description,
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                },
                                icon: Icon(Icons.favorite, color: Colors.red),
                                tooltip: 'Remove from Favorites',
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
