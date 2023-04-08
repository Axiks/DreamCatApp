import 'package:dio/dio.dart';

class HttpService{
  final Dio _dio;

  HttpService()
      : _dio = new Dio(){
    _dio.options.baseUrl = 'https://api.thecatapi.com/v1/';
    initializeInterceptors();
    print("Http service init");
  }

  Future<Response> getRequest(String endPoint) async{
    print("getRequest function");
    //Response response;
    // Dio _dio = Dio(
    //     BaseOptions(
    //       baseUrl: "https://api.thecatapi.com/v1/",
    //     )
    // );

    try{
      print("start try response");
      print("Timeout: " + this._dio.options.connectTimeout.toString());

      String url = 'https://api.thecatapi.com/v1/' + endPoint;
      print("URL: " + url);
      final response = await Dio().get(url);
      //final response = await this._dio.get(endPoint);
      print("returned data: ");
      print(response.data.toString());
      print("end try response");

      if (response.statusCode == 200) {
        return response;
      } else {
        print('${response.statusCode} : ${response.data.toString()}');
        //throw response.statusCode;
      }

      return response;
    } on DioError catch (e) {
      print("getRequest error: " + e.message);
      throw Exception(e.message);
    }
  }


  initializeInterceptors(){
    print("Interceptors function");
    this._dio.interceptors.add(InterceptorsWrapper(
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