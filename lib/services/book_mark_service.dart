import 'dart:convert';
import 'dart:io';
import 'package:food_app/model/recipes.dart';
import 'package:path_provider/path_provider.dart';

var fileName = 'bookmarkRecipe.json';

Future<String> getFullFilePath() async {
  var appDirectory = (await getApplicationDocumentsDirectory()).path;
  return '$appDirectory/$fileName';
}

Future<bool> recipeBookmarked(RandomRecipe recipe) async {
  var bookmark = await getFavorite();
  var recipeExist = bookmark.any((element) => recipe.id == element.id);
  return recipeExist;
}

Future<bool> recipeNotBookmarkExists() async {
  var fullFilePath = await getFullFilePath();
  var recipeObj = File(fullFilePath);
  return recipeObj.existsSync();
}

Future<List<RandomRecipe>> getFavorite() async {
  var fullFilePath = await getFullFilePath();
  var fileObj = File(fullFilePath);
  if (fileObj.existsSync()) {
    var jsonString = fileObj.readAsStringSync();
    var foodObj = jsonDecode(jsonString);

    return foodObj.map((e) {
      return RandomRecipes.fromJson(e);
    }).toList();
  }
  return <RandomRecipe>[];
}

Future<bool> addRecipeBookmark(RandomRecipe recipe) async {
  var fullFilePath = await getFullFilePath();
  var fileObj = File(fullFilePath);
  var bookmark = await getFavorite();
  bookmark.add(recipe);

  var markString = jsonEncode(bookmark);
  fileObj.writeAsStringSync(markString);
  return true;
}

Future<bool> removeBookmark(RandomRecipe recipe) async {
  var bookmarks = await getFavorite();

  bookmarks.removeWhere((element) => element.id == recipe.id);

  var bookmarkString = jsonEncode(bookmarks);
  var fullFilePath = await getFullFilePath();
  var fileObj = File(fullFilePath);
  fileObj.writeAsStringSync(bookmarkString);
  return true;
}
