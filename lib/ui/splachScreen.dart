import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lecture12/models/sharedPrefrencesHelper/SharedPrefernces.dart';

import '../main.dart';
import 'homePage.dart';

class SplachScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(
      seconds: 3,
    )).then((value) {
      if (SpHelper.spHelper.getUser() != null) {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return HomePage('');
        }));
      } else {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
         return MyApp();
        }));
      }
    });
    return Scaffold();
  }
}
