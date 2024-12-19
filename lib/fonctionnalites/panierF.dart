import 'package:flutter/material.dart';
import '../models/products.dart';

class CartProvider with ChangeNotifier {
  final List<Map<Product, int>> _cartItems = []; // Chaque produit est associé à une quantité

  List<Map<Product, int>> get cartItems => _cartItems;

  /// Retourne le nombre total d'articles (y compris les doublons)
  int get totalItemCount {
    int count = 0;
    for (var item in _cartItems) {
      count += item.values.first; // Additionne les quantités
    }
    return count;
  }

  /// Retourne le nombre de produits uniques dans le panier
  int get uniqueItemCount => _cartItems.length;

  /// Retourne le prix total des produits dans le panier
  double get totalPrice {
    double total = 0.0;
    for (var item in _cartItems) {
      Product product = item.keys.first;
      int quantity = item.values.first;
      total += double.parse(product.price) * quantity;
    }
    return total;
  }

  /// Ajouter un produit au panier ou augmenter la quantité
  void addItem(Product product) {
    bool productExists = false;

    for (var item in _cartItems) {
      if (item.keys.first.name == product.name) {
        item[item.keys.first] = item.values.first + 1; // Augmente la quantité
        productExists = true;
        break;
      }
    }

    if (!productExists) {
      _cartItems.add({product: 1}); // Ajoute le produit avec une quantité de 1
    }

    notifyListeners();
  }

  /// Réduire la quantité d'un produit ou le retirer si quantité = 1
  void decreaseItem(Product product) {
    for (var item in _cartItems) {
      if (item.keys.first.name == product.name) {
        int currentQuantity = item.values.first;

        if (currentQuantity > 1) {
          item[item.keys.first] = currentQuantity - 1; // Réduit la quantité
        } else {
          _cartItems.remove(item); // Retire le produit
        }
        break;
      }
    }

    notifyListeners();
  }

  /// Supprimer un produit spécifique par ID (ou nom)
  void removeItem(Product product) {
    _cartItems.removeWhere((item) => item.keys.first.name == product.name);
    notifyListeners();
  }

  /// Vider complètement le panier
  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
