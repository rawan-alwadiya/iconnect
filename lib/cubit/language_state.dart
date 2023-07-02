import 'dart:ui';

abstract class LanguageState{}

class InitialLanguage extends LanguageState{}

class ChangeLanguageState extends LanguageState{
  final Locale locale;

  ChangeLanguageState(this.locale);
}

