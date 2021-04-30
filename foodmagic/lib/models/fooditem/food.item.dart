import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'food.item.g.dart';

@JsonSerializable()
class FoodItem extends Equatable {
  final String itemId;
  final Category category;
  final String name;
  final List<String> ingredients;
  final String price;
  final String tag;
  final String type;
  FoodItem(
      {this.itemId,
      this.category,
      this.name,
      this.ingredients,
      this.price,
      this.tag,
      this.type});

  @override
  List<Object> get props => [name];

  @override
  bool get stringify => true;

  factory FoodItem.fromJson(Map<String, dynamic> json) =>
      _$FoodItemFromJson(json);

  Map<String, dynamic> toJson() => _$FoodItemToJson(this);
}

@JsonSerializable()

class Category extends Equatable {
  final String categoryId;
  final String name;
  Category({
    this.categoryId,
    this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  @override
  List<Object> get props => [name, categoryId];

  @override
  bool get stringify => true;
}
