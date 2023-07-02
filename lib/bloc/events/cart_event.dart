
import 'package:iconnect/models/cart.dart';

class CartEvent {}

class ChooseCartItems extends CartEvent {
  final Cart cart;

  ChooseCartItems(this.cart);
}

class ReadCart extends CartEvent{}

class UpdateQuantity extends CartEvent{
  final Cart cart;

  UpdateQuantity(this.cart);
}

class UpdateCartColor extends CartEvent{
  final Cart cart;

  UpdateCartColor(this.cart);
}

class DeleteEvent extends CartEvent{
  final int index;

  DeleteEvent(this.index);
}