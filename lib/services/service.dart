import 'package:dio/dio.dart';
import 'package:food_app/model/recipes.dart';

var dio = Dio();
Future<RandomRecipe?> getRandomRecipe() async {
  var response = await dio.get('https://low-carb-recipes.p.rapidapi.com/random',
      options: Options(headers: {
        'X-RapidAPI-Key': '0a3549b220msh24b0e7a78c5e8a4p11c08ajsn185dfb2e808e',
        'X-RapidAPI-Host': 'low-carb-recipes.p.rapidapi.com'
      }));
  if (response.statusCode == 200) {
    var foodJsons = response.data;
    var foodRecipeObj = RandomRecipe.fromJson(foodJsons);
    return foodRecipeObj;
  }
  return null;
}
