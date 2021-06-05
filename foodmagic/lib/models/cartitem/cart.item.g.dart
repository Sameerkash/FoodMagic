// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CartData _$_$_CartDataFromJson(Map<String, dynamic> json) {
  return _$_CartData(
    id: json[r'$id'] as String?,
    userId: json['userId'] as String,
    quantity: json['quantity'] as int? ?? 0,
    cartitems: (json['cartitems'] as List<dynamic>?)
            ?.map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    total: json['total'] as int?,
    discount: json['discount'] as int?,
  );
}

Map<String, dynamic> _$_$_CartDataToJson(_$_CartData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(r'$id', toNull(instance.id));
  val['userId'] = instance.userId;
  val['quantity'] = instance.quantity;
  val['cartitems'] = instance.cartitems.map((e) => e.toJson()).toList();
  writeNotNull('total', instance.total);
  writeNotNull('discount', instance.discount);
  return val;
}
