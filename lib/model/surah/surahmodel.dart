import 'package:json_annotation/json_annotation.dart';

part 'surahmodel.g.dart';

@JsonSerializable()
class Surah {
  int? code;
  String? status;
  List<Data>? data;

  ///Constructor
  Surah({this.code, this.status, this.data});

  factory Surah.fromJson(Map<String, dynamic> json) => _$SurahFromJson(json);

  Map<String, dynamic> toJson() => _$SurahToJson(this);
}

@JsonSerializable()
class Data {
  int? number;
  String? name;
  String? englishName;
  String? englishNameTranslation;
  int? numberOfAyahs;
  String? revelationType;

  Data(
      {this.number,
      this.name,
      this.englishName,
      this.englishNameTranslation,
      this.numberOfAyahs,
      this.revelationType});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}
