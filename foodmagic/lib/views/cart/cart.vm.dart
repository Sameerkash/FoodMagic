import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/cartitem/cart.item.dart';
import '../../providers/auth.provider.dart';
import '../../services/repository.dart';

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

    if (res == null) {
      state = CartState.empty();
    } else {
      state = CartState.data(cart: res);
    }
  }
}
