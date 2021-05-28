// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'cart.item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CartData _$CartDataFromJson(Map<String, dynamic> json) {
  return _CartData.fromJson(json);
}

/// @nodoc
class _$CartDataTearOff {
  const _$CartDataTearOff();

  _CartData call(
      {required String userId,
      int quantity = 0,
      @JsonSerializable(explicitToJson: true)
          List<OrderItem> cartitems = const [],
      int? total,
      int? discount}) {
    return _CartData(
      userId: userId,
      quantity: quantity,
      cartitems: cartitems,
      total: total,
      discount: discount,
    );
  }

  CartData fromJson(Map<String, Object> json) {
    return CartData.fromJson(json);
  }
}

/// @nodoc
const $CartData = _$CartDataTearOff();

/// @nodoc
mixin _$CartData {
  String get userId => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  @JsonSerializable(explicitToJson: true)
  List<OrderItem> get cartitems => throw _privateConstructorUsedError;
  int? get total => throw _privateConstructorUsedError;
  int? get discount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartDataCopyWith<CartData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartDataCopyWith<$Res> {
  factory $CartDataCopyWith(CartData value, $Res Function(CartData) then) =
      _$CartDataCopyWithImpl<$Res>;
  $Res call(
      {String userId,
      int quantity,
      @JsonSerializable(explicitToJson: true) List<OrderItem> cartitems,
      int? total,
      int? discount});
}

/// @nodoc
class _$CartDataCopyWithImpl<$Res> implements $CartDataCopyWith<$Res> {
  _$CartDataCopyWithImpl(this._value, this._then);

  final CartData _value;
  // ignore: unused_field
  final $Res Function(CartData) _then;

  @override
  $Res call({
    Object? userId = freezed,
    Object? quantity = freezed,
    Object? cartitems = freezed,
    Object? total = freezed,
    Object? discount = freezed,
  }) {
    return _then(_value.copyWith(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      cartitems: cartitems == freezed
          ? _value.cartitems
          : cartitems // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      discount: discount == freezed
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$CartDataCopyWith<$Res> implements $CartDataCopyWith<$Res> {
  factory _$CartDataCopyWith(_CartData value, $Res Function(_CartData) then) =
      __$CartDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {String userId,
      int quantity,
      @JsonSerializable(explicitToJson: true) List<OrderItem> cartitems,
      int? total,
      int? discount});
}

/// @nodoc
class __$CartDataCopyWithImpl<$Res> extends _$CartDataCopyWithImpl<$Res>
    implements _$CartDataCopyWith<$Res> {
  __$CartDataCopyWithImpl(_CartData _value, $Res Function(_CartData) _then)
      : super(_value, (v) => _then(v as _CartData));

  @override
  _CartData get _value => super._value as _CartData;

  @override
  $Res call({
    Object? userId = freezed,
    Object? quantity = freezed,
    Object? cartitems = freezed,
    Object? total = freezed,
    Object? discount = freezed,
  }) {
    return _then(_CartData(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      cartitems: cartitems == freezed
          ? _value.cartitems
          : cartitems // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      discount: discount == freezed
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CartData implements _CartData {
  const _$_CartData(
      {required this.userId,
      this.quantity = 0,
      @JsonSerializable(explicitToJson: true) this.cartitems = const [],
      this.total,
      this.discount});

  factory _$_CartData.fromJson(Map<String, dynamic> json) =>
      _$_$_CartDataFromJson(json);

  @override
  final String userId;
  @JsonKey(defaultValue: 0)
  @override
  final int quantity;
  @JsonKey(defaultValue: const [])
  @override
  @JsonSerializable(explicitToJson: true)
  final List<OrderItem> cartitems;
  @override
  final int? total;
  @override
  final int? discount;

  @override
  String toString() {
    return 'CartData(userId: $userId, quantity: $quantity, cartitems: $cartitems, total: $total, discount: $discount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CartData &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.quantity, quantity) ||
                const DeepCollectionEquality()
                    .equals(other.quantity, quantity)) &&
            (identical(other.cartitems, cartitems) ||
                const DeepCollectionEquality()
                    .equals(other.cartitems, cartitems)) &&
            (identical(other.total, total) ||
                const DeepCollectionEquality().equals(other.total, total)) &&
            (identical(other.discount, discount) ||
                const DeepCollectionEquality()
                    .equals(other.discount, discount)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(quantity) ^
      const DeepCollectionEquality().hash(cartitems) ^
      const DeepCollectionEquality().hash(total) ^
      const DeepCollectionEquality().hash(discount);

  @JsonKey(ignore: true)
  @override
  _$CartDataCopyWith<_CartData> get copyWith =>
      __$CartDataCopyWithImpl<_CartData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CartDataToJson(this);
  }
}

abstract class _CartData implements CartData {
  const factory _CartData(
      {required String userId,
      int quantity,
      @JsonSerializable(explicitToJson: true) List<OrderItem> cartitems,
      int? total,
      int? discount}) = _$_CartData;

  factory _CartData.fromJson(Map<String, dynamic> json) = _$_CartData.fromJson;

  @override
  String get userId => throw _privateConstructorUsedError;
  @override
  int get quantity => throw _privateConstructorUsedError;
  @override
  @JsonSerializable(explicitToJson: true)
  List<OrderItem> get cartitems => throw _privateConstructorUsedError;
  @override
  int? get total => throw _privateConstructorUsedError;
  @override
  int? get discount => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CartDataCopyWith<_CartData> get copyWith =>
      throw _privateConstructorUsedError;
}
