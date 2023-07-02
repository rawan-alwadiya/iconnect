import 'package:iconnect/database/db_operations.dart';
import 'package:iconnect/models/cart.dart';
import 'package:iconnect/prefs/shared_pref_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartDbController extends DbOperations<Cart>{

  @override
  Future<int> insert(Cart cart)async {
    // if (await isItemNotExistInCart(productName: cart.productName)){
    //   //   int newRowId =
      return await database.insert(Cart.tableName, cart.toMap());
    // } else {
    //   return 0;
    // }
  }


  @override
  Future<bool> delete(int id)async{
    int userId = SharedPrefController().getValueFor(key: PrefKeys.id.name)!;
    int countOfDeletedRows = await database.delete(Cart.tableName,where: 'id = ? AND user_id = ?', whereArgs: [id,userId]);
    return countOfDeletedRows == 1;
  }

  @override
  Future<List<Cart>> read() async{
    int userId = SharedPrefController().getValueFor(key: PrefKeys.id.name)!;
    List<Map<String,dynamic>> rowsMap = await database.query(
      Cart.tableName,
      where: 'user_id = ?',
      whereArgs: [userId]
    );
    return rowsMap.map((rowMap) => Cart.fromMap(rowMap)).toList();
  }

  @override
  Future<bool> updatingQuantity(Cart cart) async{
    int userId = SharedPrefController().getValueFor(key: PrefKeys.id.name)!;
    int countOfUpdatedRows = await database.update(
        Cart.tableName,
      cart.toMap(),
      where: 'id = ? AND user_id = ?',
      whereArgs: [cart.id,userId]
        );
    return countOfUpdatedRows == 1;
  }

  @override
  Future<bool> updateCartColor(Cart cart) async{
    int userId= SharedPrefController().getValueFor(key: PrefKeys.id.name)!;
    int countOfUpdatedRows = await database.update(
      Cart.tableName,
      cart.toMap(),
      where: 'id = ? AND user_id = ?',
      whereArgs: [userId]
    );
    return countOfUpdatedRows ==1;
  }

  // Future<bool> updateCart

  // Future<bool> isItemNotExistInCart({required String productName})async{
  //   List<Map<String,dynamic>> rowsMap = await database.rawQuery(
  //       'SELECT FROM * cart WHERE product_name = ?',[productName]
  //   );
  //   return rowsMap.isEmpty;
  // }


}