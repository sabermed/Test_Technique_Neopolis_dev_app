import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neopolis_dev/Pages/profile.dart';
import 'package:neopolis_dev/api/signin_service.dart';
import 'package:neopolis_dev/models/signin_model.dart';
import '../Signup/signup_screen.dart';
import '../componments/already_have_an_account_acheck.dart';
import '../componments/keyboard.dart';
import '../constants.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key? key}) : super(key: key);
  static String routeName = "/sign_in";

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _hidePassword = true;
  String message = "";
  bool isApiCallProcess = false;
  final GlobalKey<FormState> _formKey = GlobalKey();

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }

  // Email Login
  late SigninRequestModel signinRequestModel;

  @override
  void initState() {
    super.initState();
    signinRequestModel = new SigninRequestModel(email: '', password: '');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        // hide keyboard when the button pressed
        KeyboardUtil.hideKeyboard(context);
      },
      child: SafeArea(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              child: SvgPicture.asset(
                'images/background.svg',
                alignment: Alignment.center,
                fit: BoxFit.cover,
              ),
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: size.height * 0.1),
                          SvgPicture.asset(
                            'images/neopolis-logo.svg',
                            width: size.width * 0.6,
                          ),
                          SizedBox(height: size.height * 0.1),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 24,
                                  fontFamily: 'SF Pro Text',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.01),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 24),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (input) {
                                if (input!.isEmpty) {
                                  return 'Enter email address';
                                }
                                if (RegExp(
                                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                    .hasMatch(input)) {
                                  return null;
                                } else {
                                  return "Check your email";
                                }
                              },
                              onChanged: (input) =>
                                  signinRequestModel.email = input,
                              decoration: InputDecoration(
                                labelText: "Email",
                                labelStyle: TextStyle(
                                  fontSize: 16,
                                  color: kPrimaryColor,
                                ),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: kPrimaryColor, width: 1.0),
                                ),
                                disabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: kPrimaryColor, width: 1.0),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: kPrimaryColor, width: 1.0),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 1.0),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: kPrimaryColor, width: 1.0),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.01),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 24),
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (input) {
                                if (input!.isEmpty) {
                                  return 'Enter Password';
                                }

                                return null;
                              },
                              onChanged: (input) =>
                                  signinRequestModel.password = input,
                              obscureText: _hidePassword,
                              decoration: InputDecoration(
                                labelText: "Password",
                                labelStyle: TextStyle(
                                  fontSize: 16,
                                  color: kPrimaryColor,
                                ),
                                suffixIcon: IconButton(
                                  icon: _hidePassword
                                      ? Icon(Icons.visibility_off)
                                      : Icon(Icons.visibility),
                                  onPressed: _toggle,
                                  color: kPrimaryColor,
                                ),
                                disabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: kPrimaryColor, width: 1.0),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: kPrimaryColor, width: 1.0),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: kPrimaryColor, width: 1.0),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 1.0),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: kPrimaryColor, width: 1.0),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.08),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 24),
                            width: double.infinity,
                            height: 56,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                                backgroundColor: kPrimaryColor,
                              ),
                              onPressed: () {
                                // check if the form has valide input
                                if (_formKey.currentState!.validate()) {
                                  // save the form
                                  _formKey.currentState!.save();
                                  // calling the api
                                  APIServiceLogin apiService =
                                      new APIServiceLogin();

                                  // check the response
                                  apiService
                                      .signin(signinRequestModel)
                                      .then((value) async {
                                    if (value.success == true &&
                                        value.token.isNotEmpty) {
                                      // SharedPreferences prefs =
                                      //     await SharedPreferences.getInstance();
                                      // prefs.setString('token', value.token);
                                      Navigator.pushNamed(
                                          context, Profile.routeName);
                                    } else {
                                      print(value.msg);
                                      setState(() {
                                        message = value.msg;
                                      });
                                    }
                                  });
                                }
                                //*********** */
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                message,
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: AlreadyHaveAnAccountCheck(
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return SignUpScreen();
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: size.height * 0.04),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
