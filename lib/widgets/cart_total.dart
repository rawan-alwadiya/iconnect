import 'package:iconnect/models/cart.dart';

 class CartTotal{
  int total=0;
  late List<Cart> cart;
  

  int totalPrice(cart){
    for(Cart c in cart) {
      int itemPrice = c.productPrice * c.quantity;
      total = total + itemPrice;
    }
      return total;
  }
}

