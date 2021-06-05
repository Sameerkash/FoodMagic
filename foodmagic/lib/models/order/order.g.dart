// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Order _$_$_OrderFromJson(Map<String, dynamic> json) {
  return _$_Order(
    orderId: json[r'$id'] as String?,
    orderStatus: json['orderStatus'] as String? ?? 'Received',
    orderItem: (json['orderItem'] as List<dynamic>)
        .map((e) => OrderFoodItem.fromJson(e as Map<String, dynamic>))
        .toList(),
    userId: json['userId'] as String,
    total: json['total'] as int,
    discount: json['discount'] as int?,
    time: json['time'] as String?,
  );
}

Map<String, dynamic> _$_$_OrderToJson(_$_Order instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(r'$id', toNull(instance.orderId));
  val['orderStatus'] = instance.orderStatus;
  val['orderItem'] = instance.orderItem.map((e) => e.toJson()).toList();
  val['userId'] = instance.userId;
  val['total'] = instance.total;
  writeNotNull('discount', instance.discount);
  writeNotNull('time', instance.time);
  return val;
}

_$_OrderItem _$_$_OrderItemFromJson(Map<String, dynamic> json) {
  return _$_OrderItem(
    collectionId: json[r'$collection'] as String,
    permissions: json[r'$permissions'] as Map<String, dynamic>,
    quantity: json['quantity'] as int,
    foodItem: FoodItem.fromJson(json['foodItem'] as Map<String, dynamic>),
    subTotal: json['subTotal'] as int,
  );
}

Map<String, dynamic> _$_$_OrderItemToJson(_$_OrderItem instance) =>
    <String, dynamic>{
      r'$collection': instance.collectionId,
      r'$permissions': instance.permissions,
      'quantity': instance.quantity,
      'foodItem': instance.foodItem.toJson(),
      'subTotal': instance.subTotal,
    };

_$_OrderFoodItem _$_$_OrderFoodItemFromJson(Map<String, dynamic> json) {
  return _$_OrderFoodItem(
    collectionId: json[r'$collection'] as String,
    permissions: json[r'$permissions'] as Map<String, dynamic>,
    quantity: json['quantity'] as int,
    foodItem: json['foodItem'] as String,
    subTotal: json['subTotal'] as int,
  );
}

Map<String, dynamic> _$_$_OrderFoodItemToJson(_$_OrderFoodItem instance) =>
    <String, dynamic>{
      r'$collection': instance.collectionId,
      r'$permissions': instance.permissions,
      'quantity': instance.quantity,
      'foodItem': instance.foodItem,
      'subTotal': instance.subTotal,
    };
