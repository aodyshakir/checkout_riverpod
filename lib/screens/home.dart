import 'package:checkout_riverpod/screens/checkout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/item.dart';

class MyHomePage extends ConsumerWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<Item> items = [
    Item(name: 'laptop ', price: 500.0),
    Item(name: 'iphone x ', price: 400.0),
    Item(name: 'keyboard ', price: 40.0),
    Item(name: 'mouse ', price: 30.0),
    Item(name: 'headphone ', price: 20.0),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(cart.totalPrice.toString()),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.pushNamed(context, '/cart');
                  },
                ),
                Text('${cart.count}'),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            for (final item in items)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item.name),
                  Text('${item.price}'),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      cart.add(item);
                    },
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
