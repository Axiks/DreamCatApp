import 'package:dio/dio.dart';

class HttpService{
  final Dio _dio;

  HttpService()
      : _dio = Dio(
      BaseOptions(
        baseUrl: "https://api.thecatapi.com/v1/",
        connectTimeout: 5000,
        receiveTimeout: 3000
      )
  ){
    initializeInterceptors();
    print("Http service init");
  }

  Future<Response> getRequest(String endPoint) async{
    print("getRequest function");
    Response response;
    Dio _dio = Dio(
        BaseOptions(
          baseUrl: "https://api.thecatapi.com/v1/",
        )
    );

    try{
      print("start try response");
      print("Timeout: " + _dio.options.connectTimeout.toString());
      response = await _dio.get(endPoint);
      print("end try response");
    } on DioError catch (e) {
      print("getRequest error: " + e.message);
      throw Exception(e.message);
    }
    return response;
  }

  initializeInterceptors(){
    print("Interceptors function");
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (error, _){
        print(error.message);
      },
      onRequest: (request, _){
        print("${request.method} ${request.path}");
      },
      onResponse: (response, _){
        print(response.data);
      }
    ));
  }
}