import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconnect/bloc/events/favorites_event.dart';
import 'package:iconnect/bloc/states/favorites_state.dart';
import 'package:iconnect/database/favorites_db_controller.dart';
import 'package:iconnect/models/favorite.dart';

class FavoritesBloc extends Bloc<FavoritesEvent,FavoriteStates>{
  FavoritesBloc(super.initialState){

    on<ChooseFavoriteItems>(_chooseFavorites);
    on<ReadFavorites>(_readFavorites);
    on<UpdateFavorite>(_updateFavorite);
    // on<UpdateFavoriteQuantity>(_updateFavoriteQuantity);
    on<DeleteFavoriteEvent>(_deleteFavorite);
  }
  List<Favorite> _favorites = <Favorite>[];
  final FavoritesDbController _dbController = FavoritesDbController();


  void _chooseFavorites(ChooseFavoriteItems event, Emitter<FavoriteStates> emit) async{
    int newRowId= await _dbController.insert(event.favorite);
    if(newRowId != 0){
      event.favorite.id= newRowId;
      _favorites.add(event.favorite);
      emit(ReadState(_favorites));
    }
    emit(ProcessState(
        status: newRowId!= 0,
        message: newRowId!= 0? 'Item added to favorites Successfully':'Something went wrong, please try later',
        processType: ProcessType.choose));
  }

  void _readFavorites(ReadFavorites event, Emitter<FavoriteStates> emit) async{
    emit(FavoriteLoadingState());
    _favorites= await _dbController.read();
    emit(ReadState(_favorites));
  }

  void _updateFavorite(UpdateFavorite event, Emitter<FavoriteStates> emit) async{
    bool updated = await _dbController.update(event.favorite);
    if(updated){
      int index = _favorites.indexWhere((element) => element.id == event.favorite.id);
      if(index!= -1){
        _favorites[index].productColor = event.favorite.productColor;
        emit(ReadState(_favorites));
      }
      emit(ProcessState(
          status: updated,
          message: updated? 'Item color updated successfully': 'Something went wrong! try again later',
          processType: ProcessType.update));
    }
  }

  // void _updateFavoriteQuantity(UpdateFavoriteQuantity event, Emitter<FavoriteStates> emit)async{
  //   bool updated= await _dbController.update(event.favorite);
  //   if(updated){
  //     int index = _favorites.indexWhere((element) => element.id == event.favorite.id);
  //     if(index!= -1){
  //       // _favorites[index]
  //     }
  //   }
  // }

  void _deleteFavorite(DeleteFavoriteEvent event, Emitter<FavoriteStates> emit) async{
    bool deleted = await _dbController.delete(_favorites[event.index].id);
    if(deleted){
      _favorites.removeAt(event.index);
      emit(ReadState(_favorites));
    }
    emit(ProcessState(
        status: deleted,
        message: deleted? 'Item deleted from favorites successfully': 'Something went wrong! please try again later',
        processType: ProcessType.delete));
  }
}