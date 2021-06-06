import '../fooditem/food.item.dart';
import '../user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:foodmagic/env.dart';
part 'order.freezed.dart';
part 'order.g.dart';

toNull(_) => null;

@freezed
class Order with _$Order {
  const factory Order({
    @JsonKey(name: '\$id', toJson: toNull, includeIfNull: false)
        String? orderId,
    @Default('Received') String orderStatus,
    required List<OrderFoodItem> orderItem,
    required String userId,
    required int total,
    final int? discount,
    final String? time,
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
    required int quantity,
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
    required int quantity,
    required String foodItem,
    required int subTotal,
    required String imageUrl
  }) = _OrderFoodItem;

  factory OrderFoodItem.fromJson(Map<String, dynamic> json) =>
      _$OrderFoodItemFromJson(json);
}

@freezed
class OrderDS with _$OrderDS {
  const factory OrderDS(
      {@JsonKey(name: 'documents') required List<Order> orders}) = _OrderDS;

  factory OrderDS.fromJson(Map<String, dynamic> json) =>
      _$OrderDSFromJson(json);
}
