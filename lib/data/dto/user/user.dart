import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class UserDTO {
  @HiveField(0)
  final int? id;
  
  @HiveField(1)
  final String? username;
  
  @HiveField(2)
  final String? firstName;
  
  @HiveField(3)
  final String? lastName;
  
  @HiveField(4)
  final String? email;
  
  @HiveField(5)
  final String? password;
  
  @HiveField(6)
  final String? phone;
  
  @HiveField(7)
  final int? userStatus;

  UserDTO({
    required this.username,
    required this.password,
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.userStatus,
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserDTOToJson(this);

  UserDTO copyWith({
    int? id,
    String? username,
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? phone,
    int? userStatus,
  }) {
    return UserDTO(
      id: id ?? this.id,
      username: username ?? this.username,
      password: password ?? this.password,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      userStatus: userStatus ?? this.userStatus,
    );
  }
}
