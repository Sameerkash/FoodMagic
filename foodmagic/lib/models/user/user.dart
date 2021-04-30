import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';
/// [AppUser] data class
@JsonSerializable()
class AppUser extends Equatable {
  final String userId;
  final String userName;
  final String email;
  final String phone;
  final String adress;
  final String imageUrl;
  final String bio;
  AppUser({
    this.userId,
    this.userName,
    this.email,
    this.phone,
    this.adress,
    this.imageUrl,
    this.bio,
  });

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);

  Map<String, dynamic> toJson() => _$AppUserToJson(this);
  @override
  List<Object> get props =>
      [userId, userName, email, phone, adress, imageUrl, bio];

  @override
  bool get stringify => true;
}
