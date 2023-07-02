import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconnect/cubit/language_state.dart';

import 'package:iconnect/prefs/shared_pref_controller.dart';

class LangauageCubit extends Cubit<LanguageState>{
  LangauageCubit(): super(InitialLanguage());

  Future<void> getSavedLanguage()async{
   String language=  SharedPrefController().getValueFor(key: PrefKeys.language.name);
   emit(ChangeLanguageState(Locale(language)));
  }

  Future<void> changeLanguage(String language)async{
    SharedPrefController().changeLanguage(language);
    emit(ChangeLanguageState(Locale(language)));
  }
}