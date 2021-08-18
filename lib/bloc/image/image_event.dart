abstract class ImageEvent {
  const ImageEvent();
}

class GetImages extends ImageEvent {
  final String id;

  const GetImages(this.id);
}