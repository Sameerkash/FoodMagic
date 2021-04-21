import 'package:freezed_annotation/freezed_annotation.dart';

part 'food.item.freezed.dart';
part 'food.item.g.dart';

@freezed
abstract class FoodItem with _$FoodItem {
  const factory FoodItem(
      {String itemId,
      Category category,
      String name,
      List<String> ingredients,
      String price,
      String tag,
      String type
      }) = _FoodItem;

  factory FoodItem.fromJson(Map<String, dynamic> json) =>
      _$FoodItemFromJson(json);

  Map<String, dynamic> toJson() => _$_$_FoodItemToJson(this);
}

@freezed
abstract class Category with _$Category {
  const factory Category({
    categoryId,
    name,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$_$_CategoryToJson(this);
}
