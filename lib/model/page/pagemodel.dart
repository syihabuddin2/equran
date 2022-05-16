import 'package:json_annotation/json_annotation.dart';

part 'pagemodel.g.dart';

@JsonSerializable()
class PageModel {
  int? code;
  String? status;
  PageData? data;

  PageModel({this.code, this.status, this.data});

  factory PageModel.fromJson(Map<String, dynamic> json) =>
      _$PageModelFromJson(json);
  Map<String, dynamic> toJson() => _$PageModelToJson(this);
}

@JsonSerializable()
class PageData {
  int? number;
  List<Ayahs>? ayahs;
  Surahs? surahs;
  Edition? edition;

  PageData({this.number, this.ayahs, this.surahs, this.edition});

  factory PageData.fromJson(Map<String, dynamic> json) =>
      _$PageDataFromJson(json);
  Map<String, dynamic> toJson() => _$PageDataToJson(this);
}

@JsonSerializable()
class Ayahs {
  int? number;
  String? text;
  PageSurah? surah;
  int? numberInSurah;
  int? juz;
  int? manzil;
  int? page;
  int? ruku;
  int? hizbQuarter;
  bool? sajda;

  Ayahs(
      {this.number,
      this.text,
      this.surah,
      this.numberInSurah,
      this.juz,
      this.manzil,
      this.page,
      this.ruku,
      this.hizbQuarter,
      this.sajda});

  factory Ayahs.fromJson(Map<String, dynamic> json) => _$AyahsFromJson(json);
  Map<String, dynamic> toJson() => _$AyahsToJson(this);
}

@JsonSerializable()
class PageSurah {
  int? number;
  String? name;
  String? englishName;
  String? englishNameTranslation;
  String? revelationType;
  int? numberOfAyahs;

  PageSurah(
      {this.number,
      this.name,
      this.englishName,
      this.englishNameTranslation,
      this.revelationType,
      this.numberOfAyahs});

  factory PageSurah.fromJson(Map<String, dynamic> json) =>
      _$PageSurahFromJson(json);
  Map<String, dynamic> toJson() => _$PageSurahToJson(this);
}

@JsonSerializable()
class Surahs {
  PageSurah? s1;

  Surahs({this.s1});

  factory Surahs.fromJson(Map<String, dynamic> json) => _$SurahsFromJson(json);
  Map<String, dynamic> toJson() => _$SurahsToJson(this);
}

@JsonSerializable()
class Edition {
  String? identifier;
  String? language;
  String? name;
  String? englishName;
  String? format;
  String? type;
  String? direction;

  Edition(
      {this.identifier,
      this.language,
      this.name,
      this.englishName,
      this.format,
      this.type,
      this.direction});

  factory Edition.fromJson(Map<String, dynamic> json) =>
      _$EditionFromJson(json);
  Map<String, dynamic> toJson() => _$EditionToJson(this);
}
