import 'package:first_flutter/models/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_provider.g.dart';

@riverpod
class CartNotifier extends _$CartNotifier {
  //Initial Value
  @override
  Set<Product> build() {
    return const {};
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

@riverpod
int cartTotal(ref) {
  final cartProducts = ref.watch(cartNotifierProvider);

  int total = 0;

  for (Product product in cartProducts) {
    total += product.price;
  }

  return total;
}
