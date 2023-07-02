class Cart{

  late int id;
  late String productImage;
  late String productName;
  late String productDescription;
  late int productColor=0;
  late int productPrice;
  late int quantity=1;
  late int userId;

  static const String tableName = 'cart';

  Cart();

  Cart.fromMap(Map<String,dynamic> rowMap){
    id = rowMap['id'];
    productImage = rowMap['product_image'];
    productName = rowMap['product_name'];
    productDescription = rowMap['product_description'];
    productColor= rowMap['product_color'];
    productPrice = rowMap['product_price'];
    quantity = rowMap['product_quantity'];
    userId = rowMap['user_id'];
  }

  Map<String,dynamic> toMap(){
    Map<String,dynamic> map = <String,dynamic>{};
    map['product_image']=productImage;
    map['product_name']=productName;
    map["product_description"]=productDescription;
    map['product_color']=productColor;
    map['product_price']=productPrice;
    map['product_quantity']=quantity;
    map['user_id']=userId;
    return map;
  }

}