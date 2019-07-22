class Movies {
  List<Movie> items = List();

  Movies();

  Movies.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final movie = Movie.fromJsonMap(item);
      items.add(movie);
    }
  }

}

class Movie {
  int voteCount;
  int id;
  bool video;
  double voteAverage;
  String title;
  double popularity;
  String posterPath;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String backdropPath;
  bool adult;
  String overview;
  String releaseDate;

  Movie({
    this.voteCount,
    this.id,
    this.video,
    this.voteAverage,
    this.title,
    this.popularity,
    this.posterPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.backdropPath,
    this.adult,
    this.overview,
    this.releaseDate,
  });

  Movie.fromJsonMap(Map<String, dynamic> movieJson) {
    voteCount         = movieJson['vote_count'];
    id                = movieJson['id'];
    video             = movieJson['video'];
    voteAverage       = movieJson['vote_average'] / 1;
    title             = movieJson['title'];
    popularity        = movieJson['popularity'] / 1;
    posterPath        = movieJson['poster_path'];
    originalLanguage  = movieJson['original_language'];
    originalTitle     = movieJson['original_title'];
    genreIds          = movieJson['genre_ids'].cast<int>();
    backdropPath      = movieJson['backdrop_path'];
    adult             = movieJson['adult'];
    overview          = movieJson['overview'];
    releaseDate       = movieJson['release_date'];
  }
}