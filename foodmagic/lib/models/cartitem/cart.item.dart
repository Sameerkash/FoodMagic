import 'package:freezed_annotation/freezed_annotation.dart';

import '../order/order.dart';

part 'cart.item.freezed.dart';
part 'cart.item.g.dart';

@freezed
class CartData with _$CartData {
  const factory CartData(
      {required String userId,
      @Default(0)
          int quantity,
      @JsonSerializable(explicitToJson: true)
      @Default([])
          List<OrderItem> cartitems,
      int? total,
      int? discount}) = _CartData;

  factory CartData.fromJson(Map<String, dynamic> json) =>
      _$CartDataFromJson(json);
}
