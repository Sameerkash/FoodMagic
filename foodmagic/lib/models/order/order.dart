import '../fooditem/food.item.dart';
import '../user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:foodmagic/env.dart';
part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class Order with _$Order {
  const factory Order({
    @JsonKey(name: '\$id') required String orderId,
    @Default('Received') String orderStatus,
    @JsonSerializable(explicitToJson: true) required List<OrderFoodItem> orderItem,
    required User user,
    required int total,
    final int? discount,
    final DateTime? time,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}

@freezed
class OrderItem with _$OrderItem {
  const factory OrderItem({
    @Default(ORDER_ITEMS_COLLECTION)
    @JsonKey(name: "\$collection")
        final String collectionId,
    @Default(rules)
    @JsonKey(name: "\$permissions")
        final Map<String, dynamic> permissions,
    required int quanity,
    @JsonSerializable(explicitToJson: true) 
    required FoodItem foodItem,
    required int subTotal,
  }) = _OrderItem;

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);
}


@freezed
class OrderFoodItem with _$OrderFoodItem {
  const factory OrderFoodItem({
    @Default(ORDER_ITEMS_COLLECTION)
    @JsonKey(name: "\$collection")
        final String collectionId,
    @Default(rules)
    @JsonKey(name: "\$permissions")
        final Map<String, dynamic> permissions,
    required int quanity,
    @JsonSerializable(explicitToJson: true) 
    required String foodItem,
    required int subTotal,
  }) = _OrderFoodItem;

  factory OrderFoodItem.fromJson(Map<String, dynamic> json) =>
      _$OrderFoodItemFromJson(json);
}
