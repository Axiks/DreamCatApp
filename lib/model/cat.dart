import 'package:dreambitcattestapp/model/cat_image.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cat.g.dart';

@JsonSerializable()
class Cat{
  String? id;
  String? name;
  String? description;
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

  String? origin;
  int? indoor;
  int? lap;
  int? adaptability;

  @JsonKey(name: "affection_level")
  int? affectionLevel;

  @JsonKey(name: "child_friendly")
  int? childFriendly;

  @JsonKey(name: "dog_friendly")
  int? dogFriendly;

  @JsonKey(name: "energy_level")
  int? energyLevel;

  int? grooming;

  @JsonKey(name: "health_issues")
  int? healthIssues;

  int? intelligence;

  @JsonKey(name: "shedding_level")
  int? sheddingLevel;

  @JsonKey(name: "social_needs")
  int? socialNeeds;

  @JsonKey(name: "stranger_friendly")
  int? strangerFriendly;

  int? vocalisation;
  int? bidability;
  int? experimental;
  int? hairless;
  int? natural;
  int? rare;
  int? rex;

  @JsonKey(name: "suppressed_tail")
  int? suppressedTail;

  @JsonKey(name: "short_legs")
  int? shortLegs;

  int? hypoallergenic;

  @JsonKey(name: "image")
  CatImage? catImage;

  @JsonKey(name: "reference_image_id")
  String? referenceImageId;

  Cat();

  factory Cat.fromJson(Map<String, dynamic> json) => _$CatFromJson(json);
  Map<String, dynamic> toJson() => _$CatToJson(this);
}