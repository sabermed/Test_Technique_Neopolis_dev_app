//Response

class SignupResponseModel {
  final bool success;
  final String msg;

  SignupResponseModel({required this.success, required this.msg});

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) {
    return SignupResponseModel(
        success: json["success"] != null ? json["success"] : "",
        msg: json["msg"] != null ? json["msg"] : "");
  }
}

// Request

class SignupRequestModel {
  String fullname;
  String email;
  String password;

  SignupRequestModel({
    required this.fullname,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "fullname": fullname,
      "email": email,
      "password": password,
    };
    return map;
  }
}
