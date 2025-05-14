import 'package:first_flutter/providers/cart_provider.dart';
import 'package:first_flutter/providers/product_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  bool showCoupon = true;

  @override
  Widget build(BuildContext context) {
    final cartProducts = ref.watch(cartNotifierProvider);
    final total = ref.watch(cartTotalProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        centerTitle: true,
        // actions: [],
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Column(
              children:
                  cartProducts.map((product) {
                    return Container(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        children: [
                          Image.asset(product.image, width: 60, height: 60),
                          SizedBox(width: 10),
                          Text('${product.title}...'),
                          Expanded(child: SizedBox()),
                          Text("\$${product.price}"),
                        ],
                      ),
                    );
                  }).toList(), // output cart products here
            ),

            Text("Total Price -  \$$total"),

            // output totals here
          ],
        ),
      ),
    );
  }
}
