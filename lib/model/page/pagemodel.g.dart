// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagemodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageModel _$PageModelFromJson(Map<String, dynamic> json) => PageModel(
      code: json['code'] as int?,
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : PageData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PageModelToJson(PageModel instance) => <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'data': instance.data,
    };

PageData _$PageDataFromJson(Map<String, dynamic> json) => PageData(
      number: json['number'] as int?,
      ayahs: (json['ayahs'] as List<dynamic>?)
          ?.map((e) => Ayahs.fromJson(e as Map<String, dynamic>))
          .toList(),
      surahs: json['surahs'] == null
          ? null
          : Surahs.fromJson(json['surahs'] as Map<String, dynamic>),
      edition: json['edition'] == null
          ? null
          : Edition.fromJson(json['edition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PageDataToJson(PageData instance) => <String, dynamic>{
      'number': instance.number,
      'ayahs': instance.ayahs,
      'surahs': instance.surahs,
      'edition': instance.edition,
    };

Ayahs _$AyahsFromJson(Map<String, dynamic> json) => Ayahs(
      number: json['number'] as int?,
      text: json['text'] as String?,
      surah: json['surah'] == null
          ? null
          : PageSurah.fromJson(json['surah'] as Map<String, dynamic>),
      numberInSurah: json['numberInSurah'] as int?,
      juz: json['juz'] as int?,
      manzil: json['manzil'] as int?,
      page: json['page'] as int?,
      ruku: json['ruku'] as int?,
      hizbQuarter: json['hizbQuarter'] as int?,
      sajda: json['sajda'] as bool?,
    );

Map<String, dynamic> _$AyahsToJson(Ayahs instance) => <String, dynamic>{
      'number': instance.number,
      'text': instance.text,
      'surah': instance.surah,
      'numberInSurah': instance.numberInSurah,
      'juz': instance.juz,
      'manzil': instance.manzil,
      'page': instance.page,
      'ruku': instance.ruku,
      'hizbQuarter': instance.hizbQuarter,
      'sajda': instance.sajda,
    };

PageSurah _$PageSurahFromJson(Map<String, dynamic> json) => PageSurah(
      number: json['number'] as int?,
      name: json['name'] as String?,
      englishName: json['englishName'] as String?,
      englishNameTranslation: json['englishNameTranslation'] as String?,
      revelationType: json['revelationType'] as String?,
      numberOfAyahs: json['numberOfAyahs'] as int?,
    );

Map<String, dynamic> _$PageSurahToJson(PageSurah instance) => <String, dynamic>{
      'number': instance.number,
      'name': instance.name,
      'englishName': instance.englishName,
      'englishNameTranslation': instance.englishNameTranslation,
      'revelationType': instance.revelationType,
      'numberOfAyahs': instance.numberOfAyahs,
    };

Surahs _$SurahsFromJson(Map<String, dynamic> json) => Surahs(
      s1: json['s1'] == null
          ? null
          : PageSurah.fromJson(json['s1'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SurahsToJson(Surahs instance) => <String, dynamic>{
      's1': instance.s1,
    };

Edition _$EditionFromJson(Map<String, dynamic> json) => Edition(
      identifier: json['identifier'] as String?,
      language: json['language'] as String?,
      name: json['name'] as String?,
      englishName: json['englishName'] as String?,
      format: json['format'] as String?,
      type: json['type'] as String?,
      direction: json['direction'] as String?,
    );

Map<String, dynamic> _$EditionToJson(Edition instance) => <String, dynamic>{
      'identifier': instance.identifier,
      'language': instance.language,
      'name': instance.name,
      'englishName': instance.englishName,
      'format': instance.format,
      'type': instance.type,
      'direction': instance.direction,
    };
