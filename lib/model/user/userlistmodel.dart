import 'package:json_annotation/json_annotation.dart';

part 'userlistmodel.g.dart';

@JsonSerializable()
class User {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<Data>? data;

  User({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Data {
  int? id;
  String? email;
  String? first_name;
  String? last_name;
  String? avatar;

  Data({
    this.id,
    this.email,
    this.first_name,
    this.last_name,
    this.avatar,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}
