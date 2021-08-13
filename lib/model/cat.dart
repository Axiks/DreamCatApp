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

  @JsonKey(name: "indoor")
  int? indoor;

  @JsonKey(name: "lap")
  int? lap;

  @JsonKey(name: "adaptability")
  int? adaptability;

  @JsonKey(name: "affection_level")
  int? affectionLevel;

  @JsonKey(name: "child_friendly")
  int? childFriendly;

  @JsonKey(name: "dog_friendly")
  int? dogFriendly;

  @JsonKey(name: "energy_level")
  int? energyLevel;

  @JsonKey(name: "grooming")
  int? grooming;

  @JsonKey(name: "health_issues")
  int? healthIssues;

  @JsonKey(name: "intelligence")
  int? intelligence;

  @JsonKey(name: "shedding_level")
  int? sheddingLevel;

  @JsonKey(name: "social_needs")
  int? socialNeeds;

  @JsonKey(name: "stranger_friendly")
  int? strangerFriendly;

  @JsonKey(name: "vocalisation")
  int? vocalisation;

  @JsonKey(name: "bidability")
  int? bidability;

  @JsonKey(name: "experimental")
  int? experimental;

  @JsonKey(name: "hairless")
  int? hairless;

  @JsonKey(name: "natural")
  int? natural;

  @JsonKey(name: "rare")
  int? rare;

  @JsonKey(name: "rex")
  int? rex;

  @JsonKey(name: "suppressed_tail")
  int? suppressedTail;

  @JsonKey(name: "short_legs")
  int? shortLegs;

  @JsonKey(name: "hypoallergenic")
  int? hypoallergenic;

  @JsonKey(name: "image")
  CatImage? catImage;

  Cat();

  factory Cat.fromJson(Map<String, dynamic> json) => _$CatFromJson(json);
  Map<String, dynamic> toJson() => _$CatToJson(this);
}