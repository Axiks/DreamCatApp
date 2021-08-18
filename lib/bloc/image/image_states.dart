import 'package:dreambitcattestapp/model/cat_image.dart';

abstract class ImagesState {
  const ImagesState();
}

class ImagesInitial extends ImagesState {}

class ImagesLoaded extends ImagesState {
  final List<CatImage> images;

  const ImagesLoaded({
    required this.images
  });

  ImagesLoaded copyWith({
    List<CatImage>? images
  }) {
    return ImagesLoaded(
      images: images ?? this.images,
    );
  }
}

class ImagesNotLoaded extends ImagesState{
  final String errorMessages;
  const ImagesNotLoaded({
    required this.errorMessages
  });
}