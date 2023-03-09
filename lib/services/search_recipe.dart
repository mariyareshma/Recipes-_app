import 'package:dio/dio.dart';
import 'package:food_app/model/recipes.dart';

var dio = Dio();

Future<RandomRecipe?> getRecipeSearchResult(String searchResult) async {
  var response =
      await dio.get('https://low-carb-recipes.p.rapidapi.com/$searchResult');

  if (response.statusCode == 200) {
    var imageJsons = response.data;
    var imageRecipeObj = RandomRecipe.fromJson(imageJsons);
    return imageRecipeObj;
  }

  return null;
}
