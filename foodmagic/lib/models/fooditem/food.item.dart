
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'food.item.g.dart';
part 'food.item.freezed.dart';

@freezed
class FoodItem with _$FoodItem {
  const factory FoodItem({
    required String itemId,
    required Category category,
    required String name,
    final List<String>? ingredients,
    required String price,
    final String? tag,
    final String? type,
  }) = _FoodItem;

  factory FoodItem.fromJson(Map<String, dynamic> json) =>
      _$FoodItemFromJson(json);


}

@freezed
class Category with _$Category {
  const factory Category({
    required String categoryId,
    final String? name,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
