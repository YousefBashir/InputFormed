import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lecture12/models/user.dart';
import 'package:lecture12/ui/homePage.dart';
import 'package:lecture12/widgets/customTextFiled.dart';

import 'customer.dart';

class Merchant extends StatefulWidget {

  @override
  _MerchantState createState() => _MerchantState();
}

class _MerchantState extends State<Merchant> {
  List categories = [
    'Fation',
    'Medical',
    'Sports',
    'Education',
    'Electronics',
    'Software'
  ];
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email;
  String password;
  String shopName;
  String shopCategory;
  String shopAddress;
  String bio;

  setEmail(String email) {
    this.email = email;
  }

  setPassword(String password) {
    this.password = password;
  }

  setShopName(String shopName) {
    this.shopName = shopName;
  }

  setShopCategory(String shopCategory) {
    this.shopCategory = shopCategory;
  }

  setShopAddress(String shopAddress) {
    this.shopAddress = shopAddress;
  }

  setBio(String bio) {
    this.bio = bio;
  }

  String dropDownValue = 'Software';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Form(
        key: formKey,
        child: Column(
          children: [
            CustomTextField('email', setEmail),
            CustomTextField('password', setPassword),
            CustomTextField('Shop name', setShopName),
            CustomTextField('Shop category', setShopCategory),
            CustomTextField('Shop address', setShopAddress),
            CustomTextField('Bio', setBio(bio)),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 10, right: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                border: Border.all(color: Colors.black87),
                borderRadius: BorderRadius.circular(20),
              ),
              child: DropdownButton<String>(
                  isExpanded: true,
                  underline: Container(),
                  value: this.dropDownValue,
                  onChanged: (v) {
                    this.dropDownValue = v;
                    setState(() {});
                  },
                  items: categories.map((e) {
                    return DropdownMenuItem<String>(
                      child: Text(e),
                      value: e,
                    );
                  }).toList()),
            ),
            ElevatedButton(
                onPressed: () {
                  if (formKey.currentState.validate()) {
                    formKey.currentState.save();
                    User user = User.merchant(
                      email: email,
                      password: password,
                      shopAddress: shopAddress,
                      shopName: shopName,
                      shopCategory: shopCategory,
                    );
                    Navigator.of(context).push(MaterialPageRoute(builder:(context){
                      return HomePage(user);
                    }));
                  }
                },
                child: Text('Sing Up as merchant')),
          ],
        ),
      ),
    );
  }
}
