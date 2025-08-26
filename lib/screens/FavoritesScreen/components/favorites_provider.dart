import 'package:flutter/foundation.dart';

class FavoriteItem {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final String description;

  const FavoriteItem({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
  });

  FavoriteItem copyWith({
    String? id,
    String? name,
    double? price,
    String? imageUrl,
    String? description,
  }) {
    return FavoriteItem(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FavoriteItem &&
        other.id == id &&
        other.name == name &&
        other.price == price &&
        other.imageUrl == imageUrl &&
        other.description == description;
  }

  @override
  int get hashCode {
    return Object.hash(id, name, price, imageUrl, description);
  }

  @override
  String toString() {
    return 'FavoriteItem(id: $id, name: $name, price: $price)';
  }
}

class FavoritesProvider extends ChangeNotifier {
  final Map<String, FavoriteItem> _favorites = {};

  List<FavoriteItem> get favorites => _favorites.values.toList();

  int get favoritesCount => _favorites.length;

  bool isFavorite(String name, double price) {
    return _favorites.values
        .any((item) => item.name == name && item.price == price);
  }

  void toggleFavorite(String name, double price,
      {String? imageUrl, String? description}) {
    final existingKey = _favorites.keys.firstWhere(
      (key) => _favorites[key]!.name == name && _favorites[key]!.price == price,
      orElse: () => '',
    );

    if (existingKey.isNotEmpty) {
      // Remove from favorites
      _favorites.remove(existingKey);
    } else {
      // Add to favorites
      final id = DateTime.now().millisecondsSinceEpoch.toString();
      _favorites[id] = FavoriteItem(
        id: id,
        name: name,
        price: price,
        imageUrl: imageUrl ?? '',
        description: description ?? '',
      );
    }
    notifyListeners();
  }

  void removeFavorite(String id) {
    _favorites.remove(id);
    notifyListeners();
  }

  void clearFavorites() {
    _favorites.clear();
    notifyListeners();
  }

  bool hasFavorites() {
    return _favorites.isNotEmpty;
  }

  List<FavoriteItem> searchFavorites(String query) {
    if (query.isEmpty) return favorites;

    return favorites
        .where((item) =>
            item.name.toLowerCase().contains(query.toLowerCase()) ||
            item.description.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
