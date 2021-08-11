import 'package:dreambitcattestapp/model/cat_image.dart';

abstract class ImageState {
  const ImageState();

  @override
  List<Object> get props => [];
}

class ImageInitial extends ImageState {}

class ImageSuccess extends ImageState {
  final List<CatImage> images;

  const ImageSuccess({
    required this.images
  });

  ImageSuccess copyWith({
    List<CatImage>? images
  }) {
    return ImageSuccess(
      images: images ?? this.images,
    );
  }

  @override
  List<Object> get props => [images];
}

class ImageUnsuccess extends ImageState{}