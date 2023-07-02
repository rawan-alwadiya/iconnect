
import 'package:iconnect/database/db_controller.dart';
import 'package:iconnect/models/favorite.dart';
import 'package:iconnect/prefs/shared_pref_controller.dart';
import 'package:sqflite/sqflite.dart';

class FavoritesDbController {

  final Database _database = DbController().database;

  Future<int> insert(Favorite favorite)async{
    return await _database.insert(Favorite.tableName, favorite.toMap());
  }

  Future<bool> delete(int id)async{
    int userId = SharedPrefController().getValueFor(key: PrefKeys.id.name)!;
    int countOfDeletedRows = await _database.delete(
        Favorite.tableName,where: 'id = ? AND user_id = ?',whereArgs: [id,userId]);
    return countOfDeletedRows == 1;
  }

  Future<List<Favorite>> read() async{
    int userId = SharedPrefController().getValueFor(key: PrefKeys.id.name)!;
    List<Map<String,dynamic>> rowsMap = await _database.query(
        Favorite.tableName,
      where: 'user_id = ?',
      whereArgs: [userId]
    );
    return rowsMap.map((rowMap) => Favorite.fromMap(rowMap)).toList();
  }

  Future<bool> update(Favorite favorite)async{
    int userId = SharedPrefController().getValueFor(key: PrefKeys.id.name)!;
    int countOfUpdatedRows = await _database.update(
      Favorite.tableName,
      favorite.toMap(),
      where: 'user_id = ?',
      whereArgs: [userId]
    );
    return countOfUpdatedRows == 1;
  }

  // Future<bool> updateFavoriteQuantity(Favorite favorite)async{
  //   int userId = SharedPrefController().getValueFor(key: PrefKeys.id.name)!;
  //   int countOfUpdatedRows = await _database.update(
  //       Favorite.tableName,
  //       favorite.toMap(),
  //     where: 'user_id = ?',
  //     whereArgs: [userId]
  //   );
  //   return countOfUpdatedRows==1;
  // }
}