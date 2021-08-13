// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cat _$CatFromJson(Map<String, dynamic> json) {
  return Cat()
    ..id = json['id'] as String?
    ..name = json['name'] as String?
    ..description = json['description'] as String?
    ..temperament = json['temperament'] as String?
    ..lifeSpan = json['life_span'] as String?
    ..altNames = json['alt_names'] as String?
    ..wikipediaUrl = json['wikipedia_url'] as String?
    ..cfaUrl = json['cfa_url'] as String?
    ..vetstreetUrl = json['vetstreet_url'] as String?
    ..vcahospitalsUrl = json['vcahospitals_url'] as String?
    ..origin = json['origin'] as String?
    ..indoor = json['indoor'] as int?
    ..lap = json['lap'] as int?
    ..adaptability = json['adaptability'] as int?
    ..affectionLevel = json['affection_level'] as int?
    ..childFriendly = json['child_friendly'] as int?
    ..dogFriendly = json['dog_friendly'] as int?
    ..energyLevel = json['energy_level'] as int?
    ..grooming = json['grooming'] as int?
    ..healthIssues = json['health_issues'] as int?
    ..intelligence = json['intelligence'] as int?
    ..sheddingLevel = json['shedding_level'] as int?
    ..socialNeeds = json['social_needs'] as int?
    ..strangerFriendly = json['stranger_friendly'] as int?
    ..vocalisation = json['vocalisation'] as int?
    ..bidability = json['bidability'] as int?
    ..experimental = json['experimental'] as int?
    ..hairless = json['hairless'] as int?
    ..natural = json['natural'] as int?
    ..rare = json['rare'] as int?
    ..rex = json['rex'] as int?
    ..suppressedTail = json['suppressed_tail'] as int?
    ..shortLegs = json['short_legs'] as int?
    ..hypoallergenic = json['hypoallergenic'] as int?
    ..catImage = json['image'] == null
        ? null
        : CatImage.fromJson(json['image'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CatToJson(Cat instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'temperament': instance.temperament,
      'life_span': instance.lifeSpan,
      'alt_names': instance.altNames,
      'wikipedia_url': instance.wikipediaUrl,
      'cfa_url': instance.cfaUrl,
      'vetstreet_url': instance.vetstreetUrl,
      'vcahospitals_url': instance.vcahospitalsUrl,
      'origin': instance.origin,
      'indoor': instance.indoor,
      'lap': instance.lap,
      'adaptability': instance.adaptability,
      'affection_level': instance.affectionLevel,
      'child_friendly': instance.childFriendly,
      'dog_friendly': instance.dogFriendly,
      'energy_level': instance.energyLevel,
      'grooming': instance.grooming,
      'health_issues': instance.healthIssues,
      'intelligence': instance.intelligence,
      'shedding_level': instance.sheddingLevel,
      'social_needs': instance.socialNeeds,
      'stranger_friendly': instance.strangerFriendly,
      'vocalisation': instance.vocalisation,
      'bidability': instance.bidability,
      'experimental': instance.experimental,
      'hairless': instance.hairless,
      'natural': instance.natural,
      'rare': instance.rare,
      'rex': instance.rex,
      'suppressed_tail': instance.suppressedTail,
      'short_legs': instance.shortLegs,
      'hypoallergenic': instance.hypoallergenic,
      'image': instance.catImage,
    };
