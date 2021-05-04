import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

/// [AppUser] data class

@freezed
class User with _$User {
  const factory User({
    required String userId,
    final String? userName,
    required String email,
    final String? phone,
    final String? address,
    final String? imageUrl,
    final String? bio,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
