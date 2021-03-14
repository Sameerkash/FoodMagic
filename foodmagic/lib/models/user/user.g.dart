// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppUser _$_$_AppUserFromJson(Map<String, dynamic> json) {
  return _$_AppUser(
    userId: json['userId'] as String,
    userName: json['userName'] as String,
    email: json['email'] as String,
    phone: json['phone'] as String,
    adress: json['adress'] as String,
    imageUrl: json['imageUrl'] as String,
    bio: json['bio'] as String,
  );
}

Map<String, dynamic> _$_$_AppUserToJson(_$_AppUser instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'email': instance.email,
      'phone': instance.phone,
      'adress': instance.adress,
      'imageUrl': instance.imageUrl,
      'bio': instance.bio,
    };
