import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lecture12/globals.dart';
import 'package:lecture12/models/sharedPrefrencesHelper/SharedPrefernces.dart';
import 'package:lecture12/models/user.dart';

import '../main.dart';

class HomePage extends StatelessWidget {
  String name;
  HomePage(this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue.withOpacity(0.3)
              ),
              
              child: Text(Globals.globals.user.userType == UserType.customer
                  ? 'Hi i am customer, '
                  'my email is ${Globals.globals.user.email} and my password is ${Globals.globals.user.password}'
                  : 'hi i am merchant my shopName is ${Globals.globals.user.shopName},'
                  ' my shop address is ${Globals.globals.user.shopAddress},'
                  ' my shopCategory is ${Globals.globals.user.shopCategory}, my bio is ${Globals.globals.user.bio}',style: TextStyle(
                fontWeight: FontWeight.bold,fontSize: 20
              ),),
            ),
            ElevatedButton(
              child: Text('SIng out'),
              onPressed: () {
                SpHelper.spHelper.singOut();

              },
            ),
          ],
        ));
  }
}
