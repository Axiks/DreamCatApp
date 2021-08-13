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
    else{
      yield* _mapUnsuccessToState();
    }
  }

  Stream<CatState> _mapGetAllCatsToState(AllCats event) async* {
    CatState state;
    print("Get all cats");
    CatRepository catRepository = CatRepository();
    try{
      List<Cat> cats = await catRepository.getAll();
      state = CatSuccess(cats: cats);
    }
    catch(e){
      state = CatUnsuccess(errorMessages: e.toString());
    }
    yield state;
  }

  Stream<CatUnsuccess> _mapUnsuccessToState() async* {
    CatUnsuccess state = CatUnsuccess(errorMessages: "Unknown error");
    yield state;
  }

}