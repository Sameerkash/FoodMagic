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
        super(OrderState.loading()) {
    getOrder();
  }

  Future<void> getOrder() async {
    final res = await repo.getOrders();
    final order = res[0];

    final time = DateTime.now();
    final o = time.difference(DateTime.parse(order.time!)).inMinutes <= 5;

    if (res.isNotEmpty && o) {
      state = OrderState.data(order: res[0]);
    } else {
      state = OrderState.empty();
    }
  }
}
