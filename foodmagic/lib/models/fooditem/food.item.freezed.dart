// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'food.item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
FoodItem _$FoodItemFromJson(Map<String, dynamic> json) {
  return _FoodItem.fromJson(json);
}

/// @nodoc
class _$FoodItemTearOff {
  const _$FoodItemTearOff();

// ignore: unused_element
  _FoodItem call(
      {String itemId,
      Category category,
      String name,
      List<String> ingredients,
      String price,
      String tag,
      String type}) {
    return _FoodItem(
      itemId: itemId,
      category: category,
      name: name,
      ingredients: ingredients,
      price: price,
      tag: tag,
      type: type,
    );
  }

// ignore: unused_element
  FoodItem fromJson(Map<String, Object> json) {
    return FoodItem.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $FoodItem = _$FoodItemTearOff();

/// @nodoc
mixin _$FoodItem {
  String get itemId;
  Category get category;
  String get name;
  List<String> get ingredients;
  String get price;
  String get tag;
  String get type;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $FoodItemCopyWith<FoodItem> get copyWith;
}

/// @nodoc
abstract class $FoodItemCopyWith<$Res> {
  factory $FoodItemCopyWith(FoodItem value, $Res Function(FoodItem) then) =
      _$FoodItemCopyWithImpl<$Res>;
  $Res call(
      {String itemId,
      Category category,
      String name,
      List<String> ingredients,
      String price,
      String tag,
      String type});

  $CategoryCopyWith<$Res> get category;
}

/// @nodoc
class _$FoodItemCopyWithImpl<$Res> implements $FoodItemCopyWith<$Res> {
  _$FoodItemCopyWithImpl(this._value, this._then);

  final FoodItem _value;
  // ignore: unused_field
  final $Res Function(FoodItem) _then;

  @override
  $Res call({
    Object itemId = freezed,
    Object category = freezed,
    Object name = freezed,
    Object ingredients = freezed,
    Object price = freezed,
    Object tag = freezed,
    Object type = freezed,
  }) {
    return _then(_value.copyWith(
      itemId: itemId == freezed ? _value.itemId : itemId as String,
      category: category == freezed ? _value.category : category as Category,
      name: name == freezed ? _value.name : name as String,
      ingredients: ingredients == freezed
          ? _value.ingredients
          : ingredients as List<String>,
      price: price == freezed ? _value.price : price as String,
      tag: tag == freezed ? _value.tag : tag as String,
      type: type == freezed ? _value.type : type as String,
    ));
  }

  @override
  $CategoryCopyWith<$Res> get category {
    if (_value.category == null) {
      return null;
    }
    return $CategoryCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value));
    });
  }
}

