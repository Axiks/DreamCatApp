import 'package:json_annotation/json_annotation.dart';

import 'image.dart';

part 'cat.g.dart';

@JsonSerializable()
class Cat{

  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "temperament")
  String? temperament;

  @JsonKey(name: "life_span")
  String? lifeSpan;

  @JsonKey(name: "alt_names")
  String? altNames;

  @JsonKey(name: "wikipedia_url")
  String? wikipediaUrl;

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
  Image? image;

  Cat();

  factory Cat.fromJson(Map<String, dynamic> json) => _$CatFromJson(json);
  Map<String, dynamic> toJson() => _$CatToJson(this);
}