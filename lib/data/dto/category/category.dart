import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@HiveType(typeId: 2)
@JsonSerializable()
class CategoryDTO {

  @HiveField(0)
  final int? id;

  @HiveField(1)
  final String? name;

  CategoryDTO(this.id, this.name);

  factory CategoryDTO.fromJson(Map<String, dynamic> json) =>
      _$CategoryDTOFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDTOToJson(this);
}
