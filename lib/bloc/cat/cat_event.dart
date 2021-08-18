abstract class CatsEvent {
  const CatsEvent();
}

class GetAllCats extends CatsEvent {
  const GetAllCats();
}

class GetCat extends CatsEvent {
  final String id;

  const GetCat(this.id);
}