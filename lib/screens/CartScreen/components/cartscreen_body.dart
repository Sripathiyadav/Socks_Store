import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:socks_store/global/consts.dart';
import 'package:socks_store/screens/HomeScreen/components/productspage.dart';
import 'package:socks_store/screens/CartScreen/components/cart_provider.dart';

class CartScreenBody extends StatelessWidget {
  const CartScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cartProvider, child) {
        final cartItems = cartProvider.cartItems;

        if (cartItems.isEmpty) {
          return _buildEmptyCart(context);
        } else {
          return _buildCartWithItems(cartProvider, cartItems);
        }
      },
    );
  }

  Widget _buildEmptyCart(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Your cart is empty!",
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 30.h),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Productspage()),
              );
            },
            child: Container(
              height: 58.h,
              width: 124.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.h),
                color: Colors.white,
                border: Border.all(color: textColor),
              ),
              child: Center(
                child: Text(
                  "ADD",
                  style: TextStyle(
                    letterSpacing: 1.sp,
                    color: textColor,
                    fontSize: 26.sp,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartWithItems(
      CartProvider cartProvider, List<CartItem> cartItems) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              final item = cartItems[index];
              return _buildCartItemTile(item, cartProvider);
            },
          ),
        ),
        _buildCheckoutSection(cartProvider, cartItems),
      ],
    );
  }

  Widget _buildCartItemTile(CartItem item, CartProvider cartProvider) {
    return Dismissible(
      key: Key(item.id),
      direction: DismissDirection.endToStart,
      background: _buildDismissBackground(),
      onDismissed: (direction) {
        cartProvider.removeFromCart(item.id);
        // Note: In a real app, you might want to show a snackbar here
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: 4,
        margin: const EdgeInsets.only(bottom: 12.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              _buildProductImage(item),
              const SizedBox(width: 16),
              Expanded(child: _buildProductDetails(item)),
              _buildQuantityControls(item, cartProvider),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDismissBackground() {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.delete,
              color: Colors.white,
              size: 30,
            ),
            SizedBox(width: 16),
            Text(
              'Delete',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductImage(CartItem item) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.grey[100],
      ),
      child: item.imageUrl != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                item.imageUrl!,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            )
          : const Icon(
              Icons.shopping_bag,
              size: 40,
              color: Colors.grey,
            ),
    );
  }

  Widget _buildProductDetails(CartItem item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '€${item.price.toStringAsFixed(2)}',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ],
    );
  }

  Widget _buildQuantityControls(CartItem item, CartProvider cartProvider) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  if (item.quantity > 1) {
                    cartProvider.updateQuantity(item.id, item.quantity - 1);
                  } else {
                    cartProvider.removeFromCart(item.id);
                  }
                },
                icon: const Icon(Icons.remove, size: 18),
                padding: const EdgeInsets.all(8),
                constraints: const BoxConstraints(
                  minWidth: 32,
                  minHeight: 32,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  '${item.quantity}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  cartProvider.updateQuantity(item.id, item.quantity + 1);
                },
                icon: const Icon(Icons.add, size: 18),
                padding: const EdgeInsets.all(8),
                constraints: const BoxConstraints(
                  minWidth: 32,
                  minHeight: 32,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCheckoutSection(
      CartProvider cartProvider, List<CartItem> cartItems) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Items: ${cartProvider.itemCount}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  'Total Items: ${cartItems.fold(0, (sum, item) => sum + item.quantity)}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '€${cartProvider.total.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: cartItems.isNotEmpty
                    ? () {
                        // TODO: Implement checkout logic
                        // Note: In a real app, you would navigate to checkout
                      }
                    : null,
                child: const Text(
                  "Proceed to Checkout",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
