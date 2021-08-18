import 'package:dreambitcattestapp/model/cat_image.dart';
import 'package:dreambitcattestapp/repository/cat_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'image_event.dart';
import 'image_states.dart';

class ImageBloc extends Bloc<ImageEvent, ImagesState> {
  final CatRepository _catRepository;

  ImageBloc()
      : _catRepository = CatRepository(),
        super(ImagesInitial());

  @override
  Stream<ImagesState> mapEventToState(ImageEvent event) async*{
    if (event is GetImages) {
      yield* _mapGetCatImagesToState(event);
    }
  }

  Stream<ImagesState> _mapGetCatImagesToState(GetImages event) async* {
    String catId = event.id;
    ImagesState state;
    try{
      List<CatImage> images = await _catRepository.getCatImages(catId);
      state = ImagesLoaded(images: images);
    }
    catch(e){
      state = ImagesNotLoaded(errorMessages: e.toString());
    }
    yield state;
  }

}