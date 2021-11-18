import 'signin/signin_screen.dart';
import 'routes.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Neopolis Development',
      theme: new ThemeData(
        fontFamily: 'SF Pro Text',
        primaryColor: Color(0xFFF6F7FB),
        scaffoldBackgroundColor: Color(0xFFF6F7FB),
      ),
      initialRoute: SignInScreen.routeName,
      routes: routes,
    );
  }
}
