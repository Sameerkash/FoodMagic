

import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@freezed

/// [AppUser] data class
abstract class AppUser with _$AppUser {
  const factory AppUser({
    String userId,
    String userName,
    String email,
    String phone,
    String adress,
    String imageUrl,
    String bio,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);

  Map<String, dynamic> toJson() => _$_$_AppUserToJson(this);
}