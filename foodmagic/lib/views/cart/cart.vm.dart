import 'package:foodmagic/models/order/order.dart';
import 'package:foodmagic/providers/auth.provider.dart';
import 'package:foodmagic/services/repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'cart.vm.freezed.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.loading() = _Loading;
  const factory CartState.data({required List<Order> orderItems}) = _Data;
  const factory CartState.empty() = _Empty;
}

class CartVM extends StateNotifier<CartState>{
Repository repo;

  CartVM(ProviderReference ref)
      : repo = ref.read(repoProvider),
        super(CartState.loading());



}