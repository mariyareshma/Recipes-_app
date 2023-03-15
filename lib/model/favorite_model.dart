class FavoriteRecipe {
  FavoriteRecipe({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
  });

  final int? id;
  final String? title;
  final String? image;
  final String? description;

  factory FavoriteRecipe.fromJson(Map<String, dynamic> json) {
    return FavoriteRecipe(
      id: json["id"],
      title: json["title"],
      image: json["image"],
      description: json["description"],
    );
  }

  Map<String, dynamic> toJson() {
    var favoriteRecipe = {
      "id": id,
      "title": title,
      "image": image,
      "description": description
    };
    return favoriteRecipe;
  }
}
