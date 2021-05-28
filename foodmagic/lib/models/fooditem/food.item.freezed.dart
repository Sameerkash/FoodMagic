// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'food.item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FoodItem _$FoodItemFromJson(Map<String, dynamic> json) {
  return _FoodItem.fromJson(json);
}

/// @nodoc
class _$FoodItemTearOff {
  const _$FoodItemTearOff();

  _FoodItem call(
      {@JsonKey(name: '\$id', defaultValue: '', ignore: false)
          required String itemId,
      @JsonKey(name: "\$collection")
          String collectionId = CART_FOOD_ITEMS_COLLECTION,
      @JsonKey(name: "\$permissions")
          Map<String, dynamic> permissions = rules,
      required String category,
      required String name,
      List<String>? ingredients,
      required int price,
      List<String>? tags,
      String? type,
      String? style,
      int? discount,
      String? imageUrl,
      bool isEgg = false,
      bool isVeg = true}) {
    return _FoodItem(
      itemId: itemId,
      collectionId: collectionId,
      permissions: permissions,
      category: category,
      name: name,
      ingredients: ingredients,
      price: price,
      tags: tags,
      type: type,
      style: style,
      discount: discount,
      imageUrl: imageUrl,
      isEgg: isEgg,
      isVeg: isVeg,
    );
  }

  FoodItem fromJson(Map<String, Object> json) {
    return FoodItem.fromJson(json);
  }
}

/// @nodoc
const $FoodItem = _$FoodItemTearOff();

/// @nodoc
mixin _$FoodItem {
  @JsonKey(name: '\$id', defaultValue: '', ignore: false)
  String get itemId => throw _privateConstructorUsedError;
  @JsonKey(name: "\$collection")
  String get collectionId => throw _privateConstructorUsedError;
  @JsonKey(name: "\$permissions")
  Map<String, dynamic> get permissions => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<String>? get ingredients => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get style => throw _privateConstructorUsedError;
  int? get discount => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  bool get isEgg => throw _privateConstructorUsedError;
  bool get isVeg => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FoodItemCopyWith<FoodItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodItemCopyWith<$Res> {
  factory $FoodItemCopyWith(FoodItem value, $Res Function(FoodItem) then) =
      _$FoodItemCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: '\$id', defaultValue: '', ignore: false) String itemId,
      @JsonKey(name: "\$collection") String collectionId,
      @JsonKey(name: "\$permissions") Map<String, dynamic> permissions,
      String category,
      String name,
      List<String>? ingredients,
      int price,
      List<String>? tags,
      String? type,
      String? style,
      int? discount,
      String? imageUrl,
      bool isEgg,
      bool isVeg});
}

/// @nodoc
class _$FoodItemCopyWithImpl<$Res> implements $FoodItemCopyWith<$Res> {
  _$FoodItemCopyWithImpl(this._value, this._then);

  final FoodItem _value;
  // ignore: unused_field
  final $Res Function(FoodItem) _then;

  @override
  $Res call({
    Object? itemId = freezed,
    Object? collectionId = freezed,
    Object? permissions = freezed,
    Object? category = freezed,
    Object? name = freezed,
    Object? ingredients = freezed,
    Object? price = freezed,
    Object? tags = freezed,
    Object? type = freezed,
    Object? style = freezed,
    Object? discount = freezed,
    Object? imageUrl = freezed,
    Object? isEgg = freezed,
    Object? isVeg = freezed,
  }) {
    return _then(_value.copyWith(
      itemId: itemId == freezed
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      collectionId: collectionId == freezed
          ? _value.collectionId
          : collectionId // ignore: cast_nullable_to_non_nullable
              as String,
      permissions: permissions == freezed
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      ingredients: ingredients == freezed
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      style: style == freezed
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as String?,
      discount: discount == freezed
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isEgg: isEgg == freezed
          ? _value.isEgg
          : isEgg // ignore: cast_nullable_to_non_nullable
              as bool,
      isVeg: isVeg == freezed
          ? _value.isVeg
          : isVeg // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$FoodItemCopyWith<$Res> implements $FoodItemCopyWith<$Res> {
  factory _$FoodItemCopyWith(_FoodItem value, $Res Function(_FoodItem) then) =
      __$FoodItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: '\$id', defaultValue: '', ignore: false) String itemId,
      @JsonKey(name: "\$collection") String collectionId,
      @JsonKey(name: "\$permissions") Map<String, dynamic> permissions,
      String category,
      String name,
      List<String>? ingredients,
      int price,
      List<String>? tags,
      String? type,
      String? style,
      int? discount,
      String? imageUrl,
      bool isEgg,
      bool isVeg});
}

