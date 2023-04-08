import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_online_course/core/utils/hive_storage.dart';
import 'package:flutter_online_course/feature/counter/data/models/movie_card_model.dart';
import 'package:flutter_online_course/feature/counter/presentation/blocs/movie_cubit/movie_cubit.dart';

class MovieListWidget extends StatefulWidget {
  const MovieListWidget(
      {super.key, required this.movieFetched, required this.onClick});

  final Function(int id) onClick;
  final MovieFetched movieFetched;

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  final Set<MovieCardModel> movieCollection = {};

  List<MovieCardModel> _storedList = [];

  @override
  void initState() {
    super.initState();
    _storedList = _fetchStoredMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: widget.movieFetched.moviesCard.length,
        itemBuilder: (context, index) {
          final movie = widget.movieFetched.moviesCard[index];

          return GestureDetector(
            onTap: () => widget.onClick(movie.id),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                SizedBox(
                  width: 190,
                  height: 400,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      width: 160,
                      fit: BoxFit.fill,
                      imageUrl:
                          'https://image.tmdb.org/t/p/w300${movie.posterPath}',
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        color: Colors.black87,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "${movie.title} ",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              maxLines: 4,
                            ),
                            Text(
                              (movie.releaseDate == "")
                                  ? ""
                                  : "(${movie.releaseDate.year})",
                              style: const TextStyle(color: Colors.white),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              movie.overview,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: const TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {
                        /// STEP:1 add single movie in the set
                        movieCollection.add(movie);

                        /// STEP:2 fetch all the movies from the local storage
                        _storedList = _fetchStoredMovies();

                        /// STEP:3 store all the locally stored list in the set
                        movieCollection.addAll(_storedList);

                        ///STEP:4 convert  [movieCollection] set to List and store in the local storage
                        HiveUtils.storeMovies(movieCollection.toList());

                        // ///solution: 1
                        // _fetchStoredMovies();
                        //
                        // movieCollection.addAll(_storedList);
                        //
                        // final filteredMovie = movieCollection
                        //     .toList()
                        //     .any((element) => element.id == movie.id);
                        //
                        // if (!filteredMovie) {
                        //   movieCollection.add(movie);
                        //   HiveUtils.storeMovies(
                        //       movieCollection.toList().reversed.toList());
                        // }
                        //
                        setState(() {
                          _storedList = _fetchStoredMovies();
                        });
                      },
                      icon: _checkBookMarkedMovie(movie),
                    ),
                  ),
                )
              ],
            ),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 15,
            childAspectRatio: 0.6),
      ),
    );
  }

  Widget _checkBookMarkedMovie(MovieCardModel movie) {
    if (_storedList.any((storedMovie) => storedMovie.title == movie.title)) {
      return const Icon(
        Icons.bookmark_added_sharp,
        color: Colors.purple,
      );
    }
    return const Icon(
      Icons.bookmark_border,
      color: Colors.white,
    );
  }

  List<MovieCardModel> _fetchStoredMovies() {
    final data = HiveUtils.fetchMovies();
    return List<MovieCardModel>.from(data);
  }
}
