import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/fooditem/food.item.dart';
import '../../providers/auth.provider.dart';
import '../../services/repository.dart';

part 'home.vm.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.loading() = _Loading;
  const factory HomeState.data({
    @Default([]) List<FoodItem> pizza,
    @Default([]) List<FoodItem> burger,
    @Default([]) List<FoodItem> dessert,
    @Default([]) List<FoodItem> popularToday,
  }) = _Data;
  const factory HomeState.error(String? error) = _Error;
}

class HomeVM extends StateNotifier<HomeState> {
  Repository repo;

  HomeVM(ProviderReference ref)
      : repo = ref.read(repoProvider),
        super(HomeState.loading()) {
    getItems();
  }

  Future<void> getItems() async {
    final result = await repo.getFoodItems();
    List<FoodItem> pizza = [];
    List<FoodItem> burger = [];
    List<FoodItem> dessert = [];
    List<FoodItem> popularToday = [];
    if (result.isNotEmpty) {
      result.forEach((f) {
        if (f.category == 'pizza') {
          pizza.add(f);
        } else if (f.category == 'burger') {
          burger.add(f);
        } else {
          dessert.add(f);
        }

        if (f.tags!.contains('Popular Today')) {
          popularToday.add(f);
        }
      });

      state = HomeState.data(
          pizza: pizza,
          burger: burger,
          dessert: dessert,
          popularToday: popularToday);
    } else {
      state = HomeState.error('Error');
    }
  }
}
