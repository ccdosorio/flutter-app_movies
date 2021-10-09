import 'package:flutter/material.dart';
import 'package:flutter_app_peliculas/providers/movies_provider.dart';
import 'package:flutter_app_peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    // print(moviesProvider.onDisplayMovies);
    return Scaffold(
      appBar: AppBar(
        title: Text('Películas en cines'),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search_outlined),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Tarjetas principales
            CardSwiper(movies: moviesProvider.onDisplayMovies),
            // Slider de películas favoritas
            MovieSlider(
              movies: moviesProvider.popularMovies,
              title: 'Películas Populares!',
              onNextPage: () => moviesProvider.gePopularMovies(),
            ),
          ],
        ),
      ),
    );
  }
}
