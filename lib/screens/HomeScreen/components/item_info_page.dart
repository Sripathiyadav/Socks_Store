import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:socks_store/global/consts.dart';
import 'package:socks_store/screens/CartScreen/components/cartscreen_body.dart';
import 'package:socks_store/screens/CartScreen/cartscreen.dart';
import 'package:socks_store/screens/FavoritesScreen/components/favorites_provider.dart';
import 'package:socks_store/screens/FavoritesScreen/favorites_screen.dart';

class ItemInfoPage extends StatefulWidget {
  final String name;
  final String price;
  final String image;
  final String description;

  const ItemInfoPage({
    super.key,
    required this.name,
    required this.price,
    required this.image,
    required this.description,
  });

  @override
  State<ItemInfoPage> createState() => _ItemInfoPageState();
}

class _ItemInfoPageState extends State<ItemInfoPage> {
  int selectedSize = 0; // 0: S, 1: M, 2: L

  static const List<String> sizes = ['S', 'M', 'L'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProductImage(),
            _buildProductDetails(),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: textColor),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        _buildFavoriteButton(),
      ],
    );
  }

  Widget _buildFavoriteButton() {
    return Consumer<FavoritesProvider>(
      builder: (context, favoritesProvider, child) {
        final isFavorite = favoritesProvider.isFavorite(
            widget.name, double.parse(widget.price));
        return IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : textColor,
          ),
          onPressed: () => _handleFavoriteToggle(favoritesProvider, isFavorite),
        );
      },
    );
  }

  void _handleFavoriteToggle(
      FavoritesProvider favoritesProvider, bool isFavorite) {
    favoritesProvider.toggleFavorite(
      widget.name,
      double.parse(widget.price),
      imageUrl: widget.image,
      description: widget.description,
    );

    final newIsFavorite =
        favoritesProvider.isFavorite(widget.name, double.parse(widget.price));
    _showFavoriteSnackBar(newIsFavorite);
  }

  void _showFavoriteSnackBar(bool isFavorite) {
    final message = isFavorite
        ? '${widget.name} added to favorites!'
        : '${widget.name} removed from favorites!';

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        action: isFavorite
            ? SnackBarAction(
                label: 'View Favorites',
                textColor: Colors.white,
                onPressed: () => _navigateToFavorites(),
              )
            : null,
      ),
    );
  }

  void _navigateToFavorites() {
    Navigator.pushAndRemoveUntil(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const FavoritesScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          final tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
      (route) => false,
    );
  }

  Widget _buildProductImage() {
    return Container(
      height: 300.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.r),
          bottomRight: Radius.circular(30.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.r),
        child: Image.asset(
          widget.image,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _buildProductDetails() {
    return Padding(
      padding: EdgeInsets.all(20.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProductName(),
          SizedBox(height: 16.h),
          _buildPrice(),
          SizedBox(height: 24.h),
          _buildDescription(),
          SizedBox(height: 24.h),
          _buildSizeSelection(),
          SizedBox(height: 32.h),
          _buildActionButtons(),
        ],
      ),
    );
  }

  Widget _buildProductName() {
    return Text(
      widget.name,
      style: TextStyle(
        fontSize: 28.sp,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
    );
  }

  Widget _buildPrice() {
    return Text(
      '€${widget.price}',
      style: TextStyle(
        fontSize: 32.sp,
        fontWeight: FontWeight.bold,
        color: primaryColor,
      ),
    );
  }

  Widget _buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          widget.description,
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.grey[700],
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildSizeSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Size',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
        SizedBox(height: 16.h),
        Row(
          children: sizes.asMap().entries.map((entry) {
            final index = entry.key;
            final size = entry.value;
            return _buildSizeButton(index, size);
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildSizeButton(int index, String size) {
    final isSelected = selectedSize == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSize = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 12.w),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected ? primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(25.r),
          border: Border.all(
            color: const Color.fromARGB(255, 255, 232, 229),
            width: 2,
          ),
        ),
        child: Text(
          size,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : primaryColor,
          ),
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(child: _buildAddToCartButton()),
        SizedBox(width: 16.w),
        Expanded(child: _buildBuyNowButton()),
      ],
    );
  }

  Widget _buildAddToCartButton() {
    return Consumer<CartProvider>(
      builder: (context, cartProvider, child) {
        return ElevatedButton(
          onPressed: () => _handleAddToCart(cartProvider),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: textColor,
            padding: EdgeInsets.symmetric(vertical: 16.h),
            side: BorderSide(
              color: const Color.fromARGB(124, 78, 53, 47),
              width: 2,
            ),
          ),
          child: Text(
            'Add to Cart',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      },
    );
  }

  void _handleAddToCart(CartProvider cartProvider) {
    cartProvider.addToCart(
      widget.name,
      double.parse(widget.price),
      imageUrl: widget.image,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${widget.name} added to cart!'),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'View Cart',
          textColor: Colors.white,
          onPressed: () => _navigateToCart(),
        ),
      ),
    );
  }

  void _navigateToCart() {
    Navigator.pushAndRemoveUntil(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const CartScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          final tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
      (route) => false,
    );
  }

  Widget _buildBuyNowButton() {
    return Consumer<CartProvider>(
      builder: (context, cartProvider, child) {
        return ElevatedButton(
          onPressed: () => _handleBuyNow(cartProvider),
          style: ElevatedButton.styleFrom(
            backgroundColor: textColor,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 16.h),
          ),
          child: Text(
            'Buy Now',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      },
    );
  }

  void _handleBuyNow(CartProvider cartProvider) {
    // Add item to cart first
    cartProvider.addToCart(
      widget.name,
      double.parse(widget.price),
      imageUrl: widget.image,
    );

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${widget.name} added to cart!'),
        duration: const Duration(seconds: 2),
      ),
    );

    // Navigate to cart screen
    _navigateToCart();
  }
}
