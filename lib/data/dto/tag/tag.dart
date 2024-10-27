import 'package:json_annotation/json_annotation.dart';

part 'tag.g.dart';

@JsonSerializable()
class TagDTO{
  final int? id;
  final String? name;

  TagDTO(this.id, this.name);

  factory TagDTO.fromJson(Map<String, dynamic> json) =>
      _$TagDTOFromJson(json);

  Map<String, dynamic> toJson() => _$TagDTOToJson(this);
}