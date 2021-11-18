//Response

class SigninResponseModel {
  final bool success;
  final String msg;
  final String token;

  SigninResponseModel(
      {required this.token, required this.msg, required this.success});

  factory SigninResponseModel.fromJson(Map<String, dynamic> json) {
    return SigninResponseModel(
      success: json["success"] != null ? json["success"] : "",
      msg: json["msg"] != null ? json["msg"] : "",
      token: json["token"] != null ? json["token"] : "",
    );
  }
}

// Request

class SigninRequestModel {
  String email;
  String password;

  SigninRequestModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "email": email,
      "password": password,
    };
    return map;
  }
}
