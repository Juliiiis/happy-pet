import 'package:happy_pet/data/dto/category/category.dart';
import 'package:happy_pet/data/dto/tag/tag.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pet.g.dart';

@JsonSerializable()
class PetDTO{
  final int id;
  final CategoryDTO? category;
  final String name;
  final List<String>? photoUrls;
  final List<TagDTO>? tags;
  final String? status;

  PetDTO({
    required this.id,
    required this.name,
    this.category,
    this.photoUrls,
    this.tags,
    this.status,
  });

  factory PetDTO.fromJson(Map<String, dynamic> json) =>
      _$PetDTOFromJson(json);

  Map<String, dynamic> toJson() => _$PetDTOToJson(this);
}