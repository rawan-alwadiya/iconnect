import 'package:iconnect/models/favorite.dart';

enum ProcessType{choose, read,update, delete}

class FavoriteStates {}

class FavoriteLoadingState extends FavoriteStates {}

class ProcessState extends FavoriteStates {
  final bool status;
  final String message;
  final ProcessType processType;

  ProcessState({
    required this.status,
    required this.message,
    required this.processType
});
}

class ReadState extends FavoriteStates {
  final List<Favorite> favorites;

  ReadState(this.favorites);
}