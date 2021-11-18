import 'package:neopolis_dev/models/signup_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIServiceSignup {
  Future<SignupResponseModel> signup(SignupRequestModel requestModel) async {
    final response = await http.post(
      Uri.parse('https://neopolis-app.herokuapp.com/sign_up'),
      body: requestModel.toJson(),
    );
    return SignupResponseModel.fromJson(jsonDecode(response.body));
  }
}
