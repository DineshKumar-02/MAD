# Experiment 5: Develop a Movie Rating Application (Similar to IMDB)

## Aim
To develop a movie rating application allowing users to view movies, view ratings, and submit dynamic ratings and reviews.

## Architecture & Features
- **Data Entities**:
  - `Movie`: title, genre, release year, description, icon
  - `Rating`: user, movie title, numeric rating (1-10), review comments
- **Business Logic**:
  - `addMovie()`: Appends new titles to catalog
  - `rateMovie()`: Collects and associates ratings with movie titles
  - `getAverageRating()`: Computes mathematical mean rating
- **UI Components**:
  - IMDb dark theme styled cards
  - Real-time search filter by title or genre
  - Interactive rating dialog with slider and user reviews bottom sheet modal

## Files
- `lib/main.dart`: Complete Flutter IMDb mobile application.
- `kotlin/MovieRatingSystem.kt`: Kotlin console program from the lab manual.

## Result
The movie rating application (similar to IMDB) has been developed and executed successfully.
