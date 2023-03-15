
import 'package:flutter/material.dart';
import 'package:movie_database/movie_utils/constants.dart';
import 'package:movie_database/providers/Movie_Provider.dart';
import 'package:movie_database/widgets/movie_item.dart';
import 'package:movie_database/widgets/movie_item_2.dart';
import 'package:provider/provider.dart';


class MovieListPage extends StatefulWidget {
  const MovieListPage({Key? key}) : super(key: key);

  @override
  _MovieListPageState createState() => _MovieListPageState();
}


class _MovieListPageState extends State<MovieListPage> {
  @override
  Widget build(BuildContext context) {
    Provider.of<MovieProvider>(context, listen: false).getMovies();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie List'),
      ),
      body: Consumer<MovieProvider>(
        builder: (context, movieProvider, child) => ListView.builder(
          padding: const EdgeInsets.all(8.0),
          itemBuilder: (context, index) => MovieItem2(movieProvider.movieList[index]),
          itemCount: movies.length,
        ),
      )
    );
  }


  ListView myMovieList1() {
    return ListView(
      padding: EdgeInsets.all(8.0),
      children: movies.map((movie) => ListTile(
        title: Text(movie.name),
        subtitle: Text(movie.category),
        trailing: Text('${movie.rating}'),
        leading: CircleAvatar(),
      )).toList(),
    );
  }
}
