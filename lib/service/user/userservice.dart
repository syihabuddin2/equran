import 'dart:math';

import 'package:dio/dio.dart';
import 'package:equran/model/user/userlistmodel.dart';
import 'package:equran/model/user/usermodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  final Dio _dio = Dio();
  String? apiUrl;

  SharedPreferences? prefs;

  ///Get All Users
  Future<User> getUser({int? id}) async {
    apiUrl = "https://reqres.in/api/users?page=" + id.toString();
    prefs = await SharedPreferences.getInstance();

    Response response = await _dio.get(apiUrl!);

    final userList = User.fromJson(response.data);

    return userList;
  }

  ///Get Random User
  Future<UserModel> getUserRandom() async {
    Random random = Random();

    ///value will between 0 to 11
    var generateId = random.nextInt(12);

    apiUrl = "https://reqres.in/api/users/" + generateId.toString();
    prefs = await SharedPreferences.getInstance();

    Response response = await _dio.get(apiUrl!);

    final userData = UserModel.fromJson(response.data);

    prefs!.setString("userId", userData.id.toString());
    prefs!.setString("username", userData.firstName.toString());
    prefs!.setString("email", userData.email.toString());

    return userData;
  }
}
