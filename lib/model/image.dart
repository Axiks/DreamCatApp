import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable()
class Image {

  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "width")
  int? width;

  @JsonKey(name: "height")
  int? height;

  @JsonKey(name: "url")
  String? url;

  Image();

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
  Map<String, dynamic> toJson() => _$ImageToJson(this);
}