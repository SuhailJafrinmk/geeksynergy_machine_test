import 'package:dart_either/dart_either.dart';
import 'package:dio/dio.dart';
import 'package:machine_test_geeksynergy/data/network/api_services.dart';

class MovieRepo {
  static Future<Either<Exception,Response>> getMovies()async{
    try {
      final response=await ApiServices.getMovies();
      if(response.statusCode==200){
        return Right(response);
      }
      return Left(Exception('some thing wrong'));
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}