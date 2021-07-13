import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lecture12/models/routers/router.dart';
import 'package:lecture12/models/user.dart';
import 'package:lecture12/widgets/customTextFiled.dart';

import 'homePage.dart';

class Customer extends StatefulWidget {



  @override
  _CustomerState createState() => _CustomerState();
}

class _CustomerState extends State<Customer> {
  String email;
  String password;
  GlobalKey<FormState> formKey=GlobalKey<FormState> ();

  setEmail(String email){
    this.email=email;
  }
  setPassword(String password){
    this.password=password;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextField('email',setEmail),
          CustomTextField('Password' ,setPassword),
          ElevatedButton(
              onPressed: () async{
                if (formKey.currentState.validate()) {
                  formKey.currentState.save();
                  User user = User.customer(
                    email: email,
                    password: password,
                  );
                  AppRouter.router.pushFunction(HomePage());

                }
              },
              child: Text('Sing Up as customer')),
        ],
      ),
    );

  }
}
