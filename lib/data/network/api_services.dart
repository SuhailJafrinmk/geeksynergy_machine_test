import 'package:dio/dio.dart';
import 'package:machine_test_geeksynergy/data/network/dio_configure.dart';
import 'dart:developer' as developer;

class ApiServices {
  static Future<Response> getMovies()async{
    final response=await DioClient.instance.dio.get(
      '',
      queryParameters: {
        's':'boys',
        'apikey':'ad0aeddf'
      }
    );
    developer.log('the response data is $response');
    return response;
  }
}