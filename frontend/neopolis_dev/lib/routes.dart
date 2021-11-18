import 'pages/profile.dart';
import 'signup/signup_screen.dart';
import 'signin/signin_screen.dart';

import 'package:flutter/widgets.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  Profile.routeName: (context) => Profile(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
};
