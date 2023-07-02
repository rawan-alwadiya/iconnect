import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconnect/bloc/events/cart_event.dart';
import 'package:iconnect/bloc/states/cart_state.dart';
import 'package:iconnect/database/cart_db_controller.dart';
import 'package:iconnect/models/cart.dart';

class CartBloc extends Bloc<CartEvent,CartStates> {
  CartBloc(super.initialState) {
    on<ChooseCartItems>(_chooseCartItems);
    on<ReadCart>(_readCart);
    on<UpdateQuantity>(_updateQuantity);
    on<UpdateCartColor>(_updateCartColor);
    on<DeleteEvent>(_deleteEvent);
  }

  List<Cart> _cart = <Cart>[];
  final CartDbController _dbController = CartDbController();

  void _chooseCartItems(ChooseCartItems event, Emitter<CartStates> emit) async {
    int newRowId = await _dbController.insert(event.cart);
    if (newRowId != 0) {
      event.cart.id = newRowId;
      _cart.add(event.cart);
      emit(ReadState(_cart));
    }

    emit(ProcessState(
        processType: ProcessType.Choose,
        status: newRowId != 0,
        message: newRowId != 0
            ? 'Item added to Cart successfully!'
            : 'Something went wrong! Please try again later!'));
    // }

}

  void _readCart(ReadCart event, Emitter<CartStates> emit)async {
    emit(LoadingState());
    _cart = await _dbController.read();
    emit(ReadState(_cart));
  }

  void _updateQuantity(UpdateQuantity event, Emitter<CartStates> emit) async{
    bool updated = await _dbController.updatingQuantity(event.cart);
    if(updated) {
      int index = _cart.indexWhere((element) => element.id == event.cart.id);
      if (index != -1) {
        _cart[index].quantity = event.cart.quantity;
        emit(ReadState(_cart));
      }
      emit(
          ProcessState(
              processType: ProcessType.Update,
              status: updated,
              message: updated? 'Quantity updated Successfully!': ': Something went wrong! Please try again later'));
    }
  }

  void _updateCartColor(UpdateCartColor event, Emitter<CartStates> emit)async{
    bool updated = await _dbController.updateCartColor(event.cart);
    if(updated){
      int index = _cart.indexWhere((element) => element.id == event.cart.id);
      if(index!= -1){
        _cart[index].productColor = event.cart.productColor;
        emit(ReadState(_cart));
      }
      emit(ProcessState(
          processType: ProcessType.Update,
          status: updated,
          message: updated? 'Color updated successfully': 'Something went wrong! please try again later'));
    }
  }

  void _deleteEvent(DeleteEvent event, Emitter<CartStates> emit) async{
    bool deleted= await _dbController.delete(_cart[event.index].id);
    if(deleted){
      _cart.removeAt(event.index);
      emit(ReadState(_cart));
    }
    emit(ProcessState(
        processType: ProcessType.Delete,
        status: deleted,
        message: deleted? 'Item deleted successfully!': 'Something went wrong! Please try again later'));
  }

}