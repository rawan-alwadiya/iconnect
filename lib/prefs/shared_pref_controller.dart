import 'package:iconnect/models/users.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PrefKeys {id,name,email, loggedIn,mobile,active,verified,cityId,storeId,token, password,language, productImage, productName, productDescription, productPrice }

class SharedPrefController{
  SharedPrefController._();

  late SharedPreferences _sharedPreferences;
  static SharedPrefController? _instance;

  factory SharedPrefController(){
    return _instance??= SharedPrefController._();
  }

  Future<void> initPreferences() async{
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> save({required User user}) async{
    await _sharedPreferences.setBool(PrefKeys.loggedIn.name, true);
    await _sharedPreferences.setInt(PrefKeys.id.name, user.id);
    await _sharedPreferences.setString(PrefKeys.name.name, user.name);
    await _sharedPreferences.setString(PrefKeys.mobile.name, user.mobile);
    // await _sharedPreferences.setString(PrefKeys.email.name, user.email);
    // await _sharedPreferences.setString(PrefKeys.gender.name, user.gender);
    // await _sharedPreferences.setBool(PrefKeys.active.name, user.active);
    // await _sharedPreferences.setBool(PrefKeys.verified.name, user.verified);
    // await _sharedPreferences.setString(PrefKeys.cityId.name, user.cityId);
    // await _sharedPreferences.setString(PrefKeys.storeId.name, user.storeId);
    // await _sharedPreferences.setString(PrefKeys.token.name, 'Bearer ${user.token}');
  }

  void changeLanguage(String language){
    _sharedPreferences.setString(PrefKeys.language.name, language);
  }

  String getLangauge(){
    return _sharedPreferences.getString(PrefKeys.language.name) ?? 'en';
  }

  T? getValueFor<T>({required String key}){
    if(_sharedPreferences.containsKey(key)){
      return _sharedPreferences.get(key) as T;
    }
    return null;
  }

  bool get loggedIn =>
      _sharedPreferences.getBool(PrefKeys.loggedIn.name) ?? false;

  Future<bool> removeValueFor({required String key}) async{
    if(_sharedPreferences.containsKey(key)){
      return _sharedPreferences.remove(key);
    }
    return false;
  }

  Future<bool> clear() async => await _sharedPreferences.clear();

}