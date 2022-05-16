import 'package:dio/dio.dart';
import 'package:equran/model/page/pagemodel.dart';

class PageService {
  final Dio _dio = Dio();
  String? apiUrl;

  /// Get All Page
  Future<PageModel> getAll({int? number}) async {
    apiUrl = "http://api.alquran.cloud/v1/page/" +
        number.toString() +
        "/quran-uthmani";

    Response response = await _dio.get(apiUrl!);

    /* print("response: " + response.data.toString());
    print("statusCode: " + response.statusCode.toString());
    print("statusCode: " + response.statusMessage.toString()); */

    final page = PageModel.fromJson(response.data);

    return page;
  }

  /// Get Data
  /* Future<Data> getData() async {
    apiUrl = "http://api.alquran.cloud/v1/surah";

    Response response = await _dio.get(apiUrl!);

    print("response getData: " + response.data.toString());

    final data = Data.fromJson(response.data["data"]);

    return data;
  } */
}
