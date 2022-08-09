import 'package:checkout_riverpod/model/cart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartProvider = ChangeNotifierProvider<CartModel>((ref) {
  return CartModel();
});
