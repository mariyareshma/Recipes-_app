import 'dart:convert';
import 'dart:io';
import 'package:food_app/model/recipes.dart';
import 'package:path_provider/path_provider.dart';

import '../model/favorite_recipe.dart';

var fileName = 'bookmarkRecipe.json';

Future<String> getFullFilePath() async {
  var appDirectory = (await getApplicationDocumentsDirectory()).path;
  return '$appDirectory/$fileName';
}

Future<bool> isRecipeBookmarked(RandomRecipe recipe) async {
  var bookmark = await getFavorites();
  var recipeExist = bookmark.any((element) => recipe.id == element.id);
  return recipeExist;
}

Future<bool> recipeBookmarkFileExists() async {
  var fullFilePath = await getFullFilePath();
  var recipeObj = File(fullFilePath);
  return recipeObj.existsSync();
}

Future<List<FavoriteRecipe>> getFavorites() async {
  var fullFilePath = await getFullFilePath();
  var fileObj = File(fullFilePath);
  if (fileObj.existsSync()) {
    var jsonString = fileObj.readAsStringSync();

    //List<dynamic>
    var favRecipeObjects = jsonDecode(jsonString) as List;

    return favRecipeObjects.map((e) => FavoriteRecipe.fromJson(e)).toList();
  }
  return <FavoriteRecipe>[];
}

Future<bool> addRecipeBookmark(RandomRecipe recipe) async {
  var fullFilePath = await getFullFilePath();
  var fileObj = File(fullFilePath);
  var bookmarks = await getFavorites();

  var favRecipe = FavoriteRecipe(
      id: recipe.id,
      description: recipe.description,
      image: recipe.image,
      title: recipe.name);

  bookmarks.add(favRecipe);

  var markString = jsonEncode(bookmarks);
  fileObj.writeAsStringSync(markString);
  return true;
}

Future<bool> removeBookmark(RandomRecipe recipe) async {
  var bookmarks = await getFavorites();

  bookmarks.removeWhere((element) => element.id == recipe.id);

  var bookmarkString = jsonEncode(bookmarks);
  var fullFilePath = await getFullFilePath();
  var fileObj = File(fullFilePath);
  fileObj.writeAsStringSync(bookmarkString);
  return true;
}
