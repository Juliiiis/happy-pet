import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tag.g.dart';

@HiveType(typeId: 3)
@JsonSerializable()
class TagDTO{

  @HiveField(0)
  final int? id;

  @HiveField(1)
  final String? name;

  TagDTO(this.id, this.name);

  factory TagDTO.fromJson(Map<String, dynamic> json) =>
      _$TagDTOFromJson(json);

  Map<String, dynamic> toJson() => _$TagDTOToJson(this);
}