import 'package:freezed_annotation/freezed_annotation.dart';

import '../order/order.dart';

part 'cart.item.freezed.dart';
part 'cart.item.g.dart';

toNull(_) => null;

@freezed
class CartData with _$CartData {
  const factory CartData(
      {@JsonKey(name: '\$id', toJson: toNull, includeIfNull: false)
          String? id,
      required String userId,
      @Default(0)
          int quantity,
      @Default([])
          List<OrderItem> cartitems,
      int? total,
      int? discount}) = _CartData;

  factory CartData.fromJson(Map<String, dynamic> json) =>
      _$CartDataFromJson(json);
}
