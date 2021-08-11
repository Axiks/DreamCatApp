import 'package:dreambitcattestapp/model/cat_image.dart';
import 'package:dreambitcattestapp/repository/cat_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'image_event.dart';
import 'image_states.dart';

class ImageBlock extends Bloc<ImageEvent, ImageState> {
  ImageBlock(ImageState catState) : super(ImageInitial());

  @override
  Stream<ImageState> mapEventToState(ImageEvent event) async*{
    print("Block map event to state: " + event.toString());
    if (event is GetImages) {
      yield* _mapGetCatImagesToState(event);
    }
    else{
      yield* _mapUnsuccessToState();
    }
  }

  // Stream<CatSuccess> _mapGetAllCatsToState(AllCats event) async* {
  //   print("Get all cats");
  //   CatRepository catRepository = CatRepository();
  //   List<Cat> cats = await catRepository.getAll();
  //   CatSuccess state = CatSuccess(cats: cats);
  //   yield state;
  // }

  // Stream<CatSuccess> _mapGetCatToState(GetCat event) async* {
  //   String catId = event.id;
  //   print("Cat ID: " + catId.toString());
  //   CatRepository catRepository = CatRepository();
  //   //Fix
  //   Cat? cat = await catRepository.getCat(catId);
  //   List<Cat> cats = [];
  //   if(cat != null){
  //     cats.add(cat);
  //   }
  //   CatSuccess state = CatSuccess(cats: cats);
  //   yield state;
  // }

  Stream<ImageSuccess> _mapGetCatImagesToState(GetImages event) async* {
    String catId = event.id;
    CatRepository catRepository = CatRepository();

    List<CatImage> images = await catRepository.getCatImages(catId);

    ImageSuccess state = ImageSuccess(images: images);
    yield state;
  }

  Stream<ImageUnsuccess> _mapUnsuccessToState() async* {
    ImageUnsuccess state = ImageUnsuccess();
    yield state;
  }

}