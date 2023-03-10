class SearchResult {
  String? name;
  List<String>? tags;
  List<String>? includeIngredients;
  List<String>? excludeIngredients;

  Map<String, dynamic> getSearchRecipe() {
    return {'name': name};
  }
}
