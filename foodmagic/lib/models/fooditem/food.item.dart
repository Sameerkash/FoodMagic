import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'food.item.freezed.dart';
part 'food.item.g.dart';

@freezed
class FoodItem with _$FoodItem {
  const factory FoodItem({
    required String itemId,
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
