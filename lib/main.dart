import 'package:flutter/material.dart';
import 'package:lecture12/models/user.dart';
import 'package:lecture12/ui/customer.dart';
import 'package:lecture12/ui/homePage.dart';
import 'package:lecture12/ui/merchant.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

enum UserType { customer, merchant }

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  UserType groupValue;
  User user;
  setUser(user){
    this.user= user;
  }
  GlobalKey <FormState> merchantKey= GlobalKey <FormState>();
  GlobalKey <FormState> customerKey= GlobalKey <FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lecture12"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 7,
            ),
            Text(
              "Who are you?",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.withOpacity(0.4)),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                        title: Text('Customer'),
                        value: UserType.customer,
                        groupValue: groupValue,
                        onChanged: (v) {
                          this.groupValue = v;
                          setState(() {
                          });
                        }),
                  ),
                  Expanded(
                    child: RadioListTile(
                        title: Text('Merchant'),
                        value: UserType.merchant,
                        groupValue: groupValue,
                        onChanged: (v) {
                          this.groupValue = v;
                          setState(() {

                          });
                        }),
                  ),
                ],
              ),
            ),
            this.groupValue== UserType.customer?
                Customer():
                Merchant(),
            SizedBox(height: 8,),
          ],
        ),
      ),
    );
  }
}
