import 'package:json_annotation/json_annotation.dart';

part 'api_response_body.g.dart';

@JsonSerializable()
class ApiResponseBodyDTO {
  final int code;
  final String type;
  final String message;

  ApiResponseBodyDTO({
    required this.code,
    required this.type,
    required this.message});

  factory ApiResponseBodyDTO.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseBodyDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ApiResponseBodyDTOToJson(this);
}