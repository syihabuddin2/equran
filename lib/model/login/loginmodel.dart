import 'package:json_annotation/json_annotation.dart';

part 'loginmodel.g.dart';

@JsonSerializable()
class LoginModel {
  String? token;

  LoginModel({this.token});

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
