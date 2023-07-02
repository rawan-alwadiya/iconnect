import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbController {

  late Database _database;
  static DbController? _instance;

  DbController._();

  factory DbController(){
    return _instance ??= DbController._();
  }

  Database get database => _database;

  Future<void> initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'app_db.sql');
    _database = await openDatabase(
        path,
      version: 1,
      onOpen: (Database database){},
      onCreate: (Database database, int version)async{

        await database.execute('CREATE TABLE users ('
            'id INTEGER PRIMARY KEY AUTOINCREMENT,'
            'name TEXT NOT NULL,'
            // 'email TEXT NOT NULL,'
            'mobile TEXT NOT NULL,'
            'password TEXT NOT NULL'
            // 'gender TEXT NOT NULL,'
            // 'store_key TEXT NOT NULL'
            // 'FOREIGN KEY (city_id) references users(id)'
            ')');

          await database.execute('CREATE TABLE cart ('
              'id INTEGER PRIMARY KEY AUTOINCREMENT,'
              'product_image TEXT NOT NULL,'
              'product_name TEXT NOT NULL,'
              'product_description TEXT NOT NULL,'
              'product_color INTEGER,'
              'product_price INTEGER,'
              'product_quantity INTEGER,'
              'user_id INTEGER,'
              'FOREIGN KEY (user_id) references users(id)'
              ')');

          await database.execute('CREATE TABLE cities ('
              'id INTEGER PRIMARY KEY AUTOINCREMENT,'
              'name_en TEXT NOT NULL,'
              'name_ar TEXT NOT NULL,'
              'user_id INTEGER,'
              'FOREIGN KEY (user_id) references users(id)'
              ')');

          await database.execute('CREATE TABLE favorites ('
              'id INTEGER PRIMARY KEY AUTOINCREMENT,'
              'product_image TEXT NOT NULL,'
              'product_name TEXT NOT NULL,'
              'product_description TEXT NOT NULL,'
              'product_color INTEGER,'
              'product_price INTEGER,'
              'user_id INTEGER,'
              'FOREIGN KEY (user_id) references users(id)'
              ')');

      },
      onUpgrade: (Database database, int oldVersion, newVersion){},
      onDowngrade: (Database database, int oldVersion, newVersion){}
    );
  }
}