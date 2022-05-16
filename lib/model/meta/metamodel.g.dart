// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metamodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetaModel _$MetaModelFromJson(Map<String, dynamic> json) => MetaModel(
      code: json['code'] as int?,
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : MetaData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MetaModelToJson(MetaModel instance) => <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'data': instance.data,
    };

MetaData _$MetaDataFromJson(Map<String, dynamic> json) => MetaData(
      ayahs: json['ayahs'] == null
          ? null
          : MetaAyahs.fromJson(json['ayahs'] as Map<String, dynamic>),
      surahs: json['surahs'] == null
          ? null
          : MetaSurahs.fromJson(json['surahs'] as Map<String, dynamic>),
      rukus: json['rukus'] == null
          ? null
          : MetaSurahs.fromJson(json['rukus'] as Map<String, dynamic>),
      pages: json['pages'] == null
          ? null
          : MetaSurahs.fromJson(json['pages'] as Map<String, dynamic>),
      hizbQuarters: json['hizbQuarters'] == null
          ? null
          : MetaSurahs.fromJson(json['hizbQuarters'] as Map<String, dynamic>),
      juzs: json['juzs'] == null
          ? null
          : MetaSurahs.fromJson(json['juzs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MetaDataToJson(MetaData instance) => <String, dynamic>{
      'ayahs': instance.ayahs,
      'surahs': instance.surahs,
      'rukus': instance.rukus,
      'pages': instance.pages,
      'hizbQuarters': instance.hizbQuarters,
      'juzs': instance.juzs,
    };

MetaAyahs _$MetaAyahsFromJson(Map<String, dynamic> json) => MetaAyahs(
      count: json['count'] as int?,
    );

Map<String, dynamic> _$MetaAyahsToJson(MetaAyahs instance) => <String, dynamic>{
      'count': instance.count,
    };

MetaSurahs _$MetaSurahsFromJson(Map<String, dynamic> json) => MetaSurahs(
      count: json['count'] as int?,
      references: (json['references'] as List<dynamic>?)
          ?.map((e) => MetaReference.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MetaSurahsToJson(MetaSurahs instance) =>
    <String, dynamic>{
      'count': instance.count,
      'references': instance.references,
    };

MetaReference _$MetaReferenceFromJson(Map<String, dynamic> json) =>
    MetaReference(
      number: json['number'] as int?,
      name: json['name'] as String?,
      englishName: json['englishName'] as String?,
      englishNameTranslation: json['englishNameTranslation'] as String?,
      numberOfAyahs: json['numberOfAyahs'] as int?,
      revelationType: json['revelationType'] as String?,
      surah: json['surah'] as int?,
      ayah: json['ayah'] as int?,
    );

Map<String, dynamic> _$MetaReferenceToJson(MetaReference instance) =>
    <String, dynamic>{
      'number': instance.number,
      'name': instance.name,
      'englishName': instance.englishName,
      'englishNameTranslation': instance.englishNameTranslation,
      'numberOfAyahs': instance.numberOfAyahs,
      'revelationType': instance.revelationType,
      'surah': instance.surah,
      'ayah': instance.ayah,
    };
