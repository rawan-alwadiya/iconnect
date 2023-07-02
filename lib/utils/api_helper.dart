import 'dart:io';

import 'package:iconnect/models/process_response.dart';
import 'package:iconnect/prefs/shared_pref_controller.dart';

mixin ApiHelper{

  ProcessResponse get errorResponse => ProcessResponse(
      message: 'Something went wrong',
      success: false,
  );

  Map<String,String> get headers {
    return {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: SharedPrefController().getValueFor(key: PrefKeys.token.name)!
    };
  }
}