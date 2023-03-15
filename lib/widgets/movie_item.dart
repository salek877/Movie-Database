import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_database/models/movie_model.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;
  MovieItem(this.movie);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(movie.name),
      subtitle: Text(movie.category),
      trailing: Text('${movie.rating}'),
      leading: CircleAvatar(
        backgroundImage: AssetImage('images/${movie.image}'),
      ),
    );
  }
}
