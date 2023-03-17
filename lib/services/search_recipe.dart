import 'package:dio/dio.dart';
import 'package:food_app/model/recipes.dart';
import '../model/search_recipes.dart';

var dio = Dio();
Future<List<RandomRecipe>> getRecipeSearchResult(
    SearchQuery searchResult) async {
  var randomRecipes = <RandomRecipe>[];
  var response = await dio.get('https://low-carb-recipes.p.rapidapi.com/search',
      queryParameters: {'name': searchResult},
      options: Options(
        headers: {
          'X-RapidAPI-Key':
              'ad9b6066b1mshd5756570e550bb8p160398jsndfd6aec09495',
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
