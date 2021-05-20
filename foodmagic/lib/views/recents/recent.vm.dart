import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/order/order.dart';
import '../../providers/auth.provider.dart';
import '../../services/repository.dart';

part 'recent.vm.freezed.dart';

@freezed
class RecentsState with _$RecentsState {
  const factory RecentsState.loading() = _Loading;
  const factory RecentsState.data({required List<Order> recentOrders}) = _Data;
  const factory RecentsState.empty() = _Empty;
}

class RecentVM extends StateNotifier<RecentsState> {
  Repository repo;

  RecentVM(ProviderReference ref)
      : repo = ref.read(repoProvider),
        super(RecentsState.loading());
}
