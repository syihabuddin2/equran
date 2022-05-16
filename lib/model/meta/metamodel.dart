import 'package:json_annotation/json_annotation.dart';

part 'metamodel.g.dart';

@JsonSerializable()
class MetaModel {
  int? code;
  String? status;
  MetaData? data;

  MetaModel({this.code, this.status, this.data});

  factory MetaModel.fromJson(Map<String, dynamic> json) =>
      _$MetaModelFromJson(json);
  Map<String, dynamic> toJson() => _$MetaModelToJson(this);
}

@JsonSerializable()
class MetaData {
  MetaAyahs? ayahs;
  MetaSurahs? surahs;
  MetaSurahs? rukus;
  MetaSurahs? pages;
  MetaSurahs? hizbQuarters;
  MetaSurahs? juzs;

  MetaData({
    this.ayahs,
    this.surahs,
    this.rukus,
    this.pages,
    this.hizbQuarters,
    this.juzs,
  });

  factory MetaData.fromJson(Map<String, dynamic> json) =>
      _$MetaDataFromJson(json);
  Map<String, dynamic> toJson() => _$MetaDataToJson(this);
}

@JsonSerializable()
class MetaAyahs {
  int? count;

  MetaAyahs({this.count});

  factory MetaAyahs.fromJson(Map<String, dynamic> json) =>
      _$MetaAyahsFromJson(json);
  Map<String, dynamic> toJson() => _$MetaAyahsToJson(this);
}

@JsonSerializable()
class MetaSurahs {
  int? count;
  List<MetaReference>? references;

  MetaSurahs({this.count, this.references});

  factory MetaSurahs.fromJson(Map<String, dynamic> json) =>
      _$MetaSurahsFromJson(json);
  Map<String, dynamic> toJson() => _$MetaSurahsToJson(this);
}

@JsonSerializable()
class MetaReference {
  int? number;
  String? name;
  String? englishName;
  String? englishNameTranslation;
  int? numberOfAyahs;
  String? revelationType;
  int? surah;
  int? ayah;

  MetaReference({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.numberOfAyahs,
    this.revelationType,
    this.surah,
    this.ayah,
  });

  factory MetaReference.fromJson(Map<String, dynamic> json) =>
      _$MetaReferenceFromJson(json);
  Map<String, dynamic> toJson() => _$MetaReferenceToJson(this);
}
