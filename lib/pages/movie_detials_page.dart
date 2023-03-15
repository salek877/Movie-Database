import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_database/models/movie_model.dart';
import 'package:movie_database/movie_utils/constants.dart';

class MovieDetailsPage extends StatelessWidget {
  final Movie movie;


  MovieDetailsPage(this.movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text('Details'),
      ),*/
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
            elevation: 10.0,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(movie.name),
              background: Hero(
                  tag: movie.id,
                  child: Image.asset('images/${movie.image}', width: double.infinity, height: 300.0, fit: BoxFit.cover,)
              ),
            ),
          ),
          SliverList(delegate: SliverChildListDelegate(
            [
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                elevation: 10.0,
                child: ListTile(
                  title: Text(movie.name),
                  subtitle: Text(movie.category),
                  trailing: Text('${movie.rating}'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(description),
              ),
            ]
          ))
        ],
      ),
    );
  }

  ListView buildListView() {
    return ListView(
      children: [
        Hero(
          tag: movie.id,
            child: Image.asset('images/${movie.image}', width: double.infinity, height: 300.0, fit: BoxFit.cover,)
        ),
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
          elevation: 10.0,
          child: ListTile(
            title: Text(movie.name),
            subtitle: Text(movie.category),
            trailing: Text('${movie.rating}'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(description),
        ),
      ],
    );
  }
}
