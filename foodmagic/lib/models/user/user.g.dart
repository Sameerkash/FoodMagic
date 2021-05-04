// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return _$_User(
    userId: json['userId'] as String,
    userName: json['userName'] as String?,
    email: json['email'] as String,
    phone: json['phone'] as String?,
    address: json['address'] as String?,
    imageUrl: json['imageUrl'] as String?,
    bio: json['bio'] as String?,
  );
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) => <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
      'imageUrl': instance.imageUrl,
      'bio': instance.bio,
    };
