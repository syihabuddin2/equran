import 'package:dio/dio.dart';
import 'package:equran/model/meta/metamodel.dart';

class MetaService {
  final Dio _dio = Dio();
  String? apiUrl;

  /// Get All Meta
  Future<MetaModel> getAll() async {
    apiUrl = "http://api.alquran.cloud/v1/meta";

    Response response = await _dio.get(apiUrl!);

    /* print("response: " + response.data.toString());
    print("statusCode: " + response.statusCode.toString());
    print("statusCode: " + response.statusMessage.toString()); */

    final meta = MetaModel.fromJson(response.data);

    return meta;
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
