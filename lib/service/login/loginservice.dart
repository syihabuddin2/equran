import 'package:dio/dio.dart';
import 'package:equran/model/login/loginmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  final Dio _dio = Dio();
  String? apiUrl;

  SharedPreferences? prefs;

  ///LOGIN
  Future<LoginModel> login({String? email, String? password}) async {
    apiUrl = "https://reqres.in/api/login";
    prefs = await SharedPreferences.getInstance();

    Response response = await _dio.post(apiUrl!, data: {
      "email": email,
      "password": password,
    });

    final loginData = LoginModel.fromJson(response.data);

    prefs!.setString("token", loginData.token.toString());

    return loginData;
  }

  ///LOGOUT
  Future<void> logout() async {
    prefs = await SharedPreferences.getInstance();
    prefs!.remove("token");
    prefs!.remove("userId");
    prefs!.remove("username");
    prefs!.remove("email");
    //await Future.delayed(const Duration(seconds: 1));
    return;
  }

  ///TOKEN CHECKING
  Future<bool> hasToken() async {
    prefs = await SharedPreferences.getInstance();
    bool hasToken = prefs!.containsKey("token");
    return hasToken;
  }
}
