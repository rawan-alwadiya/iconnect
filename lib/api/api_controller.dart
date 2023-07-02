// import 'dart:convert';
// import 'dart:io';
//
// import 'package:iconnect/api/api_settings.dart';
// import 'package:iconnect/models/process_response.dart';
// import 'package:iconnect/models/users.dart';
// import 'package:iconnect/prefs/shared_pref_controller.dart';
// import 'package:iconnect/utils/api_helper.dart';
// import 'package:http/http.dart' as http;
//
// class ApiController with ApiHelper {
//
//   Future<ProcessResponse> login(
//       {required String mobile, required String password}) async {
//     Uri uri = Uri.parse(ApiSettings.login);
//     var response =
//     await http.post(uri, body: {'mobile': mobile, 'password': password});
//     if (response.statusCode == 200 || response.statusCode == 400) {
//       var jsonResponse = jsonDecode(response.body);
//       if (response == 200) {
//         User user = User.fromJson(jsonResponse['data']);
//         await SharedPrefController().save(user: user);
//         return ProcessResponse(message: 'Login Successfully', success: true);
//       }
//       if (response.statusCode == 400) {
//         return ProcessResponse(message: 'Enter correct data', success: false);
//       }
//     }
//     return errorResponse;
//   }
//
//   Future<ProcessResponse> register({required User user}) async {
//     Uri uri = Uri.parse(ApiSettings.register);
//     var response = await http.post(uri, body: {
//       'name': user.name,
//       'mobile': user.mobile,
//       'password': user.password,
//       'gender': user.gender,
//       'STORE_API_KEY': user.storeApiKey,
//       'city_id': user.cityId
//     });
//     if (response.statusCode == 201 || response.statusCode == 400) {
//       var jsonResponse = jsonDecode(response.body);
//       if (response.statusCode == 201) {
//         return ProcessResponse(
//             message: 'Activation code have been sent successfully',
//             success: true,
//             code: jsonResponse['code']);
//       }
//       return ProcessResponse(
//           message: jsonResponse['message'],
//           success: jsonResponse['status']
//       );
//     }
//     return errorResponse;
//   }
//
//   Future<ProcessResponse> activate(
//       {required String mobile, required String code}) async {
//     Uri uri = Uri.parse(ApiSettings.activate);
//     var response = await http.post(uri, body: {'mobile': mobile, 'code': code});
//     if (response.statusCode == 200 || response.statusCode == 400) {
//       var jsonResponse = jsonDecode(response.body);
//       return ProcessResponse(
//           message: jsonResponse['message'], success: jsonResponse['status']);
//     }
//     return errorResponse;
//   }
//
//   Future<ProcessResponse> refreshFcmToken({required String fcmToken}) async{
//     Uri uri = Uri.parse(ApiSettings.refreshFcmToken);
//     var response = await http.post(uri,headers: {
//       HttpHeaders.acceptHeader:'application/json',
//       HttpHeaders.authorizationHeader: SharedPrefController().getValueFor(key: PrefKeys.token.name)
//     },
//     body: {
//       'fcm_token':fcmToken
//     });
//     if(response.statusCode ==200 || response.statusCode == 400){
//       var jsonResponse = jsonDecode(response.body);
//       return ProcessResponse(
//           message: jsonResponse['message'],
//           success: jsonResponse['status']);
//     }
//     return errorResponse;
//   }
//
//   Future<ProcessResponse> forgetPassword({required String mobile}) async {
//     Uri uri = Uri.parse(ApiSettings.forgetPassword);
//     var response = await http.post(uri, body: {'mobile': mobile});
//     if (response.statusCode == 200 || response.statusCode == 400) {
//       var jsonResponse = jsonDecode(response.body);
//       return ProcessResponse(
//           message: jsonResponse['message'],
//           success: jsonResponse['status'],
//           code: jsonResponse['code'] ?? '');
//     }
//     return errorResponse;
//   }
//
//   Future<ProcessResponse> resetPassword(
//       {required String mobile, required String code, required String password, required String passwordConfirmation}) async {
//     Uri uri = Uri.parse(ApiSettings.resetPassword);
//     var response = await http.post(uri, body: {
//       'mobile': mobile,
//       'code': code,
//       'password': password,
//       'password_confirmation': passwordConfirmation
//     });
//     if (response.statusCode == 200 || response.statusCode == 400) {
//       var jsonResponse = jsonDecode(response.body);
//       if (response.statusCode == 200) {
//         return ProcessResponse(
//             message: 'The password has been reset successfully',
//             success: true
//         );
//       }
//       return ProcessResponse(
//         message: jsonResponse['message'],
//         success: jsonResponse['status'],
//       );
//     }
//     return errorResponse;
//   }
//
//   Future<ProcessResponse> changePassword(
//       {required String currentPassword, required String newPassword, required newPasswordConfirmation}) async {
//     Uri uri = Uri.parse(ApiSettings.changePassword);
//     var response = await http.post(uri, headers: {
//       HttpHeaders.acceptHeader: 'application/json',
//       HttpHeaders.authorizationHeader: SharedPrefController().getValueFor(
//           key: PrefKeys.token.name) ?? ''
//     }, body: {
//       'current_password': currentPassword,
//       'new_password': newPassword,
//       'new_password_confirmation': newPasswordConfirmation
//     });
//     if (response.statusCode == 200 || response.statusCode == 400) {
//       var jsonResponse = jsonDecode(response.body);
//       return ProcessResponse(
//           message: jsonResponse['message'],
//           success: jsonResponse['status']
//       );
//     }
//     return errorResponse;
//   }
//
//   Future<ProcessResponse> updateProfile(
//       {required String cityId, required String name, required String gender}) async {
//     Uri uri = Uri.parse(ApiSettings.updateProfile);
//     var response = await http.post(uri, headers: {
//       HttpHeaders.acceptHeader: 'application/json',
//       HttpHeaders.authorizationHeader: SharedPrefController().getValueFor(
//           key: PrefKeys.token.name) ?? ''
//     },
//         body: {
//           'city_id': cityId,
//           'name': name,
//           'gender': gender
//         });
//     if (response.statusCode == 200 || response.statusCode == 400) {
//       var jsonResponse = jsonDecode(response.body);
//       return ProcessResponse(
//           message: jsonResponse['message'],
//           success: jsonResponse['status']);
//     }
//     return errorResponse;
//   }
//
//   Future<ProcessResponse> logout() async {
//     Uri uri = Uri.parse(ApiSettings.logout);
//     var response = await http.get(uri, headers: {
//       HttpHeaders.acceptHeader: 'application/json',
//       HttpHeaders.authorizationHeader:
//       SharedPrefController().getValueFor(key: PrefKeys.token.name) ?? ''
//     });
//     if (response.statusCode == 200 || response.statusCode == 401) {
//       SharedPrefController().clear();
//       return ProcessResponse(message: 'Logout successfully', success: true);
//     }
//     return errorResponse;
//   }
//
//   Future<ProcessResponse> favoriteProducts({required int productId}) async {
//     Uri uri = Uri.parse(ApiSettings.favoriteProducts);
//     var response = await http.post(uri, headers: {
//       HttpHeaders.acceptHeader: 'application/json',
//       HttpHeaders.authorizationHeader: SharedPrefController().getValueFor(
//           key: PrefKeys.token.name),
//     },
//         body: {
//           'product_id': productId
//         });
//     if (response.statusCode == 200 || response.statusCode == 400) {
//       var jsonResponse = jsonDecode(response.body);
//       if (response.statusCode == 200) {
//         return ProcessResponse(
//             message: 'Product added to favorites successfully',
//             success: true
//         );
//       } else {
//         return ProcessResponse(
//           message: 'The product is not found',
//           success: false,
//         );
//       }
//     }
//     return errorResponse;
//   }
//
//   Future<ProcessResponse> rateProducts(
//       {required int productId, required int rate}) async {
//     Uri uri = Uri.parse(ApiSettings.rateProducts);
//     var response = await http.post(uri, body: {
//       'product_id': productId,
//       'rate': rate,
//     }, headers: {
//       HttpHeaders.acceptHeader: 'application/json',
//       HttpHeaders.authorizationHeader: SharedPrefController().getValueFor(
//           key: PrefKeys.token.name)
//     });
//     if (response.statusCode == 200 || response.statusCode == 400) {
//       var jsonResponse = jsonDecode(response.body);
//       return ProcessResponse(
//           message: jsonResponse['message'],
//           success: jsonResponse['status']
//       );
//     }
//     return errorResponse;
//   }
//
//   Future<ProcessResponse> adresses(
//       {required String name, required String info, required int contactNumber, required int cityId}) async {
//     Uri uri = Uri.parse(ApiSettings.addresses);
//     var response = await http.post(uri,
//         headers: {
//           HttpHeaders.acceptHeader: 'application/json',
//           HttpHeaders.authorizationHeader: SharedPrefController().getValueFor(
//               key: PrefKeys.token.name)
//         },
//         body: {
//           'name': name,
//           'info': info,
//           'contact_number': contactNumber,
//           'city_id': cityId
//         });
//     if (response.statusCode == 200 || response.statusCode == 401) {
//       var jsonResponse = jsonDecode(response.body);
//       return ProcessResponse(
//           message: jsonResponse['message'],
//           success: jsonResponse['status']
//       );
//     }
//     return errorResponse;
//   }
//
//   Future<ProcessResponse> paymentCards(
//       {required String name, required int cardNumber, required String expDate, required int cvv, required String paymentType}) async {
//     Uri uri = Uri.parse(ApiSettings.paymentCards);
//     var response = await http.post(uri, headers: {
//       HttpHeaders.acceptHeader: 'application/json',
//       HttpHeaders.authorizationHeader: SharedPrefController().getValueFor(
//           key: PrefKeys.token.name) ?? ''
//     }, body: {
//       'holder_name': name,
//       'card_number': cardNumber,
//       'exp_date': expDate,
//       'cvv': cvv,
//       'type': paymentType
//     });
//     if (response.statusCode == 200 || response.statusCode == 400) {
//       var jsonResponse = jsonDecode(response.body);
//       return ProcessResponse(
//           message: jsonResponse['message'],
//           success: jsonResponse['status']
//       );
//     }
//     return errorResponse;
//   }
//
//   Future<ProcessResponse> order({required int productId, required int quantity, required String paymentType, required int addressId}) async{
//     Uri uri = Uri.parse(ApiSettings.orders);
//     var response = await http.post(uri, headers: {
//       HttpHeaders.acceptHeader: 'application/json',
//       HttpHeaders.authorizationHeader: SharedPrefController().getValueFor(
//           key: PrefKeys.token.name) ?? ''
//     }, body: {
//       'cart': {
//         'product_id': productId,
//         'quantity': quantity
//       },
//       'payment_type': paymentType,
//       'address_id': addressId
//     });
//     if (response.statusCode == 200 || response.statusCode == 400) {
//       var jsonResponse = jsonDecode(response.body);
//       return ProcessResponse(
//           message: jsonResponse['message'],
//           success: jsonResponse['status']
//       );
//     }
//     return errorResponse;
//   }
//
//   Future<ProcessResponse> contactRequest({required String subject, required String message})async{
//     Uri uri = Uri.parse(ApiSettings.contactRequest);
//     var response = await http.post(uri, headers: {
//       HttpHeaders.acceptHeader: 'application/json',
//       HttpHeaders.authorizationHeader: SharedPrefController().getValueFor(key: PrefKeys.token.name)?? ''
//     }, body: {});
//     if (response.statusCode == 201 || response.statusCode == 400) {
//       var jsonResponse = jsonDecode(response.body);
//       if (response.statusCode == 201) {
//         return ProcessResponse(
//             message: 'Operation completed successfully',
//             success: true
//         );
//       }else if(response.statusCode == 400){
//         return ProcessResponse(
//             message: jsonResponse['message'],
//             success: jsonResponse['status']
//         );
//       }
//     }
//     return errorResponse;
//   }
// }
