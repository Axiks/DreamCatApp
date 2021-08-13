import 'package:dreambitcattestapp/model/cat.dart';

abstract class CatState {
  const CatState();

  @override
  List<Object> get props => [];
}

class CatInitial extends CatState {}

class CatSuccess extends CatState {
  final List<Cat> cats;

  const CatSuccess({
    required this.cats
  });

  CatSuccess copyWith({
    List<Cat>? cats
  }) {
    return CatSuccess(
      cats: cats ?? this.cats,
    );
  }
}

class CatUnsuccess extends CatState{
  final String errorMessages;
  const CatUnsuccess({
    required this.errorMessages
  });
}