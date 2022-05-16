import 'package:dio/dio.dart';
import 'package:equran/model/surah/surahmodel.dart';

class SurahService {
  final Dio _dio = Dio();
  String? apiUrl;

  /// Get All Surah
  Future<Surah> getAll() async {
    apiUrl = "http://api.alquran.cloud/v1/surah";

    Response response = await _dio.get(apiUrl!);

    /* print("response: " + response.data.toString());
    print("statusCode: " + response.statusCode.toString());
    print("statusCode: " + response.statusMessage.toString()); */

    final surah = Surah.fromJson(response.data);

    return surah;
  }

  /// Get By ID
  Future<Surah> getById(int? number) async {
    apiUrl = "http://api.alquran.cloud/v1/surah/" + number.toString();

    Response response = await _dio.get(apiUrl!);

    print("response getById: " + response.data.toString());
    print("statusCode getById: " + response.statusCode.toString());
    print("statusCode getById: " + response.statusMessage.toString());

    final surah = Surah.fromJson(response.data);

    return surah;
  }

  /// Get Data
  Future<Data> getData() async {
    apiUrl = "http://api.alquran.cloud/v1/surah";

    Response response = await _dio.get(apiUrl!);

    print("response getData: " + response.data.toString());

    final data = Data.fromJson(response.data["data"]);

    return data;
  }
}
