import 'package:flutter/foundation.dart';

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
  int get hashCode => Object.hash(id, name, price, imageUrl, quantity);
}

class CartProvider extends ChangeNotifier {
  final Map<String, CartItem> _items = {};

  List<CartItem> get cartItems => _items.values.toList();
  int get itemCount => _items.length;
  double get total =>
      _items.values.fold(0, (sum, item) => sum + (item.price * item.quantity));

  void addToCart(String name, double price, {String? imageUrl}) {
    final existingItemKey = _items.keys.firstWhere(
      (key) => _items[key]!.name == name && _items[key]!.price == price,
      orElse: () => '',
    );

    if (existingItemKey.isNotEmpty) {
      _items[existingItemKey] = _items[existingItemKey]!.copyWith(
        quantity: _items[existingItemKey]!.quantity + 1,
      );
    } else {
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