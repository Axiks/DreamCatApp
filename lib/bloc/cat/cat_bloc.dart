import 'package:dreambitcattestapp/bloc/cat/cat_event.dart';
import 'package:dreambitcattestapp/bloc/cat/cat_states.dart';
import 'package:dreambitcattestapp/model/cat.dart';
import 'package:dreambitcattestapp/repository/cat_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatBloc extends Bloc<CatsEvent, CatsState> {
  final CatRepository _catRepository;

  CatBloc()
      : _catRepository = CatRepository(),
  super(CatsInitial());

  @override
  Stream<CatsState> mapEventToState(CatsEvent event) async*{
    print("Block map event to state: " + event.toString());
    if (event is GetAllCats) {
      yield* _mapGetAllCatsToState(event);
    }
  }

  Stream<CatsState> _mapGetAllCatsToState(GetAllCats event) async* {
    CatsState state;
    print("Get all cats");
    try{
      List<Cat> cats = await _catRepository.getAll();
      state = CatsLoaded(cats: cats);
    }
    catch(e){
      state = CatsNotLoaded(errorMessages: e.toString());
    }
    yield state;
  }
}