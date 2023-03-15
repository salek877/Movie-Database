import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_database/models/movie_model.dart';
import 'package:movie_database/pages/movie_detials_page.dart';
import 'package:movie_database/providers/Movie_Provider.dart';
import 'package:movie_database/styles/txt_styles.dart';
import 'package:provider/provider.dart';

class MovieItem2 extends StatefulWidget {

  final Movie movie;

  MovieItem2(this.movie);

  @override
  _MovieItem2State createState() => _MovieItem2State();
}

class _MovieItem2State extends State<MovieItem2> {

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => MovieDetailsPage(widget.movie))
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        width: double.infinity,
        height: screenheight * 0.34,
        decoration: BoxDecoration(
          color: Colors.blue.shade300,
          borderRadius: BorderRadius.circular(24.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,

              spreadRadius: 2.0,
              blurRadius: 10.0
            )
          ]
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
                    child: Hero(
                        tag: widget.movie.id,
                        child: Image.asset('images/${widget.movie.image}', width: double.infinity, height: 190.0, fit: BoxFit.cover,)
                    ),
                ),
                Positioned(
                  right: 10.0,
                  child: IconButton(
                      icon: Icon(
                        widget.movie.isFavorite ? Icons.favorite : Icons.favorite_border_outlined, size: screenheight * 0.06, color: Colors.red,),
                      onPressed: (){
                        Provider.of<MovieProvider>(context, listen: false).toggleFavorite(widget.movie.id);
                      },
                  ),
                ),
                Positioned(
                  bottom: 10.0,
                    left: 5.0,
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                        color: Colors.black.withOpacity(0.5),
                        child: Text(widget.movie.name, style: movieTitleText,),
                        )
                    ),
                Positioned(
                  right: 10.0,
                  bottom: 10.0,
                  child: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red, size: 40.0,),
                    onPressed: () {
                      Provider.of<MovieProvider>(context, listen: false).deleteMovie(widget.movie);
                    },
                  ),
                )
              ],
            ),
            
            Padding(padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(widget.movie.category, style: movieRowInfoItem),
                Text('${widget.movie.releaseYear}', style: movieRowInfoItem),
                Text('${widget.movie.rating}', style: movieRowInfoItem),
              ],
            ),
            )
          ],
        ),
      ),
    );
  }
}
