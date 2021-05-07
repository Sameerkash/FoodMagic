
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'food.item.g.dart';
<<<<<<< HEAD
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
=======

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
>>>>>>> ddb64fe65b4c3680f5945a3a034f8288cda654bf

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
