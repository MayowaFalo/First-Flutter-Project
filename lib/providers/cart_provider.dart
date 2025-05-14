import 'package:first_flutter/models/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: camel_case_types
class CartNotifier extends Notifier<Set<Product>> {
  //Initial Value
  @override
  Set<Product> build() {
    return const {
      Product(
        id: "1",
        title: "Groovy Shorts",
        price: 12,
        image: "assets/products/shorts.png",
      ),

      Product(
        id: "5",
        title: "Drum and Sticks",
        price: 29,
        image: "assets/products/drum.png",
      ),
    };
  }

  //Method to Update State

  void addProducts(Product product) {
    if (!state.contains(product)) {
      state = {...state, product};
    }
  }

  void removeProducts(Product product) {
    if (state.contains(product)) {
    state = state.where((p) => p.id != product.id).toSet();
    }
  }
}

final cartNotifierProvider = NotifierProvider<CartNotifier, Set<Product>>(() {
  return CartNotifier();
});
