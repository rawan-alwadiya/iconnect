
import 'package:iconnect/bloc/events/favorites_event.dart';
import 'package:iconnect/models/favorite.dart';

class FavoritesEvent {}

class ChooseFavoriteItems extends FavoritesEvent {
  final Favorite favorite;

  ChooseFavoriteItems(this.favorite);
}

class ReadFavorites extends FavoritesEvent{}

class UpdateFavorite extends FavoritesEvent{
  final Favorite favorite;

  UpdateFavorite(this.favorite);
}

// class UpdateFavoriteQuantity extends FavoritesEvent{
//   final Favorite favorite;
//
//   UpdateFavoriteQuantity(this.favorite);
// }

class DeleteFavoriteEvent extends FavoritesEvent{
  final int index;

  DeleteFavoriteEvent(this.index);
}