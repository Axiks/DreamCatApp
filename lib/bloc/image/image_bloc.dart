import 'package:dreambitcattestapp/model/cat_image.dart';
import 'package:dreambitcattestapp/repository/cat_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'image_event.dart';
import 'image_states.dart';

class ImageBloc extends Bloc<ImageEvent, ImagesState> {
  ImageBloc(ImagesState catState) : super(ImagesInitial());

  @override
  Stream<ImagesState> mapEventToState(ImageEvent event) async*{
    if (event is GetImages) {
      yield* _mapGetCatImagesToState(event);
    }
    else{
      yield* _mapUnsuccessToState();
    }
  }

  Stream<ImagesState> _mapGetCatImagesToState(GetImages event) async* {
    String catId = event.id;
    ImagesState state;
    CatRepository catRepository = CatRepository();
    try{
      List<CatImage> images = await catRepository.getCatImages(catId);
      state = ImagesLoaded(images: images);
    }
    catch(e){
      state = ImagesNotLoaded(errorMessages: e.toString());
    }
    yield state;
  }

  Stream<ImagesNotLoaded> _mapUnsuccessToState() async* {
    ImagesNotLoaded state = ImagesNotLoaded(errorMessages: "Unknown error");
    yield state;
  }

}