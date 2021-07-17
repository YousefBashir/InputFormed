import 'package:flutter/cupertino.dart';
import 'package:lecture12/main.dart';

class User {
  UserType userType;
  String email;
  String password;
  String shopName;
  String shopCategory;
  String shopAddress;
  String bio;

  User.customer(
      {@required this.email,
      @required this.password,
      this.userType = UserType.customer});

  User.merchant(
      {@required this.email,
      @required this.password,
      @required this.shopName,
      @required this.shopCategory,
      @required this.shopAddress,
        @required this.bio,
      this.userType = UserType.merchant});

  factory User.map(Map map) {
    if (map['isMerchant']==true) {
      return User.merchant(
          email: map['email'],
          password: map['password'],
          shopName: map['shopName'],
          shopCategory: map['shopCategory'],
          shopAddress: map['address'],
          bio: map['bio']);
    } else
      return User.customer(email: map['email'], password: map['password']);
  }

  Map<String, dynamic> toMap() {
    Map map = this.userType == UserType.customer
        ? {'isMerchant': false, 'email': this.email, 'password': this.password}
        : {
            'isMerchant': true,
            'email': this.email,
            'password': this.password,
            'shopName': this.shopName,
            'shopCategory': this.shopCategory,
            'address': this.shopAddress,
            'bio':this.bio,
          };
    return {...map};
  }
}
