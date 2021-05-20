import '../fooditem/food.item.dart';
import '../user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class Order with _$Order {
  const factory Order({
    required String orderId,
    @JsonSerializable(explicitToJson: true)
    required OrderItem orderItem,
    required User user,
    required int total,
    final int? discount,
    final DateTime? time,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  // Map<String, dynamic> toJson() => _$_$_OrderToJson();
}

@freezed
class OrderItem with _$OrderItem {
  const factory OrderItem({
    required int quanity,
    @JsonSerializable(explicitToJson: true)
    required FoodItem foodItem,
    required int subTotal,
  }) = _OrderItem;

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);
}
