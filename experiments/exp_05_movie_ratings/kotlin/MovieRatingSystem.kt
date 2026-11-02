// Experiment 5: Kotlin Movie Rating System from Lab Manual
data class Movie(val title: String, val genre: String, val releaseYear: Int)

data class Rating(val user: String, val movie: String, val rating: Double)

class MovieRatingSystem {
    private val movies = mutableListOf<Movie>()
    private val ratings = mutableListOf<Rating>()

    fun addMovie(movie: Movie) {
        movies.add(movie)
    }

    fun rateMovie(user: String, movieTitle: String, rating: Double) {
        val movie = movies.find { it.title == movieTitle }
        if (movie != null) {
            val userRating = Rating(user, movieTitle, rating)
            ratings.add(userRating)
            println("Rating added successfully.")
        } else {
            println("Movie not found.")
        }
    }

    fun getAverageRating(movieTitle: String): Double {
        val movieRatings = ratings.filter { it.movie == movieTitle }
        return if (movieRatings.isNotEmpty()) {
            val totalRating = movieRatings.map { it.rating }.sum()
            totalRating / movieRatings.size
        } else {
            0.0
        }
    }

    fun listMovies() {
        movies.forEach {
            println("${it.title} (${it.releaseYear}) - ${it.genre}")
        }
    }
}

fun main() {
    val movieRatingSystem = MovieRatingSystem()

    // Adding movies
    movieRatingSystem.addMovie(Movie("Inception", "Sci-Fi", 2010))
    movieRatingSystem.addMovie(Movie("The Shawshank Redemption", "Drama", 1994))
    movieRatingSystem.addMovie(Movie("The Dark Knight", "Action", 2008))

    // Listing movies
    println("Available Movies:")
    movieRatingSystem.listMovies()

    // Rating movies
    movieRatingSystem.rateMovie("user1", "Inception", 9.0)
    movieRatingSystem.rateMovie("user2", "Inception", 8.5)
    movieRatingSystem.rateMovie("user1", "The Dark Knight", 9.5)

    // Getting average ratings
    println("Average Rating for Inception: ${movieRatingSystem.getAverageRating("Inception")}")
    println("Average Rating for The Shawshank Redemption: ${movieRatingSystem.getAverageRating("The Shawshank Redemption")}")
    println("Average Rating for The Dark Knight: ${movieRatingSystem.getAverageRating("The Dark Knight")}")
}
