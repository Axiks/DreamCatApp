// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatImage _$CatImageFromJson(Map<String, dynamic> json) {
  return CatImage()
    ..id = json['id'] as String?
    ..width = json['width'] as int?
    ..height = json['height'] as int?
    ..url = json['url'] as String?;
}

Map<String, dynamic> _$CatImageToJson(CatImage instance) => <String, dynamic>{
      'id': instance.id,
      'width': instance.width,
      'height': instance.height,
      'url': instance.url,
    };
