import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../env.dart';

part 'food.item.freezed.dart';
part 'food.item.g.dart';

@freezed
class FoodItem with _$FoodItem {
  const factory FoodItem({
    @JsonKey(name: '\$id', defaultValue: '', ignore: false)
        required String itemId,
    @Default(CART_FOOD_ITEMS_COLLECTION)
    @JsonKey(name: "\$collection")
        final String collectionId,
    @Default(rules)
    @JsonKey(name: "\$permissions")
        final Map<String, dynamic> permissions,
    required String category,
    required String name,
    final List<String>? ingredients,
    required int price,
    final List<String>? tags,
    final String? type,
    final String? style,
    final int? discount,
    final String? imageUrl,
    @Default(false) final bool isEgg,
    @Default(true) final bool isVeg,
  }) = _FoodItem;

  factory FoodItem.fromJson(Map<String, dynamic> json) =>
      _$FoodItemFromJson(json);
}

@freezed
class FoodItemDS with _$FoodItemDS {
  const factory FoodItemDS(
      {@JsonSerializable(explicitToJson: true)
      @JsonKey(name: 'documents')
          required List<FoodItem> items}) = _FoodItemDS;

  factory FoodItemDS.fromJson(Map<String, dynamic> json) =>
      _$FoodItemDSFromJson(json);
}