/// @nodoc
class __$FoodItemCopyWithImpl<$Res> extends _$FoodItemCopyWithImpl<$Res>
    implements _$FoodItemCopyWith<$Res> {
  __$FoodItemCopyWithImpl(_FoodItem _value, $Res Function(_FoodItem) _then)
      : super(_value, (v) => _then(v as _FoodItem));

  @override
  _FoodItem get _value => super._value as _FoodItem;

  @override
  $Res call({
    Object? itemId = freezed,
    Object? collectionId = freezed,
    Object? permissions = freezed,
    Object? category = freezed,
    Object? name = freezed,
    Object? ingredients = freezed,
    Object? price = freezed,
    Object? tags = freezed,
    Object? type = freezed,
    Object? style = freezed,
    Object? discount = freezed,
    Object? imageUrl = freezed,
    Object? isEgg = freezed,
    Object? isVeg = freezed,
  }) {
    return _then(_FoodItem(
      itemId: itemId == freezed
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      collectionId: collectionId == freezed
          ? _value.collectionId
          : collectionId // ignore: cast_nullable_to_non_nullable
              as String,
      permissions: permissions == freezed
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      ingredients: ingredients == freezed
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      style: style == freezed
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as String?,
      discount: discount == freezed
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isEgg: isEgg == freezed
          ? _value.isEgg
          : isEgg // ignore: cast_nullable_to_non_nullable
              as bool,
      isVeg: isVeg == freezed
          ? _value.isVeg
          : isVeg // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FoodItem implements _FoodItem {
  const _$_FoodItem(
      {@JsonKey(name: '\$id', defaultValue: '', ignore: false)
          required this.itemId,
      @JsonKey(name: "\$collection")
          this.collectionId = CART_FOOD_ITEMS_COLLECTION,
      @JsonKey(name: "\$permissions")
          this.permissions = rules,
      required this.category,
      required this.name,
      this.ingredients,
      required this.price,
      this.tags,
      this.type,
      this.style,
      this.discount,
      this.imageUrl,
      this.isEgg = false,
      this.isVeg = true});

  factory _$_FoodItem.fromJson(Map<String, dynamic> json) =>
      _$_$_FoodItemFromJson(json);

  @override
  @JsonKey(name: '\$id', defaultValue: '', ignore: false)
  final String itemId;
  @override
  @JsonKey(name: "\$collection")
  final String collectionId;
  @override
  @JsonKey(name: "\$permissions")
  final Map<String, dynamic> permissions;
  @override
  final String category;
  @override
  final String name;
  @override
  final List<String>? ingredients;
  @override
  final int price;
  @override
  final List<String>? tags;
  @override
  final String? type;
  @override
  final String? style;
  @override
  final int? discount;
  @override
  final String? imageUrl;
  @JsonKey(defaultValue: false)
  @override
  final bool isEgg;
  @JsonKey(defaultValue: true)
  @override
  final bool isVeg;

  @override
  String toString() {
    return 'FoodItem(itemId: $itemId, collectionId: $collectionId, permissions: $permissions, category: $category, name: $name, ingredients: $ingredients, price: $price, tags: $tags, type: $type, style: $style, discount: $discount, imageUrl: $imageUrl, isEgg: $isEgg, isVeg: $isVeg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FoodItem &&
            (identical(other.itemId, itemId) ||
                const DeepCollectionEquality().equals(other.itemId, itemId)) &&
            (identical(other.collectionId, collectionId) ||
                const DeepCollectionEquality()
                    .equals(other.collectionId, collectionId)) &&
            (identical(other.permissions, permissions) ||
                const DeepCollectionEquality()
                    .equals(other.permissions, permissions)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.ingredients, ingredients) ||
                const DeepCollectionEquality()
                    .equals(other.ingredients, ingredients)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.style, style) ||
                const DeepCollectionEquality().equals(other.style, style)) &&
            (identical(other.discount, discount) ||
                const DeepCollectionEquality()
                    .equals(other.discount, discount)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)) &&
            (identical(other.isEgg, isEgg) ||
                const DeepCollectionEquality().equals(other.isEgg, isEgg)) &&
            (identical(other.isVeg, isVeg) ||
                const DeepCollectionEquality().equals(other.isVeg, isVeg)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(itemId) ^
      const DeepCollectionEquality().hash(collectionId) ^
      const DeepCollectionEquality().hash(permissions) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(ingredients) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(tags) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(style) ^
      const DeepCollectionEquality().hash(discount) ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(isEgg) ^
      const DeepCollectionEquality().hash(isVeg);

  @JsonKey(ignore: true)
  @override
  _$FoodItemCopyWith<_FoodItem> get copyWith =>
      __$FoodItemCopyWithImpl<_FoodItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FoodItemToJson(this);
  }
}

abstract class _FoodItem implements FoodItem {
  const factory _FoodItem(
      {@JsonKey(name: '\$id', defaultValue: '', ignore: false)
          required String itemId,
      @JsonKey(name: "\$collection")
          String collectionId,
      @JsonKey(name: "\$permissions")
          Map<String, dynamic> permissions,
      required String category,
      required String name,
      List<String>? ingredients,
      required int price,
      List<String>? tags,
      String? type,
      String? style,
      int? discount,
      String? imageUrl,
      bool isEgg,
      bool isVeg}) = _$_FoodItem;

  factory _FoodItem.fromJson(Map<String, dynamic> json) = _$_FoodItem.fromJson;

  @override
  @JsonKey(name: '\$id', defaultValue: '', ignore: false)
  String get itemId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "\$collection")
  String get collectionId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "\$permissions")
  Map<String, dynamic> get permissions => throw _privateConstructorUsedError;
  @override
  String get category => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  List<String>? get ingredients => throw _privateConstructorUsedError;
  @override
  int get price => throw _privateConstructorUsedError;
  @override
  List<String>? get tags => throw _privateConstructorUsedError;
  @override
  String? get type => throw _privateConstructorUsedError;
  @override
  String? get style => throw _privateConstructorUsedError;
  @override
  int? get discount => throw _privateConstructorUsedError;
  @override
  String? get imageUrl => throw _privateConstructorUsedError;
  @override
  bool get isEgg => throw _privateConstructorUsedError;
  @override
  bool get isVeg => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FoodItemCopyWith<_FoodItem> get copyWith =>
      throw _privateConstructorUsedError;
}

