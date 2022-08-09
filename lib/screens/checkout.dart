import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/cart.dart';
import '../state_managment/network_managment.dart';


class Checkout extends ConsumerWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout'), actions: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.cleaning_services),
                onPressed: () {
                  cart.clear();
                },
              ),
              SizedBox(
                width: 30,
              ),
              Text('Total : ${cart.totalPrice}'),
            ],
          ),
        )
      ]),
      body: Container(
        child: ListView.builder(
          itemCount: cart.item.length,
          itemBuilder: (context, index) {
            return ListTile(
                title: Text(cart.item[index].name),
                subtitle: Text('${cart.item[index].price}'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    cart.remove(cart.item[index]);
                  },
                ));
          },
        ),
      ),
    );
  }
}
