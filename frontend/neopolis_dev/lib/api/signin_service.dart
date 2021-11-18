import 'package:http/http.dart' as http;
import '../models/signin_model.dart';
import 'dart:convert';

class APIServiceLogin {
  Future<SigninResponseModel> signin(SigninRequestModel requestModel) async {
    final response = await http.post(
      Uri.parse('https://neopolis-app.herokuapp.com/sign_in'),
      body: requestModel.toJson(),
    );

    return SigninResponseModel.fromJson(jsonDecode(response.body));
  }
}
