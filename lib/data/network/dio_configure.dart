import 'package:dio/dio.dart';
import 'package:machine_test_geeksynergy/resources/api_resources.dart';

class DioClient {
  DioClient._();
  static final DioClient dioClient = DioClient._();
  static DioClient get instance => dioClient;
  late Dio dio;

  void initialize() {
    dio = Dio(BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));
}
}