import 'package:first_flutter/providers/cart_provider.dart';
import 'package:first_flutter/providers/product_providers.dart';
import 'package:first_flutter/shared/cart_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allProducts = ref.watch(productsProvider);
    final cartProducts = ref.watch(cartNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Garage Sale Products'),
        actions: const [CartIcon()],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: GridView.builder(
            itemCount: allProducts.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 0.9,
            ),
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(14),
                color: Colors.blueGrey.withOpacity(0.05),
                child: Column(
                  children: [
                    Image.asset(
                      allProducts[index].image,
                      width: 60,
                      height: 50,
                    ),
                    Text(allProducts[index].title),
                    Text("\$${allProducts[index].price}"),

                    if (cartProducts.contains(allProducts[index]))
                      TextButton(
                        onPressed: () {
                          ref
                              .read(cartNotifierProvider.notifier)
                              .removeProducts(allProducts[index]);
                        },
                        child: Text("Remove"),
                      ),

                    if (!cartProducts.contains(allProducts[index]))
                      TextButton(
                        onPressed: () {
                          ref
                              .read(cartNotifierProvider.notifier)
                              .addProducts(allProducts[index]);
                        },
                        child: Text("Add to Cart"),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
