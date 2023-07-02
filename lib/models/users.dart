class User {
  late int id;
  late String name;
  // late String email;
  late String mobile;
  // late String gender;
  // late bool active;
  // late bool verified;
  // late String cityId;
  // late String storeId;
  // late String? fcmToken;
  // late String token;
  // late String tokenType;
  // late String refreshToken;

  static const String tableName = 'users';
  final String storeApiKey = 'a6c2edcb-9738-425a-be8c-a94bff9a68d0';

  late String password;

  // late City city;
  // late Store store;

  User();

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    // email = json['email'];
    mobile = json['mobile'];
    password = json['password'];
    // gender = json['gender'];
    // active = json['active'];
    // verified = json['verified'];
    // cityId = json['city_id'];
    // storeId = json['store_id'];
    // fcmToken = json['fcm_token'];
    // token = json['token'];
    // tokenType = json['token_type'];
    // refreshToken = json['refresh_token'];
    // city = json['city'];
    // store = json['store'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    // data['store_name'] = this.storeName;
    // data['email'] = this.email;
    // data['email_verified_at'] = this.emailVerifiedAt;
    data['mobile'] = this.mobile;
    data['password'] = this.password;
    // data['store_uuid'] = this.storeUuid;
    // data['city_id'] = this.cityId;
    // data['verification_code'] = this.verificationCode;
    // data['active'] = this.active;
    // data['verified'] = this.verified;
    // data['firebase_key'] = this.firebaseKey;
    // data['image'] = this.image;
    // data['address'] = this.address;
    // data['facebook'] = this.facebook;
    // data['instagram'] = this.instagram;
    // data['created_at'] = this.createdAt;
    // data['updated_at'] = this.updatedAt;
    return data;
  }
}




// class City {
//   late int id;
//   late String nameEn;
//   late String nameAr;
//
//   City();
//
//   City.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     nameEn = json['name_en'];
//     nameAr = json['name_ar'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name_en'] = this.nameEn;
//     data['name_ar'] = this.nameAr;
//     return data;
//   }
// }
//
// class Store {
//   int id;
//   String name;
//   String storeName;
//   String email;
//   Null emailVerifiedAt;
//   String mobile;
//   String storeUuid;
//   String cityId;
//   Null verificationCode;
//   String active;
//   String verified;
//   String firebaseKey;
//   Null image;
//   String address;
//   Null facebook;
//   Null instagram;
//   String createdAt;
//   String updatedAt;
//
//   Store({this.id,
//     this.name,
//     this.storeName,
//     this.email,
//     this.emailVerifiedAt,
//     this.mobile,
//     this.storeUuid,
//     this.cityId,
//     this.verificationCode,
//     this.active,
//     this.verified,
//     this.firebaseKey,
//     this.image,
//     this.address,
//     this.facebook,
//     this.instagram,
//     this.createdAt,
//     this.updatedAt});
//
//   Store.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     storeName = json['store_name'];
//     email = json['email'];
//     emailVerifiedAt = json['email_verified_at'];
//     mobile = json['mobile'];
//     storeUuid = json['store_uuid'];
//     cityId = json['city_id'];
//     verificationCode = json['verification_code'];
//     active = json['active'];
//     verified = json['verified'];
//     firebaseKey = json['firebase_key'];
//     image = json['image'];
//     address = json['address'];
//     facebook = json['facebook'];
//     instagram = json['instagram'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//

