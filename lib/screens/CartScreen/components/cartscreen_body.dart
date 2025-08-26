import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:socks_store/global/consts.dart';

// Cart Item Model
class CartItem {
  final String id;
  final String name;
  final double price;
  final String? imageUrl;
  final int quantity;

  const CartItem({
    required this.id,
    required this.name,
    required this.price,
    this.imageUrl,
    this.quantity = 1,
  });

  CartItem copyWith({
    String? id,
    String? name,
    double? price,
    String? imageUrl,
    int? quantity,
  }) {
    return CartItem(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CartItem &&
        other.id == id &&
        other.name == name &&
        other.price == price &&
        other.imageUrl == imageUrl &&
        other.quantity == quantity;
  }

  @override
  int get hashCode {
    return Object.hash(id, name, price, imageUrl, quantity);
  }
}

class CartScreenBody extends StatelessWidget {
  const CartScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cartProvider, child) {
        final cartItems = cartProvider.cartItems;

        if (cartItems.isEmpty) {
          return _buildEmptyCart();
        } else {
          return _buildCartWithItems(cartProvider, cartItems);
        }
      },
    );
  }

  Widget _buildEmptyCart() {
    return Center(
      child: Text(
        "Your cart is empty!",
        style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
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
      child: Container(
        margin: const EdgeInsets.only(bottom: 12.0),
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

class CartProvider extends ChangeNotifier {
  final Map<String, CartItem> _items = {};

  List<CartItem> get cartItems => _items.values.toList();

  int get itemCount => _items.length;

  double get total =>
      _items.values.fold(0, (sum, item) => sum + (item.price * item.quantity));

  void addToCart(String name, double price, {String? imageUrl}) {
    // Check if an item with the same name and price already exists
    final existingItemKey = _items.keys.firstWhere(
      (key) => _items[key]!.name == name && _items[key]!.price == price,
      orElse: () => '',
    );

    if (existingItemKey.isNotEmpty) {
      // Item already exists, increase quantity
      _items[existingItemKey] = _items[existingItemKey]!.copyWith(
        quantity: _items[existingItemKey]!.quantity + 1,
      );
    } else {
      // New item, create with unique ID
      final id = DateTime.now().millisecondsSinceEpoch.toString();
      _items[id] = CartItem(
        id: id,
        name: name,
        price: price,
        imageUrl: imageUrl,
      );
    }
    notifyListeners();
  }

  void removeFromCart(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void updateQuantity(String id, int quantity) {
    if (_items.containsKey(id)) {
      if (quantity <= 0) {
        _items.remove(id);
      } else {
        _items[id] = _items[id]!.copyWith(quantity: quantity);
      }
      notifyListeners();
    }
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
