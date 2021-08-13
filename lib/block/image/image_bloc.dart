import 'package:dreambitcattestapp/model/cat_image.dart';
import 'package:dreambitcattestapp/repository/cat_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'image_event.dart';
import 'image_states.dart';

class ImageBlock extends Bloc<ImageEvent, ImageState> {
  ImageBlock(ImageState catState) : super(ImageInitial());

  @override
  Stream<ImageState> mapEventToState(ImageEvent event) async*{
    if (event is GetImages) {
      yield* _mapGetCatImagesToState(event);
    }
    else{
      yield* _mapUnsuccessToState();
    }
  }

  Stream<ImageState> _mapGetCatImagesToState(GetImages event) async* {
    String catId = event.id;
    ImageState state;
    CatRepository catRepository = CatRepository();
    try{
      List<CatImage> images = await catRepository.getCatImages(catId);
      state = ImageSuccess(images: images);
    }
    catch(e){
      state = ImageUnsuccess(errorMessages: e.toString());
    }
    yield state;
  }

  Stream<ImageUnsuccess> _mapUnsuccessToState() async* {
    ImageUnsuccess state = ImageUnsuccess(errorMessages: "Unknown error");
    yield state;
  }

}