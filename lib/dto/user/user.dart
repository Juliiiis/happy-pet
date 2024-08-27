
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class UserDTO {
  final int? id;
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final String? phone;
  final int? userStatus;

  UserDTO(
      this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.userStatus,
      {
        required this.username,
        required this.password });

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserDTOToJson(this);

}