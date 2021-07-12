import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lecture12/models/user.dart';

import '../main.dart';

class HomePage extends StatelessWidget {
  User user;

  HomePage(this.user);

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
              
              child: Text(user.userType == UserType.customer
                  ? 'Hi i am customer, '
                  'my email is ${user.email} and my password is ${user.password}'
                  : 'hi i am merchant my shopName is ${user.shopName},'
                  ' my shop address is ${user.shopAddress},'
                  ' my shopCategory is ${user.shopCategory}, my bio is ${user.bio}',style: TextStyle(
                fontWeight: FontWeight.bold,fontSize: 20
              ),),
            ),
            ElevatedButton(
              child: Text('SIng out'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ));
  }
}
