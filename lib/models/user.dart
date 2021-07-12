import 'package:flutter/cupertino.dart';
import 'package:lecture12/main.dart';

class User{
  UserType userType;
  String email;
  String password;
  String shopName;
  String shopCategory;
  String shopAddress;
  String bio;
  User.customer({@required this.email,
    @required this.password,
    this.userType=UserType.customer
       });
  User.merchant({
    @required this.email,
    @required this.password,
    @required this.shopName,
    @required this.shopCategory,
    @required this.shopAddress,
    this.userType=UserType.merchant
  });

}