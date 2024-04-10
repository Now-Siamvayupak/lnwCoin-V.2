import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lnwcoin/services/keys.dart';

class UserModel {
  String? uid;
  String? firstName;
  String? email;
  String? photoUrl;
  String? userRole;
  bool? isEmailLogin;
  bool? isTester;
  Timestamp? createdAt;
  Timestamp? updatedAt;
  String? loginType;

  UserModel({this.createdAt, this.email, this.firstName, this.photoUrl, this.uid, this.updatedAt, this.isTester, this.userRole, this.isEmailLogin, this.loginType});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      createdAt: json[userKeys.createdAt],
      email: json[userKeys.email],
      firstName: json[userKeys.firstName],
      isEmailLogin: json[userKeys.isEmailLogin],
      photoUrl: json[userKeys.photoUrl],
      isTester: json[userKeys.isTester],
      userRole: json[userKeys.userRole],
      uid: json[userKeys.uid],
      updatedAt: json[userKeys.updatedAt],
      loginType: json[userKeys.loginType],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[userKeys.createdAt] = this.createdAt;
    data[userKeys.email] = this.email;
    data[userKeys.firstName] = this.firstName;
    data[userKeys.photoUrl] = this.photoUrl;
    data[userKeys.isEmailLogin] = this.isEmailLogin;
    data[userKeys.isTester] = this.isTester;
    data[userKeys.uid] = this.uid;
    data[userKeys.userRole] = this.userRole;
    data[userKeys.updatedAt] = this.updatedAt;
    data[userKeys.loginType] = this.loginType;
    return data;
  }
}
