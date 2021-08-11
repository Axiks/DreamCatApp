abstract class CatEvent {
  const CatEvent();

  @override
  List<Object> get props => [];
}

class AllCats extends CatEvent {
  const AllCats();

  @override
  List<Object> get props => [];
}

class GetCat extends CatEvent {
  final String id;

  const GetCat(this.id);

  @override
  List<Object> get props => [id];
}