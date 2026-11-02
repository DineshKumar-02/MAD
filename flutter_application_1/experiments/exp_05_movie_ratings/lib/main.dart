import 'package:flutter/material.dart';

void main() => runApp(const MoviesApp());

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Experiment 5 - Movie ratings',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const MoviesPage(),
    );
  }
}

class Movie {
  const Movie(this.title, this.genre, this.rating, this.color, this.icon);

  final String title;
  final String genre;
  final double rating;
  final Color color;
  final IconData icon;
}

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  static const _movies = [
    Movie('Interstellar', 'Sci-Fi', 4.8, Color(0xff263c5a), Icons.public),
    Movie('The Grand Budapest Hotel', 'Comedy', 4.5, Color(0xffb25775), Icons.hotel),
    Movie('Hidden Figures', 'Drama', 4.7, Color(0xff516c48), Icons.auto_awesome),
    Movie('Spider-Man: Into the Spider-Verse', 'Animation', 4.6, Color(0xff8c3153), Icons.bolt),
  ];

  final Map<String, int> _myRatings = {};
  String _genre = 'All';

  @override
  Widget build(BuildContext context) {
    final genres = ['All', ..._movies.map((movie) => movie.genre).toSet()];
    final movies = _genre == 'All'
        ? _movies
        : _movies.where((movie) => movie.genre == _genre).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Ratings'),
        actions: [
          IconButton(
            tooltip: 'My ratings',
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${_myRatings.length} movies rated')),
            ),
            icon: const Icon(Icons.star_outline),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 56,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              scrollDirection: Axis.horizontal,
              children: [
                for (final genre in genres)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                    child: ChoiceChip(
                      label: Text(genre),
                      selected: _genre == genre,
                      onSelected: (_) => setState(() => _genre = genre),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                final myRating = _myRatings[movie.title];
                return Card(
                  clipBehavior: Clip.antiAlias,
                  margin: const EdgeInsets.only(bottom: 12),
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        color: movie.color,
                        child: Center(
                          child: Icon(movie.icon, color: Colors.white, size: 52),
                        ),
                      ),
                      ListTile(
                        title: Text(movie.title),
                        subtitle: Text('${movie.genre}  •  ${movie.rating}/5 average'),
                        trailing: const Icon(Icons.movie_outlined),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
                        child: Row(
                          children: [
                            const Text('Your rating:'),
                            const SizedBox(width: 8),
                            for (var star = 1; star <= 5; star++)
                              IconButton(
                                visualDensity: VisualDensity.compact,
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(minWidth: 32),
                                onPressed: () => setState(
                                  () => _myRatings[movie.title] = star,
                                ),
                                icon: Icon(
                                  star <= (myRating ?? 0)
                                      ? Icons.star
                                      : Icons.star_border,
                                  color: Colors.amber.shade800,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
