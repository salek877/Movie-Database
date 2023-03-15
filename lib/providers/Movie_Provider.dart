import 'package:flutter/cupertino.dart';
import 'package:movie_database/models/movie_model.dart';
import 'package:movie_database/movie_utils/constants.dart';

class MovieProvider extends ChangeNotifier{
  List<Movie> _movieList = [];

  List<Movie> get movieList => _movieList;

  void getMovies() => _movieList = movies;

  void deleteMovie(Movie movie) {
    _movieList.removeWhere((element) => movie == element);
    notifyListeners();
  }

  void toggleFavorite(int id) {
    var movie = _movieList.firstWhere((element) => element.id == id);
    movie.isFavorite = !movie.isFavorite;
    notifyListeners();
  }

}