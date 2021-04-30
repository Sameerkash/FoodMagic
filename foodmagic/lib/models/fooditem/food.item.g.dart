// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food.item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodItem _$FoodItemFromJson(Map<String, dynamic> json) {
  return FoodItem(
    itemId: json['itemId'] as String,
    category: json['category'] == null
        ? null
        : Category.fromJson(json['category'] as Map<String, dynamic>),
    name: json['name'] as String,
    ingredients:
        (json['ingredients'] as List)?.map((e) => e as String)?.toList(),
    price: json['price'] as String,
    tag: json['tag'] as String,
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$FoodItemToJson(FoodItem instance) => <String, dynamic>{
      'itemId': instance.itemId,
      'category': instance.category,
      'name': instance.name,
      'ingredients': instance.ingredients,
      'price': instance.price,
      'tag': instance.tag,
      'type': instance.type,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category(
    categoryId: json['categoryId'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'categoryId': instance.categoryId,
      'name': instance.name,
    };
