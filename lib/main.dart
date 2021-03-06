import 'package:flutter/material.dart';
import 'package:lecture12/models/user.dart';
import 'package:lecture12/ui/customer.dart';
import 'package:lecture12/ui/homePage.dart';
import 'package:lecture12/ui/merchant.dart';
import 'package:lecture12/ui/splachScreen.dart';

import 'models/routers/router.dart';
import 'models/sharedPrefrencesHelper/SharedPrefernces.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpHelper.spHelper.initSharedPreferences();
  runApp(MaterialApp(
    navigatorKey: AppRouter.router.navKey,
    routes: {
      //'home':(context)=>  HomePage(),
    },
    onGenerateRoute: (RouteSettings routeSettings) {
      String name = routeSettings.name;
      var argument = routeSettings.arguments;
      switch (name) {
        case ('home'):
          return MaterialPageRoute(builder: (context) {
            return HomePage('');
          });
        case ('register'):
          return MaterialPageRoute(builder: (context) {
            return MyApp();
          });
        default:
          return MaterialPageRoute(builder: (context) {
            return Scaffold(
              backgroundColor: Colors.red,
              body: Center(child: Text('404 page not found')),
            );
          });
      }
    },
    /*onUnknownRoute:(RouteSettings r){

    } ,*/
    home: SplachScreen(),
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

  setUser(user) {
    this.user = user;
  }

  GlobalKey<FormState> merchantKey = GlobalKey<FormState>();
  GlobalKey<FormState> customerKey = GlobalKey<FormState>();

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
                          setState(() {});
                        }),
                  ),
                  Expanded(
                    child: RadioListTile(
                        title: Text('Merchant'),
                        value: UserType.merchant,
                        groupValue: groupValue,
                        onChanged: (v) {
                          this.groupValue = v;
                          setState(() {});
                        }),
                  ),
                ],
              ),
            ),
            this.groupValue == UserType.customer ? Customer() : Merchant(),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
