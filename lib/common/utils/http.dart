import 'package:dio/dio.dart';

class HttpUtils{

  late Dio dio;

  static final HttpUtils _instance = HttpUtils._internal();

 factory HttpUtils(){

    return _instance;
  }
  HttpUtils._internal(){
   BaseOptions(
     baseUrl: "http://127.0.0.1:8000",
     connectTimeout: const Duration(seconds: 5),
     receiveTimeout: const Duration(seconds: 5),
     headers: {},
     contentType: "application/json : charset=utf-8",
     responseType: ResponseType.json,
   );
   dio = Dio(BaseOptions());
  }

  Map <String,dynamic> ?getAuthorizationHeader(){
   var headers = <String,dynamic>{};
  return headers;

  }


}