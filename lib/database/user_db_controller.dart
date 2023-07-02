
import 'package:iconnect/database/db_controller.dart';
import 'package:iconnect/models/process_response.dart';
import 'package:iconnect/models/users.dart';
import 'package:iconnect/prefs/shared_pref_controller.dart';
import 'package:sqflite/sqflite.dart';

class UserDbController {

  final Database _database= DbController().database;

  Future<ProcessResponse> login({required String mobile, required String password}) async{
    List<Map<String,dynamic>> rowsMap = await _database.query(
      User.tableName,
      where: 'mobile = ? AND password = ?',
      whereArgs: [mobile,password]
    );
    if(rowsMap.isNotEmpty){
      User user = User.fromJson(rowsMap.first);
      SharedPrefController().save(user: user);
      return ProcessResponse(message: 'Logged in successfully', success: true);
    }
    return ProcessResponse(message: 'Login failed', success: false);
  }

  Future<ProcessResponse> register({required User user}) async{
    if(await isMobileNumberUnique(mobile: user.mobile)){
      int newRowId = await _database.insert(User.tableName, user.toJson());
      return ProcessResponse(
          message: newRowId != 0? 'Registered successfully':'Registered failed',
          success: newRowId !=0? true: false);
    }
    return ProcessResponse(message: 'Mobile Number is exist, use another', success: false);

  }

  Future<bool> isMobileNumberUnique({required String mobile}) async{
    List<Map<String,dynamic>> rowsMap = await _database.rawQuery(
        'SELECT * FROM users WHERE mobile = ?',[mobile]);
    return rowsMap.isEmpty;
  }

}