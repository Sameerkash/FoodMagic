import 'package:foodmagic/views/cart/cart.vm.dart';
import 'package:foodmagic/views/order/order.vm.dart';
import 'package:foodmagic/views/recents/recent.vm.dart';

import '../views/home/home.vm.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../services/repository.dart';
import '../views/auth/auth.vm.dart';

final authProvider = StateNotifierProvider<AuthVM, AuthState>((ref) {
  return AuthVM(ref);
});

final repoProvider = Provider<Repository>((ref) => Repository());

final homeProvider = StateNotifierProvider<HomeVM, HomeState>((ref) {
  return HomeVM(ref);
});

final cartProvider = StateNotifierProvider<CartVM, CartState>((ref) {
  return CartVM(ref);
});

final ordersProvider = StateNotifierProvider<OrderVM, OrderState>((ref) {
  return OrderVM(ref);
});

final recentsProvider = StateNotifierProvider<RecentVM, RecentsState>((ref) {
  return RecentVM(ref);
});
