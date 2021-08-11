import 'package:json_annotation/json_annotation.dart';

part 'cat_image.g.dart';

@JsonSerializable()
class CatImage {

  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "width")
  int? width;

  @JsonKey(name: "height")
  int? height;

  @JsonKey(name: "url")
  String? url;

  CatImage();

  factory CatImage.fromJson(Map<String, dynamic> json) => _$CatImageFromJson(json);
  Map<String, dynamic> toJson() => _$CatImageToJson(this);
}