import 'package:dio/dio.dart';
import 'package:dreambitcattestapp/api/_http_service.dart';
import 'package:dreambitcattestapp/model/cat.dart';

class CatRepository{

  late HttpService http;

  CatRepository(){
    http = HttpService();
  }

  Future<List<Cat>> getAll() async {
    List<Cat> cats = [];
    try {
      var response = await Dio().get('https://api.thecatapi.com/v1/breeds');

      if(response.statusCode == 200){
        print("Status 200");
        for (var responseCat in response.data) {
          Cat cat = Cat.fromJson(responseCat);
          cats.add(cat);
          print(cat.name!);
        }
      }else{
        print("There is some problem status code not 200");
      }
    } on DioError catch(e) {
      print(e.message);
    }
    return cats;
  }

  Future<Cat?> getCat(String id) async {
    Cat? cat;
    print("getCat OK!");
    Response response;
    try {
      print("try getCat OK!");
      var response = await Dio().get('https://api.thecatapi.com/v1/breeds/search?q=' + id);
      print(response);
      print("after response .. OK!");
      print("Response: " + response.toString());

      if(response.statusCode == 200){
        print("Status 200");
        //print(response);
        cat = Cat.fromJson(response.data[0]);
        print(cat.name!);
        //print("Cat name: " + cat!.name!);
        //image = cat?.image;
      }else{
        print("There is some problem status code not 200");
      }
    } on DioError catch(e) {
      print(e.message);
    }
    return cat;
  }
}