/// @nodoc
abstract class _$FoodItemCopyWith<$Res> implements $FoodItemCopyWith<$Res> {
  factory _$FoodItemCopyWith(_FoodItem value, $Res Function(_FoodItem) then) =
      __$FoodItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {String itemId,
      Category category,
      String name,
      List<String> ingredients,
      String price,
      String tag,
      String type});

  @override
  $CategoryCopyWith<$Res> get category;
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
    Object itemId = freezed,
    Object category = freezed,
    Object name = freezed,
    Object ingredients = freezed,
    Object price = freezed,
    Object tag = freezed,
    Object type = freezed,
  }) {
    return _then(_FoodItem(
      itemId: itemId == freezed ? _value.itemId : itemId as String,
      category: category == freezed ? _value.category : category as Category,
      name: name == freezed ? _value.name : name as String,
      ingredients: ingredients == freezed
          ? _value.ingredients
          : ingredients as List<String>,
      price: price == freezed ? _value.price : price as String,
      tag: tag == freezed ? _value.tag : tag as String,
      type: type == freezed ? _value.type : type as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_FoodItem implements _FoodItem {
  const _$_FoodItem(
      {this.itemId,
      this.category,
      this.name,
      this.ingredients,
      this.price,
      this.tag,
      this.type});

  factory _$_FoodItem.fromJson(Map<String, dynamic> json) =>
      _$_$_FoodItemFromJson(json);

  @override
  final String itemId;
  @override
  final Category category;
  @override
  final String name;
  @override
  final List<String> ingredients;
  @override
  final String price;
  @override
  final String tag;
  @override
  final String type;

  @override
  String toString() {
    return 'FoodItem(itemId: $itemId, category: $category, name: $name, ingredients: $ingredients, price: $price, tag: $tag, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FoodItem &&
            (identical(other.itemId, itemId) ||
                const DeepCollectionEquality().equals(other.itemId, itemId)) &&
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
            (identical(other.tag, tag) ||
                const DeepCollectionEquality().equals(other.tag, tag)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(itemId) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(ingredients) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(tag) ^
      const DeepCollectionEquality().hash(type);

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
      {String itemId,
      Category category,
      String name,
      List<String> ingredients,
      String price,
      String tag,
      String type}) = _$_FoodItem;

  factory _FoodItem.fromJson(Map<String, dynamic> json) = _$_FoodItem.fromJson;

  @override
  String get itemId;
  @override
  Category get category;
  @override
  String get name;
  @override
  List<String> get ingredients;
  @override
  String get price;
  @override
  String get tag;
  @override
  String get type;
  @override
  @JsonKey(ignore: true)
  _$FoodItemCopyWith<_FoodItem> get copyWith;
}

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return _Category.fromJson(json);
}

/// @nodoc
class _$CategoryTearOff {
  const _$CategoryTearOff();

// ignore: unused_element
  _Category call({dynamic categoryId, dynamic name}) {
    return _Category(
      categoryId: categoryId,
      name: name,
    );
  }

// ignore: unused_element
  Category fromJson(Map<String, Object> json) {
    return Category.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Category = _$CategoryTearOff();

/// @nodoc
mixin _$Category {
  dynamic get categoryId;
  dynamic get name;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $CategoryCopyWith<Category> get copyWith;
}

/// @nodoc
abstract class $CategoryCopyWith<$Res> {
  factory $CategoryCopyWith(Category value, $Res Function(Category) then) =
      _$CategoryCopyWithImpl<$Res>;
  $Res call({dynamic categoryId, dynamic name});
}

/// @nodoc
class _$CategoryCopyWithImpl<$Res> implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._value, this._then);

  final Category _value;
  // ignore: unused_field
  final $Res Function(Category) _then;

  @override
  $Res call({
    Object categoryId = freezed,
    Object name = freezed,
  }) {
    return _then(_value.copyWith(
      categoryId:
          categoryId == freezed ? _value.categoryId : categoryId as dynamic,
      name: name == freezed ? _value.name : name as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$CategoryCopyWith<$Res> implements $CategoryCopyWith<$Res> {
  factory _$CategoryCopyWith(_Category value, $Res Function(_Category) then) =
      __$CategoryCopyWithImpl<$Res>;
  @override
  $Res call({dynamic categoryId, dynamic name});
}

/// @nodoc
class __$CategoryCopyWithImpl<$Res> extends _$CategoryCopyWithImpl<$Res>
    implements _$CategoryCopyWith<$Res> {
  __$CategoryCopyWithImpl(_Category _value, $Res Function(_Category) _then)
      : super(_value, (v) => _then(v as _Category));

  @override
  _Category get _value => super._value as _Category;

  @override
  $Res call({
    Object categoryId = freezed,
    Object name = freezed,
  }) {
    return _then(_Category(
      categoryId: categoryId == freezed ? _value.categoryId : categoryId,
      name: name == freezed ? _value.name : name,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Category implements _Category {
  const _$_Category({this.categoryId, this.name});

  factory _$_Category.fromJson(Map<String, dynamic> json) =>
      _$_$_CategoryFromJson(json);

  @override
  final dynamic categoryId;
  @override
  final dynamic name;

  @override
  String toString() {
    return 'Category(categoryId: $categoryId, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Category &&
            (identical(other.categoryId, categoryId) ||
                const DeepCollectionEquality()
                    .equals(other.categoryId, categoryId)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(categoryId) ^
      const DeepCollectionEquality().hash(name);

  @JsonKey(ignore: true)
  @override
  _$CategoryCopyWith<_Category> get copyWith =>
      __$CategoryCopyWithImpl<_Category>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CategoryToJson(this);
  }
}

abstract class _Category implements Category {
  const factory _Category({dynamic categoryId, dynamic name}) = _$_Category;

  factory _Category.fromJson(Map<String, dynamic> json) = _$_Category.fromJson;

  @override
  dynamic get categoryId;
  @override
  dynamic get name;
  @override
  @JsonKey(ignore: true)
  _$CategoryCopyWith<_Category> get copyWith;
}
