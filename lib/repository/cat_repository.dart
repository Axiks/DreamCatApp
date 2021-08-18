import 'package:dio/dio.dart';
import 'package:dreambitcattestapp/api/http_service.dart';
import 'package:dreambitcattestapp/model/cat.dart';
import 'package:dreambitcattestapp/model/cat_image.dart';

class CatRepository{
  final HttpService _http;

  CatRepository()
  : _http = new HttpService();

  Future<List<Cat>> getAll() async {
    List<Cat> cats = [];
    try {
      print("Cat repository.\ngetRequest");
      Response response = await _http.getRequest("breeds");
      print("Cat repository.\n END getRequest");

      if(response.statusCode == 200){
        for (var responseCat in response.data) {
          Cat cat = Cat.fromJson(responseCat);
          cats.add(cat);
        }
      }else{
        throw Exception("Query error");
      }
    } on DioError catch(e) {
      throw Exception(e.message);
    }
    return cats;
  }

  Future<List<CatImage>> getCatImages(String id) async {
    List<CatImage> images = [];
    try {
      Response response = await _http.getRequest("images/search?limit=100&breed_ids=" + id);

      if(response.statusCode == 200){
        for (var responseImage in response.data) {
          CatImage image = CatImage.fromJson(responseImage);
          images.add(image);
        }
      }else{
        throw Exception("Query error");
      }
    } on DioError catch(e) {
      throw Exception(e.message);
    }
    return images;
  }
}