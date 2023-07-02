
import 'package:iconnect/database/db_controller.dart';
import 'package:sqflite/sqflite.dart';

abstract class DbOperations<Model>{

  final Database database = DbController().database;

  Future<int> insert(Model model);

  Future<List<Model>> read();

  Future<bool> updatingQuantity(Model model);

  Future<bool> updateCartColor(Model model);

  Future<bool> delete(int id);

}