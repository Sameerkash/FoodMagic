import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/order/order.dart';
import '../../providers/providers.dart';
import '../../services/repository.dart';

part 'order.vm.freezed.dart';

@freezed
class OrderState with _$OrderState {
  const factory OrderState.loading() = _Loading;
  const factory OrderState.data({required Order order}) = _Data;
  const factory OrderState.empty() = _Empty;
}

class OrderVM extends StateNotifier<OrderState> {
  Repository repo;

  OrderVM(ProviderReference ref)
      : repo = ref.read(repoProvider),
        super(OrderState.loading());

  void getOrder() async {
    final res = await repo.getOrders();
    if (res.isEmpty) {
      // state = Orde rState.data(order: res);
    } else {
      state = OrderState.empty();
    }
  }
}
