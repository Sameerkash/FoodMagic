import 'dart:math';

import 'package:foodmagic/models/fooditem/food.item.dart';
import 'package:foodmagic/views/recents/recents.view.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/cartitem/cart.item.dart';
import '../../providers/auth.provider.dart';
import '../../services/repository.dart';
import '../../models/order/order.dart';
part 'cart.vm.freezed.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.loading() = _Loading;
  const factory CartState.data({required CartData cart}) = _Data;
  const factory CartState.empty() = _Empty;
}

class CartVM extends StateNotifier<CartState> {
  Repository repo;

  CartVM(ProviderReference ref)
      : repo = ref.read(repoProvider),
        super(CartState.loading()) {
    checkCart();
  }

  void checkCart() async {
    final res = await repo.getCart();
    print("checkCart $res");
    if (res == null) {
      state = CartState.empty();
    } else {
      state = CartState.data(cart: res);
    }
  }

  void addToCart(FoodItem item) async {
    final user = await repo.getCurrentUser();
    final current = state;

    if (current is _Empty) {
      OrderItem order =
          OrderItem(quanity: 1, foodItem: item, subTotal: item.price);

      CartData cart = CartData(
          userId: user.userId,
          cartitems: [order],
          discount: item.discount,
          quantity: 1,
          total: item.price - (item.price * item.discount! ~/ 100));

      state = CartState.data(cart: cart);
    }

    if (current is _Data) {
      final food =
          current.cart.cartitems.where((f) => f.foodItem == item).firstOrNull;

      print(food);

      if (food != null && current.cart.cartitems.contains(food)) {
        /// calculate for Each Order
        int quantity = food.quanity + 1;
        int subTotal = food.subTotal + (food.foodItem.price * quantity);

        OrderItem order =
            OrderItem(quanity: quantity, foodItem: item, subTotal: subTotal);

        int totalDiscount = max(current.cart.discount!, item.discount!);
        int total = current.cart.total! + order.subTotal;

        int price = total - (total * totalDiscount ~/ 100);

        CartData cart = CartData(
            userId: user.userId,
            cartitems: [...current.cart.cartitems]
              ..remove(food)
              ..add(order),
            discount: totalDiscount,
            quantity: current.cart.cartitems.length,
            total: price);

        state = CartState.data(cart: cart);
      } else {
        /// calculate for Each Order
        int quantity = 1;
        int subTotal = item.price + (item.price * quantity);

        OrderItem order =
            OrderItem(quanity: quantity, foodItem: item, subTotal: subTotal);

        /// calculate for Entire Cart
        int totalDiscount = max(current.cart.discount!, item.discount!);
        int total = current.cart.total! + order.subTotal;
        int price = total - (total * totalDiscount ~/ 100);

        CartData cart = CartData(
            userId: user.userId,
            cartitems: [...current.cart.cartitems]..add(order),
            discount: totalDiscount,
            quantity: current.cart.cartitems.length + 1,
            total: price);

        state = CartState.data(cart: cart);
      }
    }
  }

  void removeFromCart() async {}
}
