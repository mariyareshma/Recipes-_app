import 'package:dio/dio.dart';
import 'package:food_app/model/recipes.dart';

var dio = Dio();

Future<RandomRecipe?> getRecipeSearchResult(String searchTerm) async {
  var response = await dio.get(
      'https://low-carb-recipes.p.rapidapi.com/search?name=cake$searchTerm');

  if (response.statusCode == 200) {
    var imageJsons = response.data;
    var imageArticleObj = RandomRecipe.fromJson(imageJsons);
    return imageArticleObj;
  }

  return null;
}
