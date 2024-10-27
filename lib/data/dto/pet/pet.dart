import 'package:happy_pet/data/dto/category/category.dart';
import 'package:happy_pet/data/dto/tag/tag.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pet.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class PetDTO{
  @HiveField(0)
  final int? id;
  
  @HiveField(1)
  final CategoryDTO? category;
  
  @HiveField(2)
  final String? name;
  
  @HiveField(3)
  final String? age;
  
  @HiveField(4)
  final List<String>? photoUrls;
  
  @HiveField(5)
  final List<TagDTO>? tags;
  
  @HiveField(6)
  final String? status;

  PetDTO({
    required this.name,
    this.age,
    this.id,
    this.category,
    this.photoUrls,
    this.tags,
    this.status,
  });

  factory PetDTO.fromJson(Map<String, dynamic> json) =>
      _$PetDTOFromJson(json);

  Map<String, dynamic> toJson() => _$PetDTOToJson(this);
}