FoodItemDS _$FoodItemDSFromJson(Map<String, dynamic> json) {
  return _FoodItemDS.fromJson(json);
}

/// @nodoc
class _$FoodItemDSTearOff {
  const _$FoodItemDSTearOff();

  _FoodItemDS call(
      {@JsonSerializable(explicitToJson: true)
      @JsonKey(name: 'documents')
          required List<FoodItem> items}) {
    return _FoodItemDS(
      items: items,
    );
  }

  FoodItemDS fromJson(Map<String, Object> json) {
    return FoodItemDS.fromJson(json);
  }
}

/// @nodoc
const $FoodItemDS = _$FoodItemDSTearOff();

/// @nodoc
mixin _$FoodItemDS {
  @JsonSerializable(explicitToJson: true)
  @JsonKey(name: 'documents')
  List<FoodItem> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FoodItemDSCopyWith<FoodItemDS> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodItemDSCopyWith<$Res> {
  factory $FoodItemDSCopyWith(
          FoodItemDS value, $Res Function(FoodItemDS) then) =
      _$FoodItemDSCopyWithImpl<$Res>;
  $Res call(
      {@JsonSerializable(explicitToJson: true)
      @JsonKey(name: 'documents')
          List<FoodItem> items});
}

/// @nodoc
class _$FoodItemDSCopyWithImpl<$Res> implements $FoodItemDSCopyWith<$Res> {
  _$FoodItemDSCopyWithImpl(this._value, this._then);

  final FoodItemDS _value;
  // ignore: unused_field
  final $Res Function(FoodItemDS) _then;

  @override
  $Res call({
    Object? items = freezed,
  }) {
    return _then(_value.copyWith(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<FoodItem>,
    ));
  }
}

/// @nodoc
abstract class _$FoodItemDSCopyWith<$Res> implements $FoodItemDSCopyWith<$Res> {
  factory _$FoodItemDSCopyWith(
          _FoodItemDS value, $Res Function(_FoodItemDS) then) =
      __$FoodItemDSCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonSerializable(explicitToJson: true)
      @JsonKey(name: 'documents')
          List<FoodItem> items});
}

/// @nodoc
class __$FoodItemDSCopyWithImpl<$Res> extends _$FoodItemDSCopyWithImpl<$Res>
    implements _$FoodItemDSCopyWith<$Res> {
  __$FoodItemDSCopyWithImpl(
      _FoodItemDS _value, $Res Function(_FoodItemDS) _then)
      : super(_value, (v) => _then(v as _FoodItemDS));

  @override
  _FoodItemDS get _value => super._value as _FoodItemDS;

  @override
  $Res call({
    Object? items = freezed,
  }) {
    return _then(_FoodItemDS(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<FoodItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FoodItemDS implements _FoodItemDS {
  const _$_FoodItemDS(
      {@JsonSerializable(explicitToJson: true)
      @JsonKey(name: 'documents')
          required this.items});

  factory _$_FoodItemDS.fromJson(Map<String, dynamic> json) =>
      _$_$_FoodItemDSFromJson(json);

  @override
  @JsonSerializable(explicitToJson: true)
  @JsonKey(name: 'documents')
  final List<FoodItem> items;

  @override
  String toString() {
    return 'FoodItemDS(items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FoodItemDS &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(items);

  @JsonKey(ignore: true)
  @override
  _$FoodItemDSCopyWith<_FoodItemDS> get copyWith =>
      __$FoodItemDSCopyWithImpl<_FoodItemDS>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FoodItemDSToJson(this);
  }
}

abstract class _FoodItemDS implements FoodItemDS {
  const factory _FoodItemDS(
      {@JsonSerializable(explicitToJson: true)
      @JsonKey(name: 'documents')
          required List<FoodItem> items}) = _$_FoodItemDS;

  factory _FoodItemDS.fromJson(Map<String, dynamic> json) =
      _$_FoodItemDS.fromJson;

  @override
  @JsonSerializable(explicitToJson: true)
  @JsonKey(name: 'documents')
  List<FoodItem> get items => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FoodItemDSCopyWith<_FoodItemDS> get copyWith =>
      throw _privateConstructorUsedError;
}
