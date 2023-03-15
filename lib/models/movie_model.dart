class Movie {
  int id;
  String name;
  String category;
  int releaseYear;
  double rating;
  String image;
  bool isFavorite;

  Movie(
      {required this.id,
      required this.name,
      required this.category,
      required this.releaseYear,
      required this.rating,
      required this.image,
      this.isFavorite = false
      }
      );

  @override
  String toString() {
    return 'Movie{id: $id, name: $name, category: $category, releaseYear: $releaseYear, rating: $rating, image: $image}';
  }
}