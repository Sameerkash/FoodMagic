// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food.item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FoodItem _$_$_FoodItemFromJson(Map<String, dynamic> json) {
  return _$_FoodItem(
    itemId: json[r'$id'] as String? ?? '',
    category: json['category'] as String,
    name: json['name'] as String,
    ingredients: (json['ingredients'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    price: json['price'] as int,
    tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
    type: json['type'] as String?,
    style: json['style'] as String?,
    discount: json['discount'] as int?,
    imageUrl: json['imageUrl'] as String?,
    isEgg: json['isEgg'] as bool? ?? false,
    isVeg: json['isVeg'] as bool? ?? true,
  );
}

Map<String, dynamic> _$_$_FoodItemToJson(_$_FoodItem instance) {
  final val = <String, dynamic>{
    r'$id': instance.itemId,
    'category': instance.category,
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ingredients', instance.ingredients);
  val['price'] = instance.price;
  writeNotNull('tags', instance.tags);
  writeNotNull('type', instance.type);
  writeNotNull('style', instance.style);
  writeNotNull('discount', instance.discount);
  writeNotNull('imageUrl', instance.imageUrl);
  val['isEgg'] = instance.isEgg;
  val['isVeg'] = instance.isVeg;
  return val;
}

_$_FoodItemDS _$_$_FoodItemDSFromJson(Map<String, dynamic> json) {
  return _$_FoodItemDS(
    items: (json['documents'] as List<dynamic>)
        .map((e) => FoodItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_FoodItemDSToJson(_$_FoodItemDS instance) =>
    <String, dynamic>{
      'documents': instance.items.map((e) => e.toJson()).toList(),
    };
