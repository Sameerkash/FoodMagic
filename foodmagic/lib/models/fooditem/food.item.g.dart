// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food.item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FoodItem _$_$_FoodItemFromJson(Map<String, dynamic> json) {
  return _$_FoodItem(
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

Map<String, dynamic> _$_$_FoodItemToJson(_$_FoodItem instance) =>
    <String, dynamic>{
      'itemId': instance.itemId,
      'category': instance.category,
      'name': instance.name,
      'ingredients': instance.ingredients,
      'price': instance.price,
      'tag': instance.tag,
      'type': instance.type,
    };

_$_Category _$_$_CategoryFromJson(Map<String, dynamic> json) {
  return _$_Category(
    categoryId: json['categoryId'],
    name: json['name'],
  );
}

Map<String, dynamic> _$_$_CategoryToJson(_$_Category instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'name': instance.name,
    };
