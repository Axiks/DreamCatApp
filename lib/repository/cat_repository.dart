import 'package:dio/dio.dart';
import 'package:dreambitcattestapp/api/http_service.dart';
import 'package:dreambitcattestapp/model/cat.dart';
import 'package:dreambitcattestapp/model/cat_image.dart';

class CatRepository{
  Future<List<Cat>> getAll() async {
    List<Cat> cats = [];
    try {
      HttpService http2 = new HttpService();
      Response response = await http2.getRequest("breeds");

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
      // var response = await Dio().get('https://api.thecatapi.com/v1/images/search?limit=100&breed_ids=' + id);
      HttpService http2 = new HttpService();
      Response response = await http2.getRequest("images/search?limit=100&breed_ids=" + id);

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