import 'package:dreambitcattestapp/block/cat/cat_event.dart';
import 'package:dreambitcattestapp/block/cat/cat_states.dart';
import 'package:dreambitcattestapp/model/cat.dart';
import 'package:dreambitcattestapp/repository/cat_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatBlock extends Bloc<CatEvent, CatState> {
  CatBlock(CatState catState) : super(CatInitial());

  @override
  Stream<CatState> mapEventToState(CatEvent event) async*{
    print("Block map event to state: " + event.toString());
    if (event is AllCats) {
      yield* _mapGetAllCatsToState(event);
    }
    // else if (event is GetCat){
    //   yield* _mapGetCatToState(event);
    // }
    // else if(event is GetCatImages){
    //   yield* _mapGetCatImagesToState(event);
    // }
    else{
      yield* _mapUnsuccessToState();
    }
  }

  Stream<CatSuccess> _mapGetAllCatsToState(AllCats event) async* {
    print("Get all cats");
    CatRepository catRepository = CatRepository();
    List<Cat> cats = await catRepository.getAll();
    CatSuccess state = CatSuccess(cats: cats);
    yield state;
  }

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

  // Stream<CatSuccess> _mapGetCatImagesToState(GetCatImages event) async* {
  //   String catId = event.id;
  //   CatRepository catRepository = CatRepository();
  //
  //   List<Image?> images = await catRepository.getCatImages(catId);
  //   //Fix
  //   Cat? cat = await catRepository.getCat(catId);
  //   List<Cat> cats = [];
  //   if(cat != null){
  //     cats.add(cat);
  //   }
  //   CatSuccess state = CatSuccess(cats: cats);
  //   yield state;
  //}

  Stream<CatUnsuccess> _mapUnsuccessToState() async* {
    CatUnsuccess state = CatUnsuccess();
    yield state;
  }

}