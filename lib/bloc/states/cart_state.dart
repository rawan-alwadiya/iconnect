import 'package:iconnect/bloc/states/cart_state.dart';
import 'package:iconnect/models/cart.dart';

enum ProcessType {Choose, Read, Update, Delete}

class CartStates{}

class LoadingState extends CartStates{}


class ProcessState extends CartStates{
  final bool status;
  final String message;
  final ProcessType processType;

  ProcessState({
    required this.processType,
    required this.status,
    required this.message
  });
}

class ReadState extends CartStates{
  final List<Cart> cart;

  ReadState(this.cart);
}