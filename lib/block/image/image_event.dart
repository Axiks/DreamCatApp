abstract class ImageEvent {
  const ImageEvent();

  @override
  List<Object> get props => [];
}

class GetImages extends ImageEvent {
  final String id;

  const GetImages(this.id);

  @override
  List<Object> get props => [id];
}