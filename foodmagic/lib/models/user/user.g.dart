// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return _$_User(
    userId: json[r'$id'] as String,
    name: json['name'] as String?,
    email: json['email'] as String,
    phone: json['phone'] as String?,
    address: json['address'] as String?,
    imageUrl: json['imageUrl'] as String?,
    bio: json['bio'] as String?,
    wallet: json['wallet'] as int? ?? 0,
  );
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) {
  final val = <String, dynamic>{
    r'$id': instance.userId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  val['email'] = instance.email;
  writeNotNull('phone', instance.phone);
  writeNotNull('address', instance.address);
  writeNotNull('imageUrl', instance.imageUrl);
  writeNotNull('bio', instance.bio);
  val['wallet'] = instance.wallet;
  return val;
}
