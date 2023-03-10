import 'package:dio/dio.dart';
import 'package:food_app/model/recipes.dart';

var dio = Dio();
Future<List<RandomRecipes>> getRecipeSearchResult(String searchResult) async {
  var randomRecipes = <RandomRecipes>[];
  var response = await dio.get('https://low-carb-recipes.p.rapidapi.com/search',
      queryParameters: {'name': searchResult},
      options: Options(
        headers: {
          'X-RapidAPI-Key':
              '0a3549b220msh24b0e7a78c5e8a4p11c08ajsn185dfb2e808e',
          'X-RapidAPI-Host': 'low-carb-recipes.p.rapidapi.com'
        },
      ));
  if (response.statusCode == 200) {
    var recipeJsons = response.data;
    var randomRecipeObj = RandomRecipes.fromJson(recipeJsons);
    return randomRecipeObj.recipes;
  }
  return randomRecipes;
}
