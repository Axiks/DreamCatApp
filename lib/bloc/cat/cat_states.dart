import 'package:dreambitcattestapp/model/cat.dart';

abstract class CatsState {
  const CatsState();
}

class CatsInitial extends CatsState {}

class CatsLoaded extends CatsState {
  final List<Cat> cats;

  const CatsLoaded({
    required this.cats
  });
}

class CatsNotLoaded extends CatsState{
  final String errorMessages;
  const CatsNotLoaded({
    required this.errorMessages
  });
}