import 'dart:convert';
import 'dart:html';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:lecture12/globals.dart';
import 'package:lecture12/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../globals.dart';

class SpHelper{
  SpHelper._();
  static SpHelper spHelper= SpHelper._();
  SharedPreferences sharedPreferences;
  initSharedPreferences()async{
    sharedPreferences= await SharedPreferences.getInstance();
  }
    saveUserName(String name){
      sharedPreferences.setString('name', name);
    }
    String getUserName(String name){
      sharedPreferences.getString('name');
    }
    saveUser(User user){
      sharedPreferences.setString('user', json.encode({...user.toMap()}));
      Globals.globals.user= user;
    }
    User getUser(){
    String formUser= sharedPreferences.getString('user');
    if(formUser==null){
      return null;
    }
    Map userMap=json.decode(formUser);
    User user= User.map(userMap);
    Globals.globals.user= user;
    return user;
    }
    singOut(){
      sharedPreferences.remove('user');
    }


  }




