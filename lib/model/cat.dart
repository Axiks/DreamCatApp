import 'package:dreambitcattestapp/model/cat_image.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cat.g.dart';

@JsonSerializable()
class Cat{

  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "description")
  String? description;

  @JsonKey(name: "temperament")
  String? temperament;

  @JsonKey(name: "life_span")
  String? lifeSpan;

  @JsonKey(name: "alt_names")
  String? altNames;

  @JsonKey(name: "wikipedia_url")
  String? wikipediaUrl;

  @JsonKey(name: "cfa_url")
  String? cfaUrl;

  @JsonKey(name: "vetstreet_url")
  String? vetstreetUrl;

  @JsonKey(name: "vcahospitals_url")
  String? vcahospitalsUrl;

  @JsonKey(name: "origin")
  String? origin;

  @JsonKey(name: "dog_friendly")
  int? dogFriendly;

  @JsonKey(name: "energy_level")
  int? energyLevel;

  @JsonKey(name: "intelligence")
  int? intelligence;

  @JsonKey(name: "social_needs")
  int? socialNeeds;

  @JsonKey(name: "image")
  CatImage? catImage;

  Cat();

  factory Cat.fromJson(Map<String, dynamic> json) => _$CatFromJson(json);
  Map<String, dynamic> toJson() => _$CatToJson(this);
}