// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
AppUser _$AppUserFromJson(Map<String, dynamic> json) {
  return _AppUser.fromJson(json);
}

/// @nodoc
class _$AppUserTearOff {
  const _$AppUserTearOff();

// ignore: unused_element
  _AppUser call(
      {String userId,
      String userName,
      String email,
      String phone,
      String adress,
      String imageUrl,
      String bio}) {
    return _AppUser(
      userId: userId,
      userName: userName,
      email: email,
      phone: phone,
      adress: adress,
      imageUrl: imageUrl,
      bio: bio,
    );
  }

// ignore: unused_element
  AppUser fromJson(Map<String, Object> json) {
    return AppUser.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $AppUser = _$AppUserTearOff();

/// @nodoc
mixin _$AppUser {
  String get userId;
  String get userName;
  String get email;
  String get phone;
  String get adress;
  String get imageUrl;
  String get bio;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $AppUserCopyWith<AppUser> get copyWith;
}

/// @nodoc
abstract class $AppUserCopyWith<$Res> {
  factory $AppUserCopyWith(AppUser value, $Res Function(AppUser) then) =
      _$AppUserCopyWithImpl<$Res>;
  $Res call(
      {String userId,
      String userName,
      String email,
      String phone,
      String adress,
      String imageUrl,
      String bio});
}

/// @nodoc
class _$AppUserCopyWithImpl<$Res> implements $AppUserCopyWith<$Res> {
  _$AppUserCopyWithImpl(this._value, this._then);

  final AppUser _value;
  // ignore: unused_field
  final $Res Function(AppUser) _then;

  @override
  $Res call({
    Object userId = freezed,
    Object userName = freezed,
    Object email = freezed,
    Object phone = freezed,
    Object adress = freezed,
    Object imageUrl = freezed,
    Object bio = freezed,
  }) {
    return _then(_value.copyWith(
      userId: userId == freezed ? _value.userId : userId as String,
      userName: userName == freezed ? _value.userName : userName as String,
      email: email == freezed ? _value.email : email as String,
      phone: phone == freezed ? _value.phone : phone as String,
      adress: adress == freezed ? _value.adress : adress as String,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
      bio: bio == freezed ? _value.bio : bio as String,
    ));
  }
}

/// @nodoc
abstract class _$AppUserCopyWith<$Res> implements $AppUserCopyWith<$Res> {
  factory _$AppUserCopyWith(_AppUser value, $Res Function(_AppUser) then) =
      __$AppUserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String userId,
      String userName,
      String email,
      String phone,
      String adress,
      String imageUrl,
      String bio});
}

/// @nodoc
class __$AppUserCopyWithImpl<$Res> extends _$AppUserCopyWithImpl<$Res>
    implements _$AppUserCopyWith<$Res> {
  __$AppUserCopyWithImpl(_AppUser _value, $Res Function(_AppUser) _then)
      : super(_value, (v) => _then(v as _AppUser));

  @override
  _AppUser get _value => super._value as _AppUser;

  @override
  $Res call({
    Object userId = freezed,
    Object userName = freezed,
    Object email = freezed,
    Object phone = freezed,
    Object adress = freezed,
    Object imageUrl = freezed,
    Object bio = freezed,
  }) {
    return _then(_AppUser(
      userId: userId == freezed ? _value.userId : userId as String,
      userName: userName == freezed ? _value.userName : userName as String,
      email: email == freezed ? _value.email : email as String,
      phone: phone == freezed ? _value.phone : phone as String,
      adress: adress == freezed ? _value.adress : adress as String,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
      bio: bio == freezed ? _value.bio : bio as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_AppUser implements _AppUser {
  const _$_AppUser(
      {this.userId,
      this.userName,
      this.email,
      this.phone,
      this.adress,
      this.imageUrl,
      this.bio});

  factory _$_AppUser.fromJson(Map<String, dynamic> json) =>
      _$_$_AppUserFromJson(json);

  @override
  final String userId;
  @override
  final String userName;
  @override
  final String email;
  @override
  final String phone;
  @override
  final String adress;
  @override
  final String imageUrl;
  @override
  final String bio;

  @override
  String toString() {
    return 'AppUser(userId: $userId, userName: $userName, email: $email, phone: $phone, adress: $adress, imageUrl: $imageUrl, bio: $bio)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AppUser &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.userName, userName) ||
                const DeepCollectionEquality()
                    .equals(other.userName, userName)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.adress, adress) ||
                const DeepCollectionEquality().equals(other.adress, adress)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)) &&
            (identical(other.bio, bio) ||
                const DeepCollectionEquality().equals(other.bio, bio)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(userName) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(adress) ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(bio);

  @JsonKey(ignore: true)
  @override
  _$AppUserCopyWith<_AppUser> get copyWith =>
      __$AppUserCopyWithImpl<_AppUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AppUserToJson(this);
  }
}

abstract class _AppUser implements AppUser {
  const factory _AppUser(
      {String userId,
      String userName,
      String email,
      String phone,
      String adress,
      String imageUrl,
      String bio}) = _$_AppUser;

  factory _AppUser.fromJson(Map<String, dynamic> json) = _$_AppUser.fromJson;

  @override
  String get userId;
  @override
  String get userName;
  @override
  String get email;
  @override
  String get phone;
  @override
  String get adress;
  @override
  String get imageUrl;
  @override
  String get bio;
  @override
  @JsonKey(ignore: true)
  _$AppUserCopyWith<_AppUser> get copyWith;
}
