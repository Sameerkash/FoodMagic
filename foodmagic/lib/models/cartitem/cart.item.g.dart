// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CartData _$_$_CartDataFromJson(Map<String, dynamic> json) {
  return _$_CartData(
    quantity: json['quantity'] as int? ?? 0,
    cartitems: (json['cartitems'] as List<dynamic>?)
            ?.map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    total: json['total'] as int?,
    discount: json['discount'] as int?,
  );
}

Map<String, dynamic> _$_$_CartDataToJson(_$_CartData instance) =>
    <String, dynamic>{
      'quantity': instance.quantity,
      'cartitems': instance.cartitems,
      'total': instance.total,
      'discount': instance.discount,
    };
