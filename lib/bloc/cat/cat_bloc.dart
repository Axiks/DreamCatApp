import 'package:dreambitcattestapp/bloc/cat/cat_event.dart';
import 'package:dreambitcattestapp/bloc/cat/cat_states.dart';
import 'package:dreambitcattestapp/model/cat.dart';
import 'package:dreambitcattestapp/repository/cat_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatBloc extends Bloc<CatsEvent, CatsState> {
  CatBloc(CatsState catState) : super(CatsInitial());

  @override
  Stream<CatsState> mapEventToState(CatsEvent event) async*{
    print("Block map event to state: " + event.toString());
    if (event is GetAllCats) {
      yield* _mapGetAllCatsToState(event);
    }
    else{
      yield* _mapUnsuccessToState();
    }
  }

  Stream<CatsState> _mapGetAllCatsToState(GetAllCats event) async* {
    CatsState state;
    print("Get all cats");
    CatRepository catRepository = CatRepository();
    try{
      List<Cat> cats = await catRepository.getAll();
      state = CatsLoaded(cats: cats);
    }
    catch(e){
      state = CatsNotLoaded(errorMessages: e.toString());
    }
    yield state;
  }

  Stream<CatsNotLoaded> _mapUnsuccessToState() async* {
    CatsNotLoaded state = CatsNotLoaded(errorMessages: "Unknown error");
    yield state;
  }

}